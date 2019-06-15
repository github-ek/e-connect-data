CREATE PROCEDURE [dbo].[EnviarMensajesDeManufacturaJda]
AS
BEGIN
    --SET NOCOUNT ON;
    ------------------------------------------------------------------------------------------------------
    -- GENERAR UNA TABLA TEMPORAL POR CADA SEGMENTO 
    ------------------------------------------------------------------------------------------------------
    BEGIN
        IF OBJECT_ID('tempdb..#mensajes') IS NOT NULL BEGIN
		    DROP TABLE #mensajes
	    END

        SELECT
             c.codigo AS cliente_codigo
	        ,d.codigo AS servicio_codigo
            ,a.*
        INTO #mensajes
        FROM dbo.mensajes_manufactura_jda a
        INNER JOIN [$(eConnect)].dbo.ordenes_manufactura b ON
            b.id_orden_manufactura = a.id_orden_manufactura
        INNER JOIN [$(eConnect)].dbo.clientes c ON
            c.id_cliente = b.id_cliente
        INNER JOIN [$(eConnect)].dbo.servicios d ON
            d.id_servicio = b.id_servicio
        WHERE 1 = 1
        AND a.estado = 'NO_PROCESADO'
        AND a.wko_typ <> 'ARMOFT'
    END

    BEGIN
	    IF OBJECT_ID('tempdb..#ctrl_seg') IS NOT NULL BEGIN
            DROP TABLE #ctrl_seg
        END
       
        SELECT
             a.id_mensaje

            ,'WO_TRAN' AS trnnam
		    ,'2015.1' AS trnver
            ,wh_id AS whse_id
        INTO #ctrl_seg
        FROM #mensajes a

        IF OBJECT_ID('tempdb..#header_seg') IS NOT NULL BEGIN
		    DROP TABLE #header_seg
        END

		SELECT
             a.id_mensaje
            
			,'HEADER_SEG' AS segnam
            ,'A' AS trntyp
            ,client_id
            ,CASE a.wko_typ WHEN 'DSESTAMPIL' THEN 'DSENSAMBLE' ELSE a.wko_typ END AS wko_typ
            ,wkonum
            ,wkorev
            ,prtnum
            ,invsts
            ,wkoqty
            ,prcpri
            ,prcare
            ,prdlin
            ,prd_tol_pct
		INTO #header_seg
		FROM #mensajes a

		IF OBJECT_ID('tempdb..#line_seg') IS NOT NULL BEGIN
			DROP TABLE #line_seg
		END

		SELECT
			 a.id_mensaje
            
			,'LINE_SEG' AS segnam
            ,b.wkolin
            ,b.prtnum
            ,FORMAT(b.linqty,'#0.####','en-US') AS linqty
            ,FORMAT(b.bom_cnsqty,'#0.####','en-US') AS bom_cnsqty
            ,a.client_id AS prt_client_id
            ,b.invsts
            ,b.invsts_prg
            ,b.orgcod
            ,b.lotnum
            ,b.ordinv
            ,b.dte_code
		INTO #line_seg
		FROM #mensajes a
        INNER JOIN dbo.mensajes_manufactura_jda_lineas b ON
            b.id_mensaje = a.id_mensaje
    END

	------------------------------------------------------------------------------------------------------
	-- GENERAR UN DOCUMENTO XML POR CADA ORDEN
	------------------------------------------------------------------------------------------------------
    BEGIN
    	DECLARE @id_mensaje INT
        DECLARE @cliente_codigo VARCHAR(20)
        DECLARE @servicio_codigo VARCHAR(20)
	    DECLARE @numero_orden VARCHAR(100)
	    DECLARE @xml XML

        DECLARE cursor_mensajes CURSOR LOCAL FOR  
        SELECT
             a.id_mensaje
            ,a.cliente_codigo
	        ,a.servicio_codigo
	        ,a.wkonum
        FROM #mensajes a
        ORDER BY
            a.id_mensaje

        DECLARE @DIRECTORIO_ENTRADAS VARCHAR(255)
        DECLARE @SYSDATE DATETIME2(0)
        DECLARE @SYSDATE_STRING VARCHAR(20)

        SET @SYSDATE = SYSDATETIME()
        SET @SYSDATE_STRING = REPLACE(REPLACE(REPLACE(CONVERT(VARCHAR(20),@SYSDATE,120),':',''),'-',''),' ','-')
        
        SELECT
            @DIRECTORIO_ENTRADAS = a.valor
        FROM [$(eConfig)].dbo.configuraciones a
        WHERE
            a.codigo = 'wms.directorios.entradas'

	    OPEN cursor_mensajes
	    FETCH NEXT FROM cursor_mensajes INTO @id_mensaje, @cliente_codigo, @servicio_codigo, @numero_orden
	    WHILE @@FETCH_STATUS = 0  
	    BEGIN
		    BEGIN TRY
			    BEGIN
				    SELECT
					    @xml =
                        (
                        SELECT
                             trnnam
                            ,trnver
                            ,whse_id

                            ,header_seg.segnam
                            ,header_seg.trntyp
                            ,header_seg.client_id
                            ,header_seg.prcpri
                            ,header_seg.wkonum
                            ,header_seg.wkorev
                            ,header_seg.prtnum
                            ,header_seg.wkoqty
                            ,header_seg.prd_tol_pct
                            ,header_seg.prcare
                            ,header_seg.invsts
                            ,header_seg.prdlin
                            ,header_seg.wko_typ

                            ,line_seg.segnam
                            ,line_seg.wkolin
                            ,line_seg.prtnum
                            ,line_seg.linqty
                            ,line_seg.bom_cnsqty

                            ,line_seg.prt_client_id
                            ,line_seg.invsts
                            ,line_seg.invsts_prg
                            ,line_seg.orgcod
                            ,line_seg.lotnum
                            ,line_seg.ordinv
                            ,line_seg.dte_code
                        FROM #ctrl_seg AS CTRL_SEG
                        INNER JOIN #header_seg AS HEADER_SEG ON
                            HEADER_SEG.id_mensaje = CTRL_SEG.id_mensaje
                        INNER JOIN #line_seg AS LINE_SEG ON
                            LINE_SEG.id_mensaje = HEADER_SEG.id_mensaje
                        WHERE
                            CTRL_SEG.id_mensaje = @id_mensaje
                        ORDER BY
                            LINE_SEG.wkolin
                        FOR XML AUTO, ELEMENTS, ROOT('WO_INB_IFD'), TYPE
                    )

                    SET @xml.modify('delete //LOTNUM[string-length()=0]')
			    END
				
			    ------------------------------------------------------------------------------------------------------
			    -- GENERAR ARCHIVOS XML Y TRG
			    ------------------------------------------------------------------------------------------------------
			    BEGIN
				    DECLARE @FILENAME_XML VARCHAR(1024)
				    DECLARE @FILENAME_TRG VARCHAR(1024)
				    DECLARE @DATA VARCHAR(MAX) = CAST(@xml AS VARCHAR(MAX))

				    SET @FILENAME_XML = CONCAT('WMS-',@SYSDATE_STRING,'-',@servicio_codigo,'-',@cliente_codigo,'-',@numero_orden,'.XML')
				    SET @FILENAME_TRG = CONCAT('WMS-',@SYSDATE_STRING,'-',@servicio_codigo,'-',@cliente_codigo,'-',@numero_orden,'.TRG')
                    
                    PRINT @DATA
                    PRINT @DIRECTORIO_ENTRADAS
                    PRINT @FILENAME_XML
				    EXECUTE [$(eIntegration)].dbo.WriteStringToFile @DATA, @DIRECTORIO_ENTRADAS, @FILENAME_XML
				    EXECUTE [$(eIntegration)].dbo.WriteStringToFile 'TRG', @DIRECTORIO_ENTRADAS, @FILENAME_TRG
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
                    FROM dbo.mensajes_manufactura_jda a
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
            
		    FETCH NEXT FROM cursor_mensajes INTO @id_mensaje, @cliente_codigo, @servicio_codigo, @numero_orden
	    END 

	    CLOSE cursor_mensajes
	    DEALLOCATE cursor_mensajes
    END
END