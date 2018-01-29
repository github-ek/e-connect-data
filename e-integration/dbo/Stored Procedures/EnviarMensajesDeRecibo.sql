CREATE PROCEDURE [dbo].[EnviarMensajesDeRecibo]
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
        FROM [$(eConnect)].dbo.mensajes_recibo_jda a
        INNER JOIN [$(eConnect)].dbo.ordenes_recibo b ON
            b.id_orden_recibo = a.id_orden_recibo
        INNER JOIN [$(eConnect)].dbo.clientes c ON
            c.id_cliente = b.id_cliente
        INNER JOIN [$(eConnect)].dbo.servicios d ON
            d.id_servicio = b.id_servicio
        WHERE
	        a.estado = 'NO_PROCESADO'

	    IF OBJECT_ID('tempdb..#ctrl_seg') IS NOT NULL BEGIN
            DROP TABLE #ctrl_seg
        END

        
        SELECT
             id_orden_recibo

            ,'ORDCOMP_ESB' AS trnnam
		    ,'ESB2015.1' AS trnver
            ,whse_id
        INTO #ctrl_seg
        FROM #mensajes a

        IF OBJECT_ID('tempdb..#header_seg') IS NOT NULL BEGIN
		    DROP TABLE #header_seg
        END

		SELECT
             id_orden_recibo
            
			,'CABECERA' AS segnam
            ,'A' AS trntyp
			,invnum
			,supnum
			,invtyp
			,client_id
			,rimsts
			,invdte
		INTO #header_seg
		FROM #mensajes a

		IF OBJECT_ID('tempdb..#line_seg') IS NOT NULL BEGIN
			DROP TABLE #line_seg
		END

		SELECT
			 id_orden_recibo
            
			,'LINEA' AS segnam
			,invlin
			,invsln
			,prtnum
			,lotnum
			,expqty
			,rcvsts
			,inv_attr_str7
		INTO #line_seg
		FROM #mensajes a
        INNER JOIN [$(eConnect)].dbo.mensajes_recibo_jda_lineas b ON
            b.id_mensaje = a.id_mensaje
    END

	------------------------------------------------------------------------------------------------------
	-- GENERAR UN DOCUMENTO XML POR CADA ORDEN
	------------------------------------------------------------------------------------------------------
    BEGIN
    	DECLARE @id_orden INT
        DECLARE @cliente_codigo VARCHAR(20)
        DECLARE @servicio_codigo VARCHAR(20)
	    DECLARE @CLIENT_ID VARCHAR(100)
	    DECLARE @INVNUM VARCHAR(100)
	    DECLARE @xml XML

        DECLARE cursor_ordenes CURSOR LOCAL FOR  
        SELECT
             a.id_orden_recibo
            ,a.cliente_codigo
	        ,a.servicio_codigo
	        ,a.client_id
	        ,a.invnum
        FROM #mensajes a
        ORDER BY
            a.id_orden_recibo

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

	    OPEN cursor_ordenes
	    FETCH NEXT FROM cursor_ordenes INTO @id_orden, @cliente_codigo, @servicio_codigo, @CLIENT_ID, @INVNUM
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
					        ,trntyp
					        ,invnum
					        ,supnum
					        ,invtyp
					        ,client_id
					        ,rimsts
					        ,invdte

					        ,line_seg.segnam
					        ,invlin
					        ,invsln
					        ,prtnum
					        ,lotnum
					        ,expqty
					        ,rcvsts
					        ,inv_attr_str7
				        FROM #ctrl_seg AS ctrl_seg
				        INNER JOIN #header_seg AS header_seg ON
					        header_seg.id_orden_recibo = ctrl_seg.id_orden_recibo
				        INNER JOIN #line_seg AS line_seg ON
					        line_seg.id_orden_recibo = ctrl_seg.id_orden_recibo
				        WHERE
					        ctrl_seg.id_orden_recibo = @id_orden
				        ORDER BY
					        invnum,invlin
				        FOR XML AUTO, ELEMENTS, ROOT('UC_RA_INB_IFD'), TYPE
					        )

				    SET @xml.modify('delete //lotnum[string-length()=0]')
				    SET @xml.modify('delete //inv_attr_str7[string-length()=0]')
			    END
				
			    ------------------------------------------------------------------------------------------------------
			    -- GENERAR ARCHIVOS XML Y TRG
			    ------------------------------------------------------------------------------------------------------
			    BEGIN
				    DECLARE @FILENAME_XML VARCHAR(1024)
				    DECLARE @FILENAME_TRG VARCHAR(1024)
				    DECLARE @DATA VARCHAR(MAX) = CAST(@xml AS VARCHAR(MAX))

				    SET @FILENAME_XML = CONCAT('WMS-',@SYSDATE_STRING,'-',@servicio_codigo,'-',@cliente_codigo,'-',@INVNUM,'.XML')
				    SET @FILENAME_TRG = CONCAT('WMS-',@SYSDATE_STRING,'-',@servicio_codigo,'-',@cliente_codigo,'-',@INVNUM,'.TRG')
                    
                    PRINT @DATA
                    PRINT @DIRECTORIO_ENTRADAS
                    PRINT @FILENAME_XML
				    EXECUTE dbo.WriteStringToFile @DATA, @DIRECTORIO_ENTRADAS, @FILENAME_XML
				    EXECUTE dbo.WriteStringToFile 'TRG', @DIRECTORIO_ENTRADAS, @FILENAME_TRG
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
                    FROM [$(eConnect)].dbo.mensajes_recibo_jda a
                    WHERE
                        a.id_orden_recibo = @id_orden

                    UPDATE a
                    SET 
                         a.estado = 'MENSAJE_ENVIADO'
                        ,a.[version] = a.[version] + 1
                        ,a.fecha_modificacion = SYSDATETIME()
                        ,a.usuario_modificacion = SYSTEM_USER
                    FROM [$(eConnect)].dbo.ordenes_recibo a
                    WHERE
                        a.id_orden_recibo = @id_orden

				    COMMIT TRANSACTION
			    END
		    END TRY
		    BEGIN CATCH
                DECLARE @ERROR NVARCHAR(4000) = ERROR_MESSAGE()
        
			    IF @@TRANCOUNT > 0 BEGIN
				    ROLLBACK TRANSACTION
			    END;
			    PRINT 'OCURRIO EL SIGUIENTE ERROR AL GENERAR LA ORDEN '+@INVNUM+':'+@ERROR
		    END CATCH
            
		    FETCH NEXT FROM cursor_ordenes INTO @id_orden, @cliente_codigo, @servicio_codigo, @CLIENT_ID, @INVNUM
	    END 

	    CLOSE cursor_ordenes  
	    DEALLOCATE cursor_ordenes
    END
END