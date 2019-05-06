CREATE PROCEDURE [dbo].[EnviarMensajesDeManufacturaBomJda]
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
        AND a.wko_typ = 'ARMOFT' 
    END

    BEGIN
	    IF OBJECT_ID('tempdb..#ctrl_seg') IS NOT NULL BEGIN
            DROP TABLE #ctrl_seg
        END
       
        SELECT
             a.id_mensaje

            ,'WO_TRAN' AS TRNNAM
		    ,'2015.1' AS TRNVER
            ,WH_ID AS WHSE_ID
        INTO #ctrl_seg
        FROM #mensajes a

        IF OBJECT_ID('tempdb..#header_seg') IS NOT NULL BEGIN
		    DROP TABLE #header_seg
        END

		SELECT
             a.id_mensaje
            
			,'HEADER_SEG' AS SEGNAM
            ,'A' AS TRNTYP
            ,CLIENT_ID
            ,CASE a.WKO_TYP WHEN 'DSESTAMPIL' THEN 'DSENSAMBLE' ELSE a.WKO_TYP END AS WKO_TYP
            ,WKONUM
            ,WKOREV
            ,PRTNUM
            ,INVSTS
            ,WKOQTY
            ,PRCPRI
            ,PRCARE
            ,PRDLIN
            ,PRD_TOL_PCT
		INTO #header_seg
		FROM #mensajes a

		IF OBJECT_ID('tempdb..#line_seg') IS NOT NULL BEGIN
			DROP TABLE #line_seg
		END

		SELECT
			 a.id_mensaje
            
			,'LINE_SEG' AS segnam
            ,b.WKOLIN
            ,b.PRTNUM
            ,FORMAT(b.LINQTY,'#0.####','en-US') AS LINQTY
            ,FORMAT(b.BOM_CNSQTY,'#0.####','en-US') AS BOM_CNSQTY
            ,a.CLIENT_ID AS PRT_CLIENT_ID
            ,b.INVSTS
            ,b.INVSTS_PRG
            ,b.ORGCOD
            ,b.LOTNUM
            ,b.ORDINV
            ,b.DTE_CODE
            ,b.RULE_NAM
		INTO #line_seg
		FROM #mensajes a
        INNER JOIN dbo.mensajes_manufactura_jda_lineas b ON
            b.id_mensaje = a.id_mensaje
            
		IF OBJECT_ID('tempdb..#wo_line_alloc_rule_hdr_seg') IS NOT NULL BEGIN
			DROP TABLE #wo_line_alloc_rule_hdr_seg
		END

		SELECT
			 a.id_mensaje
            ,b.WKOLIN
            
			,'ALLOC_RULE_HDR' AS segnam
            ,b.RULE_NAM
		INTO #wo_line_alloc_rule_hdr_seg
		FROM #mensajes a
        INNER JOIN dbo.mensajes_manufactura_jda_lineas b ON
            b.id_mensaje = a.id_mensaje
        WHERE
            b.rule_nam <> ''

		IF OBJECT_ID('tempdb..#wo_line_alloc_rule_dtl_seg') IS NOT NULL BEGIN
			DROP TABLE #wo_line_alloc_rule_dtl_seg
		END

        ;WITH
        cte_00 AS
        (
		    SELECT
			     a.id_mensaje
                ,b.WKOLIN
            
                ,b.rule_nam
                ,b.lotnum
                ,b.orgcod
		    FROM #mensajes a
            INNER JOIN dbo.mensajes_manufactura_jda_lineas b ON
                b.id_mensaje = a.id_mensaje
            WHERE
                b.rule_nam <> ''
        ),
        cte_01 AS
        (
            SELECT
                 b.id_mensaje
                ,b.WKOLIN
            
                ,ROW_NUMBER() OVER(PARTITION BY b.id_mensaje,b.WKOLIN ORDER BY b.field_name) AS seqnum
                ,b.rule_nam
                ,b.field_name
                ,b.[value]
            FROM cte_00 a
            UNPIVOT ([value] FOR field_name IN (lotnum, orgcod)) b
            WHERE
                b.[value] <> ''
        )
		SELECT
			 a.id_mensaje
            ,a.WKOLIN
            
			,'ALLOC_RULE_DTL' AS segnam
            ,a.rule_nam
            ,a.seqnum
            ,CASE WHEN a.seqnum = 1 THEN '' ELSE 'AND' END AS grpopr
            ,a.field_name
            ,a.[value]
            ,'=' AS operator
		INTO #wo_line_alloc_rule_dtl_seg
		FROM cte_01 a
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
	        ,a.WKONUM
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
                             TRNNAM
                            ,TRNVER
                            ,WHSE_ID

                            ,HEADER_SEG.SEGNAM
                            ,HEADER_SEG.TRNTYP
                            ,HEADER_SEG.CLIENT_ID
                            ,HEADER_SEG.PRCPRI
                            ,HEADER_SEG.WKONUM
                            ,HEADER_SEG.WKOREV
                            ,HEADER_SEG.PRTNUM
                            ,HEADER_SEG.WKOQTY
                            ,HEADER_SEG.PRD_TOL_PCT
                            ,HEADER_SEG.PRCARE
                            ,HEADER_SEG.INVSTS
                            ,HEADER_SEG.PRDLIN
                            ,HEADER_SEG.WKO_TYP

                            ,LINE_SEG.SEGNAM
                            ,LINE_SEG.WKOLIN
                            ,LINE_SEG.PRTNUM
                            ,LINE_SEG.LINQTY
                            ,LINE_SEG.BOM_CNSQTY

                            ,LINE_SEG.PRT_CLIENT_ID
                            ,LINE_SEG.INVSTS
                            ,LINE_SEG.INVSTS_PRG
                            ,LINE_SEG.ORGCOD
                            ,LINE_SEG.RULE_NAM
                            ,LINE_SEG.LOTNUM
                            ,LINE_SEG.ORDINV
                            ,LINE_SEG.DTE_CODE

                            ,WO_LINE_ALLOC_RULE_HDR_SEG.SEGNAM
                            ,WO_LINE_ALLOC_RULE_HDR_SEG.RULE_NAM

                            ,WO_LINE_ALLOC_RULE_DTL_SEG.SEGNAM
                            ,WO_LINE_ALLOC_RULE_DTL_SEG.RULE_NAM
                            ,WO_LINE_ALLOC_RULE_DTL_SEG.SEQNUM
                            ,WO_LINE_ALLOC_RULE_DTL_SEG.FIELD_NAME
                            ,WO_LINE_ALLOC_RULE_DTL_SEG.GRPOPR
                            ,WO_LINE_ALLOC_RULE_DTL_SEG.OPERATOR
                            ,WO_LINE_ALLOC_RULE_DTL_SEG.[VALUE]
                        FROM #ctrl_seg AS CTRL_SEG
                        INNER JOIN #header_seg AS HEADER_SEG ON
                            HEADER_SEG.id_mensaje = CTRL_SEG.id_mensaje
                        INNER JOIN #line_seg AS LINE_SEG ON
                            LINE_SEG.id_mensaje = HEADER_SEG.id_mensaje
                        LEFT OUTER JOIN #wo_line_alloc_rule_hdr_seg AS WO_LINE_ALLOC_RULE_HDR_SEG ON
                            WO_LINE_ALLOC_RULE_HDR_SEG.id_mensaje = LINE_SEG.id_mensaje
                        AND WO_LINE_ALLOC_RULE_HDR_SEG.WKOLIN = LINE_SEG.WKOLIN
                        LEFT OUTER JOIN #wo_line_alloc_rule_dtl_seg AS WO_LINE_ALLOC_RULE_DTL_SEG ON
                            WO_LINE_ALLOC_RULE_DTL_SEG.id_mensaje = WO_LINE_ALLOC_RULE_HDR_SEG.id_mensaje
                        AND WO_LINE_ALLOC_RULE_DTL_SEG.WKOLIN = WO_LINE_ALLOC_RULE_HDR_SEG.WKOLIN
                        WHERE
                            CTRL_SEG.id_mensaje = @id_mensaje
                        ORDER BY
                            WKOLIN
                        FOR XML AUTO, ELEMENTS, ROOT('WO_INB_IFD'), TYPE
                    )

                    SET @xml.modify('delete //LOTNUM[string-length()=0]')
                    SET @xml.modify('delete //*[not(node())]');
                    SET @xml.modify('delete //*[not(node())]');
                    SELECT @xml
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