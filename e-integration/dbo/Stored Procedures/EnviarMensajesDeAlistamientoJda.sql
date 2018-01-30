CREATE PROCEDURE [dbo].[EnviarMensajesDeAlistamientoJda]
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
        FROM [$(eConnect)].dbo.mensajes_alistamiento_jda a
        INNER JOIN [$(eConnect)].dbo.ordenes_alistamiento b ON
            b.id_orden_alistamiento = a.id_orden_alistamiento
        INNER JOIN [$(eConnect)].dbo.clientes c ON
            c.id_cliente = b.id_cliente
        INNER JOIN [$(eConnect)].dbo.servicios d ON
            d.id_servicio = b.id_servicio
        WHERE
	        a.estado = 'NO_PROCESADO'
    END

    BEGIN
	    IF OBJECT_ID('tempdb..#ctrl_seg') IS NOT NULL BEGIN
            DROP TABLE #ctrl_seg
        END
       
        SELECT
             a.id_mensaje

            ,'IMPORTPEDIDOS' AS trnnam
		    ,'2015.1' AS trnver
            ,whse_id
        INTO #ctrl_seg
        FROM #mensajes a

        IF OBJECT_ID('tempdb..#order_seg') IS NOT NULL BEGIN
		    DROP TABLE #order_seg
        END

		SELECT
             a.id_mensaje
            
			,'SEG' AS segnam
            ,'A' AS trntyp
            ,client_id
            ,ordnum
            ,ordtyp
            ,COALESCE(REPLACE(CONVERT(VARCHAR(10),cpodte,120),'-','')+'000000','') AS cpodte
            ,whse_id AS wh_id
            ,shipby
            ,rmanum
            ,bus_grp
            ,stcust
            ,st_host_adr_id
            ,rtcust
            ,rt_host_adr_id
            ,btcust
            ,bt_host_adr_id
		INTO #order_seg
		FROM #mensajes a

		IF OBJECT_ID('tempdb..#line_seg') IS NOT NULL BEGIN
			DROP TABLE #line_seg
		END

		SELECT
			 a.id_mensaje
            
			,'LINE_SEG' AS segnam
            ,client_id AS prt_client_id
            ,ordnum 
            ,ordlin
            ,ordsln
            ,prtnum
            ,ordqty
            ,invsts
            ,invsts_prg
            ,lotnum
            ,splflg
            ,carcod
            ,srvlvl
            ,ordinv
            ,pckgr1
            ,pckgr2
            ,pckgr3
            ,pckgr4
		INTO #line_seg
		FROM #mensajes a
        INNER JOIN [$(eConnect)].dbo.mensajes_alistamiento_jda_lineas b ON
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
	        ,a.ordnum
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

                            ,order_seg.segnam
                            ,trntyp
                            ,client_id
                            ,order_seg.ordnum
                            ,ordtyp
                            ,wh_id
                            ,shipby
                            ,rmanum
                            ,bus_grp

                            ,stcust
                            ,st_host_adr_id
                            ,rtcust
                            ,rt_host_adr_id
                            ,btcust
                            ,bt_host_adr_id
                            ,cpodte

                            ,order_line_seg.segnam
                            ,prt_client_id
                            ,wh_id
                            ,order_line_seg.ordnum 
                            ,ordlin
                            ,ordsln
                            ,prtnum
                            ,ordqty
                            ,invsts
                            ,invsts_prg
                            ,lotnum
                            ,splflg
                            ,carcod
                            ,srvlvl
                            ,ordinv
                            ,pckgr1
                            ,pckgr2
                            ,pckgr3
                            ,pckgr4
                        FROM #ctrl_seg AS CTRL_SEG
                        INNER JOIN #order_seg AS ORDER_SEG ON
                            ORDER_SEG.id_mensaje = CTRL_SEG.id_mensaje
                        INNER JOIN #line_seg AS ORDER_LINE_SEG ON
                            ORDER_LINE_SEG.id_mensaje = CTRL_SEG.id_mensaje
                        WHERE
                            CTRL_SEG.id_mensaje = @id_mensaje
                        ORDER BY
                            ORDER_SEG.ordnum,ordlin
                        FOR XML AUTO, ELEMENTS, ROOT('UC_X4_ORDENPEDIDO'), TYPE
					        )

                    SET @xml.modify('delete //CPODTE[string-length()=0]')
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
                    FROM [$(eConnect)].dbo.mensajes_alistamiento_jda a
                    WHERE
                        a.id_mensaje = @id_mensaje

				    COMMIT TRANSACTION
			    END
		    END TRY
		    BEGIN CATCH
                DECLARE @ERROR NVARCHAR(4000) = ERROR_MESSAGE()
        
			    IF @@TRANCOUNT > 0 BEGIN
				    ROLLBACK TRANSACTION
			    END;
			    PRINT 'OCURRIO EL SIGUIENTE ERROR AL GENERAR LA ORDEN '+@numero_orden+':'+@ERROR
		    END CATCH
            
		    FETCH NEXT FROM cursor_mensajes INTO @id_mensaje, @cliente_codigo, @servicio_codigo, @numero_orden
	    END 

	    CLOSE cursor_mensajes
	    DEALLOCATE cursor_mensajes
    END
END