
CREATE PROCEDURE [dbo].[CrearMensajesDeReciboJda]
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
            ,a.id_orden_recibo
            ,'NO_PROCESADO' AS estado
            ,a.id_solicitud_orden

            ,c.codigo AS whse_id
            ,b.codigo_alterno_wms AS client_id
            ,'TRS' AS invtyp
            ,a.numero_orden AS invnum
            ,c.codigo AS wh_id
            ,'OPEN' AS rimsts
            ,e.codigo AS supnum
            ,REPLACE(CONVERT(VARCHAR(10),a.fecha_maxima_solicitada,120),'-','') AS invdte

            ,SYSTEM_USER AS usuario_creacion
            ,SYSDATETIME() AS fecha_creacion
            ,SYSTEM_USER AS usuario_modificacion
            ,SYSDATETIME() AS fecha_modificacion
        INTO #mensajes
        FROM [$(eConnect)].dbo.ordenes_recibo a
        INNER JOIN [$(eConnect)].dbo.clientes b ON
            b.id_cliente = a.id_cliente
        INNER JOIN [$(eConnect)].dbo.bodegas c ON
            c.id_bodega = a.id_bodega
        INNER JOIN [$(eConnect)].dbo.solicitudes d ON
            d.id_solicitud = a.id_solicitud
        INNER JOIN [$(eConnect)].dbo.bodegas e ON
            e.id_bodega = d.id_bodega
        WHERE
            a.estado = 'NO_PROCESADA'   

        IF OBJECT_ID('tempdb..#mensajes_lineas') IS NOT NULL BEGIN
            DROP TABLE #mensajes_lineas
        END

        SELECT 
             a.id
            ,b.numero_linea

            ,FORMAT(b.numero_linea,'0000') AS ordlin
            ,CAST(b.numero_linea AS NVARCHAR(10)) AS invlin
            ,CAST('0000' AS NVARCHAR(10)) AS invsln
            ,CAST(b.producto_codigo AS NVARCHAR(50)) AS prtnum
            ,b.unidades_solicitadas AS expqty
            ,CAST(b.id_estado_inventario AS NVARCHAR(4)) AS rcvsts
            ,CAST(b.lote AS NVARCHAR(4)) AS lotnum
            ,CAST(b.bl AS NVARCHAR(4)) AS inv_attr_str7
        INTO #mensajes_lineas
        FROM #mensajes a
        INNER JOIN [$(eConnect)].dbo.ordenes_recibo_lineas b ON
            b.id_orden_recibo = a.id_orden_recibo
    END

    --CREACION DE LOS MENSAJES
    BEGIN
        DECLARE @t AS TABLE(id_mensaje BIGINT,id_orden_recibo BIGINT)
        BEGIN
    
            INSERT INTO dbo.mensajes_recibo_jda
                (id_orden_recibo
                ,estado
            
                ,whse_id
                ,client_id
                ,invtyp
                ,invnum
                ,wh_id
                ,rimsts
                ,supnum
                ,invdte

                ,usuario_creacion
                ,fecha_creacion
                ,usuario_modificacion
                ,fecha_modificacion)
            OUTPUT inserted.id_mensaje, inserted.id_orden_recibo
            INTO @t
            SELECT
                 id_orden_recibo
                ,estado
            
                ,whse_id
                ,client_id
                ,invtyp
                ,invnum
                ,wh_id
                ,rimsts
                ,supnum
                ,invdte

                ,usuario_creacion
                ,fecha_creacion
                ,usuario_modificacion
                ,fecha_modificacion
            FROM #mensajes a

            UPDATE a
            SET a.id_mensaje = b.id_mensaje
            FROM #mensajes a 
            INNER JOIN @t b ON
                b.id_orden_recibo = a.id_orden_recibo

            INSERT INTO dbo.mensajes_recibo_jda_lineas
                (id_mensaje
                ,numero_linea
                ,invlin
                ,invsln
                ,prtnum
                ,expqty
                ,rcvsts
                ,lotnum
                ,inv_attr_str7)
            SELECT
                 a.id_mensaje
                ,b.numero_linea
                ,b.invlin
                ,b.invsln
                ,b.prtnum
                ,b.expqty
                ,b.rcvsts
                ,b.lotnum
                ,b.inv_attr_str7
            FROM #mensajes a
            INNER JOIN #mensajes_lineas b ON
                b.id = a.id
        END

        BEGIN
            UPDATE a
            SET  a.estado = 'MENSAJE_CREADO'

                ,a.[version] = a.[version] + 1
                ,a.fecha_modificacion = b.fecha_modificacion
                ,a.usuario_modificacion = b.usuario_modificacion
            FROM [$(eConnect)].dbo.ordenes_recibo a
            INNER JOIN #mensajes b ON
                b.id_orden_recibo = a.id_orden_recibo

            UPDATE c
            SET  c.estado = a.estado

                ,c.[version] = a.[version] + 1
                ,c.fecha_modificacion = a.fecha_modificacion
                ,c.usuario_modificacion = a.usuario_modificacion
            FROM [$(eConnect)].dbo.ordenes_recibo a
            INNER JOIN #mensajes b ON
                b.id_orden_recibo = a.id_orden_recibo
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
