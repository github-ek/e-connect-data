CREATE PROCEDURE [dbo].[CrearMensajesDeRemesaSilogtran]
AS
BEGIN TRY
    --SET NOCOUNT ON;

    BEGIN TRANSACTION

    BEGIN
        IF OBJECT_ID('tempdb..#mapa_clientes') IS NOT NULL BEGIN
            DROP TABLE #mapa_clientes
        END

        SELECT
             c.id_cliente
            ,c.numero_identificacion
            ,c.codigo
            ,b.valor AS codigo_silogtran
        INTO #mapa_clientes
        FROM dbo.mapas a
        INNER JOIN dbo.mapas_valores b ON
            b.id_mapa = a.id_mapa
        INNER JOIN [$(eConnect)].dbo.clientes c ON
            c.codigo = b.clave
        AND c.activo = 1
        WHERE
            a.codigo = 'CLIENTES_SILOGTRAN'

        IF OBJECT_ID('tempdb..#mapa_departamentos') IS NOT NULL BEGIN
            DROP TABLE #mapa_departamentos
        END

        SELECT
             c.id_departamento
            ,c.nombre
            ,c.codigo
            ,b.valor AS codigo_silogtran
        INTO #mapa_departamentos
        FROM dbo.mapas a
        INNER JOIN dbo.mapas_valores b ON
            b.id_mapa = a.id_mapa
        INNER JOIN [$(eConnect)].dbo.departamentos c ON
            c.codigo = b.clave
        AND c.activo = 1
        WHERE
            a.codigo = 'DEPARTAMENTOS_SILOGTRAN'

        IF OBJECT_ID('tempdb..#mapa_ciudades') IS NOT NULL BEGIN
            DROP TABLE #mapa_ciudades
        END

        SELECT
             c.id_ciudad
            ,c.nombre_alterno
            ,c.codigo
            ,b.valor AS codigo_silogtran
            ,d.codigo_silogtran AS departamento_silogtran
        INTO #mapa_ciudades
        FROM dbo.mapas a
        INNER JOIN dbo.mapas_valores b ON
            b.id_mapa = a.id_mapa
        INNER JOIN [$(eConnect)].dbo.ciudades c ON
            c.codigo = b.clave
        AND c.activo = 1
        INNER JOIN #mapa_departamentos d ON
            d.id_departamento = c.id_departamento
        WHERE
            a.codigo = 'CIUDADES_SILOGTRAN'

        IF OBJECT_ID('tempdb..#mapa_unidades_medida') IS NOT NULL BEGIN
            DROP TABLE #mapa_unidades_medida
        END

        SELECT
             c.id_unidad_medida
            ,c.codigo
            ,b.valor AS codigo_silogtran
        INTO #mapa_unidades_medida
        FROM dbo.mapas a
        INNER JOIN dbo.mapas_valores b ON
            b.id_mapa = a.id_mapa
        INNER JOIN [$(eConnect)].dbo.unidades_medida c ON
            c.codigo = b.clave
        AND c.activo = 1
        WHERE
            a.codigo = 'UNIDADES_MEDIDA_SILOGTRAN'
    END

    BEGIN
        IF OBJECT_ID('tempdb..#mensajes') IS NOT NULL BEGIN
            DROP TABLE #mensajes
        END

        SELECT
             CAST(NULL AS BIGINT) AS id_mensaje
            ,a.id_remesa
            ,'NO_PROCESADO' AS estado
            ,a.id_bodega
            ,a.tipo_remesa

            ,'0' AS tipo_documento
            ,a.numero_solicitud
            ,a.placa_remesa
            ,CAST(FORMAT(a.fecha_remesa,'yyyy-MM-dd') AS VARCHAR(10)) AS fecha_compromiso
            ,CAST(a.hora_cita_minima AS VARCHAR(8)) AS hora_compromiso
            ,COALESCE(c.codigo,'') AS linea_negocio_codigo
            ,COALESCE(d.codigo_silogtran,'') AS cliente_codigo
            ,0  AS cliente_division

            ,a.remitente_nombre
            ,a.remitente_tipo_documento
            ,a.remitente_numero_documento
            ,a.remitente_direccion
            ,a.remitente_telefonos
            ,a.remitente_contacto
            ,COALESCE(e.codigo_silogtran,'') AS remitente_ciudad_codigo
            ,COALESCE(e.departamento_silogtran,'') AS remitente_departamento_codigo
            ,'0' AS remitente_zona
            ,CAST(FORMAT(a.remitente_cx, N'0.00000000', N'en-US') AS VARCHAR(20)) AS remitente_cx
            ,CAST(FORMAT(a.remitente_cy, N'0.00000000', N'en-US') AS VARCHAR(20)) AS remitente_cy

            ,a.destinatario_nombre
            ,a.destinatario_tipo_documento
            ,a.destinatario_numero_documento
            ,a.destinatario_direccion
            ,a.destinatario_telefonos
            ,a.destinatario_contacto
            ,COALESCE(f.codigo_silogtran,'') AS destinatario_ciudad_codigo
            ,COALESCE(f.departamento_silogtran,'') AS destinatario_departamento_codigo
            ,'0' AS destinatario_zona
            ,CAST(FORMAT(a.destinatario_cx, N'0.00000000', N'en-US') AS VARCHAR(20)) AS destinatario_cx
            ,CAST(FORMAT(a.destinatario_cy, N'0.00000000', N'en-US') AS VARCHAR(20)) AS destinatario_cy

            ,
            CASE WHEN a.es_servicio_dedicado = 1 THEN 'SERVICIO DEDICADO.' ELSE '' END +
            CASE WHEN a.es_reprogramacion = 1 THEN 'RE PROGRAMACION.' ELSE '' END AS observaciones
            ,'0' AS seguro
            ,'0' AS tarifa

            ,SYSTEM_USER AS usuario_creacion
            ,SYSDATETIME() AS fecha_creacion
            ,SYSTEM_USER AS usuario_modificacion
            ,SYSDATETIME() AS fecha_modificacion

            ,CASE WHEN d.id_cliente IS NULL THEN 1 ELSE 0 END AS cliente_no_existe
            ,CASE WHEN e.id_ciudad IS NULL THEN 1 ELSE 0 END AS ciudad_remitente_no_existe
            ,CASE WHEN f.id_ciudad IS NULL THEN 1 ELSE 0 END AS ciudad_destinatario_no_existe
        INTO #mensajes
        FROM [$(eConnect)].dbo.remesas a
        INNER JOIN [$(eConnect)].dbo.lineas_negocio c ON
            c.id_linea_negocio = a.id_linea_negocio
        INNER JOIN #mapa_clientes d ON
            d.id_cliente = a.id_cliente
        INNER JOIN #mapa_ciudades e ON
            e.id_ciudad = a.id_ciudad_remitente
        INNER JOIN #mapa_ciudades f ON
            f.id_ciudad = a.id_ciudad_destinatario
        WHERE 1 = 1
        AND a.mensaje_creado = 0
        --TODO
        AND a.tipo_remesa = 'DESPACHO'
        AND a.estado = 'NO_PROCESADA'

        CREATE UNIQUE CLUSTERED INDEX ix_mensajes_01 ON #mensajes(id_remesa)

        IF OBJECT_ID('tempdb..#mensajes_lineas') IS NOT NULL BEGIN
            DROP TABLE #mensajes_lineas
        END

        SELECT
             a.id_remesa

            ,b.numero_linea
            ,b.id_producto
            ,b.producto_codigo
            ,b.unidades_despachadas
            ,b.factor_conversion
            ,b.cajas_despachadas
            ,b.id_unidad_medida
            ,b.id_estado_inventario
            ,b.valor_unitario_declarado

            ,CONCAT(
             'SKU:'     ,b.producto_codigo,
            ',NOMBRE:'  ,LEFT(REPLACE(REPLACE(REPLACE(c.nombre,'''',' '),';',' '),',',' '),50),
            ',ESTADO:'  ,d.nombre,
            ',FC:'      ,b.factor_conversion,
            ',CAJAS:'   ,FORMAT(b.cajas_despachadas, N'0.000', N'en-US'),
            ',UNIDAD:'  ,f.codigo,
            ',CAJA:'    ,e.codigo,
            ',ID:'      ,b.id_producto) AS descripcion
            ,'PRODUCTO GENERICOS SECUNDARIA VER DETALLE' AS producto_nombre
            ,COALESCE(f.codigo_silogtran,'') AS empaque_codigo
            ,b.unidades_despachadas AS cantidad
            ,CAST(FORMAT(CAST(b.unidades_despachadas AS DECIMAL(12,4)) * b.peso, N'0.000', N'en-US') AS VARCHAR(20)) AS peso
            ,CAST(FORMAT(CAST(b.unidades_despachadas AS DECIMAL(12,4)) * b.peso, N'0.000', N'en-US') AS VARCHAR(20)) AS peso_bruto
            ,CAST(FORMAT(CAST(b.unidades_despachadas AS DECIMAL(12,4)) * b.volumen, N'0', N'en-US') AS VARCHAR(20)) AS volumen
            ,CAST(b.unidades_despachadas AS BIGINT) * CAST(b.valor_unitario_declarado AS BIGINT) AS valor_declarado

            ,CASE WHEN f.id_unidad_medida IS NULL THEN 1 ELSE 0 END AS unidad_medida_no_existe
        INTO #mensajes_lineas
        FROM #mensajes a
        INNER JOIN [$(eConnect)].dbo.remesas_lineas b ON
            b.id_remesa = a.id_remesa
        INNER JOIN [$(eConnect)].dbo.productos c ON
            c.id_producto = b.id_producto
        INNER JOIN [$(eConnect)].dbo.estados_inventario d ON
            d.id_estado_inventario = b.id_estado_inventario
        INNER JOIN [$(eConnect)].dbo.unidades_medida e ON
            e.id_unidad_medida = b.id_unidad_medida_caja
        LEFT OUTER JOIN #mapa_unidades_medida f ON
            f.id_unidad_medida = b.id_unidad_medida
    END
    
    BEGIN
        ;WITH
        cte_00 AS
        (
            SELECT DISTINCT
                a.id_remesa
            FROM #mensajes_lineas a
            WHERE
                a.empaque_codigo = ''
        )
        DELETE a
        FROM #mensajes_lineas a
        INNER JOIN cte_00 b ON
            b.id_remesa = a.id_remesa
        
        IF OBJECT_ID('tempdb..#mensajes_inconsistentes') IS NOT NULL BEGIN
            DROP TABLE #mensajes_inconsistentes
        END

        SELECT
             a.id_remesa
            ,a.cliente_no_existe
            ,a.ciudad_remitente_no_existe
            ,a.ciudad_destinatario_no_existe
            ,CASE WHEN b.id_remesa IS NULL THEN 1 ELSE 0 END AS remesa_no_tiene_lineas
        INTO #mensajes_inconsistentes
        FROM #mensajes a
        LEFT OUTER JOIN #mensajes_lineas b ON
            b.id_remesa = a.id_remesa
        WHERE 1 = 0
        OR a.cliente_no_existe = 1
        OR a.ciudad_remitente_no_existe = 1
        OR a.ciudad_destinatario_no_existe = 1
        OR b.id_remesa IS NULL

        DELETE a
        FROM #mensajes a
        INNER JOIN #mensajes_inconsistentes b ON
            b.id_remesa = a.id_remesa
    END

    BEGIN
        UPDATE a
        SET 
             a.remitente_nombre =           CASE WHEN remitente_nombre = ''             THEN '---'  ELSE remitente_nombre END
            ,a.remitente_numero_documento = CASE WHEN remitente_numero_documento = ''   THEN '---'  ELSE remitente_numero_documento END
            ,a.remitente_direccion =        CASE WHEN remitente_direccion = ''          THEN '---'  ELSE remitente_direccion END
            ,a.remitente_telefonos =        CASE WHEN remitente_telefonos = ''          THEN '0'    ELSE remitente_telefonos END
            ,a.remitente_contacto =         CASE WHEN remitente_contacto = ''           THEN '0'    ELSE remitente_contacto END

            ,a.destinatario_nombre =            CASE WHEN destinatario_nombre = ''             THEN '---'  ELSE destinatario_nombre END
            ,a.destinatario_numero_documento =  CASE WHEN destinatario_numero_documento = ''   THEN '---'  ELSE destinatario_numero_documento END
            ,a.destinatario_direccion =         CASE WHEN destinatario_direccion = ''          THEN '---'  ELSE destinatario_direccion END
            ,a.destinatario_telefonos =         CASE WHEN destinatario_telefonos = ''          THEN '0'    ELSE destinatario_telefonos END
            ,a.destinatario_contacto =          CASE WHEN destinatario_contacto = ''           THEN '0'    ELSE destinatario_contacto END

            ,a.observaciones =                  CASE WHEN observaciones = ''           THEN '0'    ELSE observaciones END
        FROM #mensajes a

        UPDATE a
        SET 
             remitente_direccion = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(remitente_direccion,'Ã',' '),'Â',' '),'½',' '),'Ï',' '),'Í',' '),' ±','Ñ')
            ,destinatario_direccion = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(destinatario_direccion,'Ã',' '),'Â',' '),'½',' '),'Ï',' '),'Í',' '),' ±','Ñ')
        FROM #mensajes a
    END

    --CREACION DE LOS MENSAJES
    BEGIN
        DECLARE @t AS TABLE(id_remesa BIGINT, id_mensaje BIGINT)
        BEGIN
    
            INSERT INTO [$(eStage)].dbo.mensajes_remesas_silogtran
                (id_remesa
                ,estado
                ,id_bodega
                ,tipo_remesa

                ,tipo_documento
                ,numero_solicitud
                ,placa_remesa
                ,fecha_compromiso
                ,hora_compromiso

                ,linea_negocio_codigo
                ,cliente_codigo
                ,cliente_division

                ,remitente_nombre
                ,remitente_tipo_documento
                ,remitente_numero_documento
                ,remitente_direccion
                ,remitente_telefonos
                ,remitente_contacto
                ,remitente_ciudad_codigo
                ,remitente_departamento_codigo
                ,remitente_zona
                ,remitente_cx
                ,remitente_cy

                ,destinatario_nombre
                ,destinatario_tipo_documento
                ,destinatario_numero_documento
                ,destinatario_direccion
                ,destinatario_telefonos
                ,destinatario_contacto
                ,destinatario_ciudad_codigo
                ,destinatario_departamento_codigo
                ,destinatario_zona
                ,destinatario_cx
                ,destinatario_cy

                ,observaciones
                ,seguro
                ,tarifa

                ,usuario_creacion
                ,fecha_creacion
                ,usuario_modificacion
                ,fecha_modificacion)
            OUTPUT inserted.id_remesa, inserted.id_mensaje
            INTO @t
            SELECT
                 id_remesa
                ,estado
                ,id_bodega
                ,tipo_remesa

                ,tipo_documento
                ,numero_solicitud
                ,placa_remesa
                ,fecha_compromiso
                ,hora_compromiso

                ,linea_negocio_codigo
                ,cliente_codigo
                ,cliente_division

                ,remitente_nombre
                ,remitente_tipo_documento
                ,remitente_numero_documento
                ,remitente_direccion
                ,remitente_telefonos
                ,remitente_contacto
                ,remitente_ciudad_codigo
                ,remitente_departamento_codigo
                ,remitente_zona
                ,remitente_cx
                ,remitente_cy

                ,destinatario_nombre
                ,destinatario_tipo_documento
                ,destinatario_numero_documento
                ,destinatario_direccion
                ,destinatario_telefonos
                ,destinatario_contacto
                ,destinatario_ciudad_codigo
                ,destinatario_departamento_codigo
                ,destinatario_zona
                ,destinatario_cx
                ,destinatario_cy

                ,observaciones
                ,seguro
                ,tarifa

                ,usuario_creacion
                ,fecha_creacion
                ,usuario_modificacion
                ,fecha_modificacion
            FROM #mensajes a

            UPDATE a
            SET a.id_mensaje = b.id_mensaje
            FROM #mensajes a 
            INNER JOIN @t b ON
                b.id_remesa = a.id_remesa

            INSERT INTO [$(eStage)].dbo.mensajes_remesas_silogtran_lineas
                (id_mensaje
                ,numero_linea

                ,descripcion
                ,producto_nombre
                ,empaque_codigo
                ,cantidad
                ,peso
                ,peso_bruto
                ,volumen
                ,valor_declarado)
            SELECT
                 a.id_mensaje
                ,b.numero_linea

                ,b.descripcion
                ,b.producto_nombre
                ,b.empaque_codigo
                ,b.cantidad
                ,b.peso
                ,b.peso_bruto
                ,b.volumen
                ,b.valor_declarado            
            FROM #mensajes a
            INNER JOIN #mensajes_lineas b ON
                b.id_remesa = a.id_remesa
        END

        BEGIN
            UPDATE a
            SET  a.estado = 'MENSAJE_CREADO'
                ,a.mensaje_creado = 1
                ,a.[version] = a.[version] + 1
                ,a.fecha_modificacion = b.fecha_modificacion
                ,a.usuario_modificacion = b.usuario_modificacion
            FROM [$(eConnect)].dbo.remesas a
            INNER JOIN #mensajes b ON
                b.id_remesa = a.id_remesa
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