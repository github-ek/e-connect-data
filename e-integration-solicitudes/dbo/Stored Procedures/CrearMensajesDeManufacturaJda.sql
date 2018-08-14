CREATE PROCEDURE [dbo].[CrearMensajesDeManufacturaJda]
AS
BEGIN TRY
    --SET NOCOUNT ON;

    BEGIN TRANSACTION

    BEGIN
        IF OBJECT_ID('tempdb..#mensajes') IS NOT NULL BEGIN
            DROP TABLE #mensajes
        END

        SELECT
             IDENTITY(BIGINT,1,1) AS id
            ,CAST(NULL AS BIGINT) AS id_mensaje
            ,b.id_orden_manufactura
            ,b.numero_linea
            ,'NO_PROCESADO' AS estado
            ,e.id_bodega

            ,CAST(CONCAT(a.numero_orden,'-',FORMAT(b.numero_linea, '0000')) AS NVARCHAR(20)) AS wkonum
            ,d.codigo_alterno_wms AS client_id
            ,LEFT(c.numero_solicitud,10) AS wkorev
            ,e.codigo AS wh_id
            ,LEFT(f.codigo,10) AS wko_typ

            ,b.producto_codigo AS prtnum
            ,b.id_estado_inventario AS invsts
            ,b.unidades_solicitadas AS wkoqty
            ,'5' AS prcpri
            ,'ACP' AS prcare
            ,'LIN01' AS prdlin
            ,0 AS prd_tol_pct

            ,SYSTEM_USER AS usuario_creacion
            ,SYSDATETIME() AS fecha_creacion
            ,SYSTEM_USER AS usuario_modificacion
            ,SYSDATETIME() AS fecha_modificacion
        INTO #mensajes
        FROM [$(eConnect)].dbo.ordenes_manufactura a
        INNER JOIN [$(eConnect)].dbo.ordenes_manufactura_lineas b ON
            b.id_orden_manufactura = a.id_orden_manufactura
        INNER JOIN [$(eConnect)].dbo.solicitudes c ON
            c.id_solicitud = a.id_solicitud

        INNER JOIN [$(eConnect)].dbo.clientes d ON
            d.id_cliente = a.id_cliente
        INNER JOIN [$(eConnect)].dbo.bodegas e ON
            e.id_bodega = a.id_bodega
        INNER JOIN [$(eConnect)].dbo.servicios f ON
            f.id_servicio = a.id_servicio
        WHERE 1 = 1
        AND a.estado = 'NO_PROCESADA'
        AND a.tipo_orden LIKE 'MANUFACTURA%'

        IF OBJECT_ID('tempdb..#mensajes_lineas') IS NOT NULL BEGIN
            DROP TABLE #mensajes_lineas
        END

        SELECT
             b.id_orden_manufactura
            ,b.numero_linea
            ,b.id

            ,a.client_id AS prt_client_id
            ,a.wh_id

            ,FORMAT(ROW_NUMBER() OVER(PARTITION BY b.id_orden_manufactura,b.numero_linea ORDER BY b.producto_codigo,b.id_estado_inventario,COALESCE(b.id_subestado_inventario,''),b.lote),'0000') AS wkolin
            ,b.producto_codigo AS prtnum
            ,b.unidades AS linqty
            ,CAST(b.unidades AS NUMERIC(19,4)) / CAST(a.wkoqty AS NUMERIC(19,4)) AS bom_cnsqty
            ,b.id_estado_inventario AS invsts
            ,b.id_estado_inventario AS invsts_prg
            ,COALESCE(b.id_subestado_inventario,'') AS orgcod 

            ,CAST('' AS VARCHAR(20)) AS rule_nam 
            ,b.lote AS lotnum
            ,CAST('' AS VARCHAR(30)) AS ordinv
            ,LEFT(COALESCE(c.valor,''),5) AS dte_code
        INTO #mensajes_lineas
        FROM #mensajes a
        INNER JOIN [$(eConnect)].dbo.ordenes_manufactura_lineas_bom b ON
            b.id_orden_manufactura = a.id_orden_manufactura
        AND b.numero_linea = a.numero_linea
        LEFT OUTER JOIN [$(eConnect)].dbo.productos_atributos c ON
            c.id_producto = b.id_producto
        AND c.id_bodega = a.id_bodega
        AND c.codigo = 'DTE_CODE'

        IF OBJECT_ID('tempdb..#mensajes_rule_nam') IS NOT NULL BEGIN
            DROP TABLE #mensajes_rule_nam
        END

        SELECT
             id
            ,CAST(CONCAT('E',FORMAT(NEXT VALUE FOR dbo.sequence_manufacturas_rule_nam OVER (ORDER BY a.id_orden_manufactura, a.numero_linea),'000000000')) AS NVARCHAR(20)) AS rule_nam
        INTO #mensajes_rule_nam
        FROM #mensajes_lineas a
        WHERE 0 = 1
        OR a.lotnum <> '' 
        OR a.orgcod <> ''
        
        UPDATE a
        SET a.rule_nam = b.rule_nam
        FROM #mensajes_lineas a
        INNER JOIN #mensajes_rule_nam b ON
            b.id = a.id

        IF OBJECT_ID('tempdb..#mensajes_lineas_ordinv') IS NOT NULL BEGIN
            DROP TABLE #mensajes_lineas_ordinv
        END

        SELECT
             a.id

            ,a.prt_client_id
            ,a.wh_id
            ,a.dte_code
            ,a.lotnum
            ,a.ordinv
        INTO #mensajes_lineas_ordinv
        FROM #mensajes_lineas a

        EXEC dbo.CalcularOrdInv

        UPDATE a
        SET a.ordinv = b.ordinv
        FROM #mensajes_lineas a
        INNER JOIN #mensajes_lineas_ordinv b ON
            b.id = a.id
    END

    --CREACION DE LOS MENSAJES
    BEGIN
        DECLARE @t AS TABLE(id_mensaje BIGINT,id_orden_manufactura BIGINT,numero_linea INT)
        BEGIN
            INSERT INTO dbo.mensajes_manufactura_jda
                (id_orden_manufactura
                ,numero_linea
                ,estado
            
                ,wkonum
                ,client_id
                ,wkorev
                ,wh_id
                ,wko_typ
                ,prtnum
                ,invsts
                ,wkoqty
                ,prcpri
                ,prcare
                ,prdlin
                ,prd_tol_pct

                ,usuario_creacion
                ,fecha_creacion
                ,usuario_modificacion
                ,fecha_modificacion)
            OUTPUT inserted.id_mensaje, inserted.id_orden_manufactura, inserted.numero_linea
            INTO @t
            SELECT
                 id_orden_manufactura
                ,numero_linea
                ,estado
            
                ,wkonum
                ,client_id
                ,wkorev
                ,wh_id
                ,wko_typ
                ,prtnum
                ,invsts
                ,wkoqty
                ,prcpri
                ,prcare
                ,prdlin
                ,prd_tol_pct

                ,usuario_creacion
                ,fecha_creacion
                ,usuario_modificacion
                ,fecha_modificacion
            FROM #mensajes a

            UPDATE a
            SET a.id_mensaje = b.id_mensaje
            FROM #mensajes a 
            INNER JOIN @t b ON
                b.id_orden_manufactura = a.id_orden_manufactura
            AND b.numero_linea = a.numero_linea

            INSERT INTO dbo.mensajes_manufactura_jda_lineas
                (id_mensaje
                ,numero_sublinea
                ,wkolin
                ,prtnum
                ,linqty
                ,bom_cnsqty
                ,invsts
                ,invsts_prg
                ,orgcod
                ,lotnum
                ,ordinv
                ,dte_code
                ,rule_nam)
            SELECT
                 a.id_mensaje
                
                ,CAST(b.wkolin AS INT) AS numero_sublinea
                ,b.wkolin
                ,b.prtnum
                ,b.linqty
                ,b.bom_cnsqty
                ,b.invsts
                ,b.invsts_prg
                ,b.orgcod
                
                ,b.lotnum
                ,b.ordinv
                ,b.dte_code
                ,b.rule_nam
            FROM #mensajes a
            INNER JOIN #mensajes_lineas b ON
                b.id_orden_manufactura = a.id_orden_manufactura
            AND b.numero_linea = a.numero_linea
        END

        BEGIN
            IF OBJECT_ID('tempdb..#mensajes_distinct') IS NOT NULL BEGIN
                DROP TABLE #mensajes_distinct
            END

            SELECT DISTINCT
                 a.id_orden_manufactura
                ,a.fecha_modificacion
                ,a.usuario_modificacion
            INTO #mensajes_distinct
            FROM #mensajes a

            UPDATE a
            SET  a.estado = 'MENSAJE_CREADO'

                ,a.[version] = a.[version] + 1
                ,a.fecha_modificacion = b.fecha_modificacion
                ,a.usuario_modificacion = b.usuario_modificacion
            FROM [$(eConnect)].dbo.ordenes_manufactura a
            INNER JOIN #mensajes_distinct b ON
                b.id_orden_manufactura = a.id_orden_manufactura

            UPDATE c
            SET  c.estado = a.estado

                ,c.[version] = a.[version] + 1
                ,c.fecha_modificacion = a.fecha_modificacion
                ,c.usuario_modificacion = a.usuario_modificacion
            FROM [$(eConnect)].dbo.ordenes_manufactura a
            INNER JOIN #mensajes_distinct b ON
                b.id_orden_manufactura = a.id_orden_manufactura
            INNER JOIN [$(eConnect)].dbo.solicitudes_ordenes c ON
                c.id_solicitud_orden = a.id_solicitud_orden
        END
    END

	COMMIT TRANSACTION
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
    IF @@TRANCOUNT > 0 BEGIN
	    ROLLBACK TRANSACTION
    END
    ;THROW;
END CATCH
