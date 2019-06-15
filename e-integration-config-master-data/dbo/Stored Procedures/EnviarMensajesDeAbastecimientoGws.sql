CREATE PROCEDURE [dbo].[EnviarMensajesDeAbastecimientoGws]
AS
BEGIN
    --SET NOCOUNT ON;
    ------------------------------------------------------------------------------------------------------
    -- GENERAR UNA TABLA TEMPORAL POR CADA SEGMENTO 
    ------------------------------------------------------------------------------------------------------
    BEGIN
        IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
		    DROP TABLE #source
	    END

        SELECT
             a.*
        INTO #source
        FROM [eStage].dbo.mensajes_abastecimientos_gws a
        WHERE
	        a.estado = 'NO_PROCESADO'
    END
    
    --CONSOLIDAR SEGMENTOS DEL DOCUMENTO XML 
    BEGIN
        IF OBJECT_ID('tempdb..#AdmInfo') IS NOT NULL BEGIN
            DROP TABLE #AdmInfo
        END

        SELECT
             67 AS [Object]
            ,2 AS [Version]
        INTO #AdmInfo

        IF OBJECT_ID('tempdb..#mensajes') IS NOT NULL BEGIN
            DROP TABLE #mensajes
        END

        SELECT
             id_mensaje

            ,DocDate
            ,DueDate
            ,CardCode
            ,Series
            ,FromWarehouse
            ,TaxDate
            ,[Address]
            ,Comments
            ,DocObjectCode
            ,U_BKV_UID
            ,U_GW_Fecha1
            ,U_GW_Fecha2
            ,U_Ocompra
            ,U_GW_PRE_DOC_ORG
            ,U_GW_NU_DOC_ORG
            ,U_GW_PRE_DOC_ANT
            ,U_GW_NU_DOC_ANT
        INTO #mensajes
        FROM #source AS a

        
        IF OBJECT_ID('tempdb..#mensajes_lineas') IS NOT NULL BEGIN
            DROP TABLE #mensajes_lineas
        END

        SELECT
             b.*
        INTO #mensajes_lineas
        FROM #mensajes a
        INNER JOIN [eStage].dbo.mensajes_abastecimientos_gws_lineas b ON
            b.id_mensaje = a.id_mensaje
    END


	------------------------------------------------------------------------------------------------------
	-- GENERAR UN DOCUMENTO XML POR CADA ORDEN
	------------------------------------------------------------------------------------------------------
    BEGIN
    	DECLARE @id_mensaje INT
	    DECLARE @numero_orden VARCHAR(100)
	    DECLARE @xml XML

        DECLARE cursor_mensajes CURSOR LOCAL FOR  
        SELECT
             a.id_mensaje 
            ,a.U_GW_NU_DOC_ORG
        FROM #mensajes a
        ORDER BY
            a.id_mensaje

        DECLARE @DIRECTORIO_ENTRADAS VARCHAR(255)
        DECLARE @SYSDATE DATETIME2(0)
        DECLARE @SYSDATE_STRING VARCHAR(20)

        SET @SYSDATE = SYSDATETIME()
        SET @SYSDATE_STRING = REPLACE(REPLACE(REPLACE(CONVERT(VARCHAR(20),@SYSDATE,120),':',''),'-',''),' ','-')
        
        SELECT
            @DIRECTORIO_ENTRADAS = 'C:\APPS_FTP\ESB\INTEGRACIONES\GWS\SALIDAS\ORDENES\ABASTECIMIENTOS'

	    OPEN cursor_mensajes
	    FETCH NEXT FROM cursor_mensajes INTO @id_mensaje, @numero_orden
	    WHILE @@FETCH_STATUS = 0  
	    BEGIN
		    BEGIN TRY
			    BEGIN
				    SELECT
					    @xml =
                        (
                        SELECT
                             Object AS "AdmInfo/Object"
                            ,Version AS "AdmInfo/Version"
                            ,(
                            SELECT
                                 DocDate
                                ,DueDate
                                ,CardCode
                                ,Series
                                ,FromWarehouse
                                ,TaxDate
                                ,Address
                                ,Comments
                                ,DocObjectCode
                                ,U_BKV_UID
                                ,U_GW_Fecha1
                                ,U_GW_Fecha2
                                ,U_Ocompra
                                ,U_GW_PRE_DOC_ORG
                                ,U_GW_NU_DOC_ORG
                                ,U_GW_PRE_DOC_ANT
                                ,U_GW_NU_DOC_ANT
                            FROM #mensajes
                            WHERE
                                id_mensaje = @id_mensaje
                            FOR XML PATH, ROOT('StockTransfer'), TYPE
                            )
                            ,(
                            SELECT
                                 LineNum
                                ,ItemCode
                                ,Quantity
                                ,U_VuCadena
                                ,U_VIcoCadena
                                ,WarehouseCode
                                ,ProjectCode
                                ,U_Comentariosl
                            FROM #mensajes_lineas 
                            WHERE
                                id_mensaje = @id_mensaje
                            FOR XML PATH, ROOT('StockTransfer_Lines'), TYPE
                            )
                        FROM #AdmInfo
                        FOR XML PATH('BO'), ROOT('BOM'), TYPE
                        )
			    END

                
				
			    ------------------------------------------------------------------------------------------------------
			    -- GENERAR ARCHIVOS XML Y TRG
			    ------------------------------------------------------------------------------------------------------
			    BEGIN
				    DECLARE @FILENAME_XML VARCHAR(1024)
				    DECLARE @DATA VARCHAR(MAX) = CAST(@xml AS VARCHAR(MAX))

				    SET @FILENAME_XML = CONCAT('WMS-',@SYSDATE_STRING,'-',@numero_orden,'-',@id_mensaje,'.XML')
                    
                    PRINT @DATA
                    PRINT @DIRECTORIO_ENTRADAS
                    PRINT @FILENAME_XML
				    EXECUTE dbo.WriteStringToFile @DATA, @DIRECTORIO_ENTRADAS, @FILENAME_XML
			    END

			    ------------------------------------------------------------------------------------------------------
			    -- ACTUALIZAR ESTADO DE LAS ORDENES
			    ------------------------------------------------------------------------------------------------------
			    BEGIN
				    BEGIN TRANSACTION

                    UPDATE a
                    SET 
                         a.estado = 'ENVIADO'
                        ,a.fecha_envio = SYSDATETIME()
                        ,a.[version] = a.[version] + 1
                        ,a.fecha_modificacion = SYSDATETIME()
                        ,a.usuario_modificacion = SYSTEM_USER
                    FROM [eStage].dbo.mensajes_abastecimientos_gws a
                    WHERE
                        a.id_mensaje = @id_mensaje

				    COMMIT TRANSACTION
			    END
		    END TRY
		    BEGIN CATCH
			    IF @@TRANCOUNT > 0 BEGIN
				    ROLLBACK TRANSACTION
			    END;
                PRINT CONCAT('OCURRIO EL SIGUIENTE ERROR AL GENERAR LA ORDEN ',@numero_orden,':',ERROR_MESSAGE())
		    END CATCH
            
		    FETCH NEXT FROM cursor_mensajes INTO @id_mensaje, @numero_orden
	    END 

	    CLOSE cursor_mensajes  
	    DEALLOCATE cursor_mensajes
    END
END