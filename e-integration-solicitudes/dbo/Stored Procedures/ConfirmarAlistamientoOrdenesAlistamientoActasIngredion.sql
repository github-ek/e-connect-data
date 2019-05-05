
CREATE PROCEDURE ConfirmarAlistamientoOrdenesAlistamientoActasIngredion
AS
BEGIN
    IF OBJECT_ID('tempdb..#base') IS NOT NULL BEGIN
        DROP TABLE #base
    END

    SELECT
          CAST(a.arg0 AS BIGINT) AS id_solicitud_acta
         ,a.estado_suscripcion
         ,b.*
         ,CAST(NULL AS BIGINT) AS id_producto
         ,CAST(NULL AS VARCHAR(250)) AS producto_nombre
         ,CAST(NULL AS VARCHAR(4)) AS id_estado_inventario
         ,CAST(NULL AS VARCHAR(100)) AS estado_inventario_nombre
         ,CAST(NULL AS BIGINT) AS id_bodega_virtual
         ,CAST(NULL AS BIGINT) AS id_unidad_medida
         ,CAST(NULL AS VARCHAR(50)) AS unidad_medida_codigo_alterno_tms
         ,CAST(NULL AS BIGINT) AS id_unidad_empaque
         ,CAST(NULL AS VARCHAR(50)) AS unidad_empaque_codigo_alterno_tms
    INTO #base
    FROM [$(WMS_DB_SERVER)].[$(eIntegrationOrdenes)].dbo.suscripciones a
    INNER JOIN [$(WMS_DB_SERVER)].[$(eIntegrationOrdenes)].dbo.solicitudes_actas_ingredion_lineas_alistadas b ON
        b.suscripcion = a.suscripcion
    AND b.id_externo = a.id_externo
    WHERE
        a.suscripcion = 'ORDENES_DE_ALISTAMIENTO_ACTAS_INGREDION'
    AND a.estado_suscripcion = 'ORDEN_ALISTAMIENTO_EN_STAGE'


    DECLARE @success BIT = 0
    BEGIN TRY
        BEGIN TRANSACTION

        UPDATE a
        SET  a.id_producto = c.id_producto
            ,a.producto_nombre = c.nombre
        FROM #base a
        INNER JOIN [$(eConnect)].dbo.solicitudes_actas_ingredion b ON
            b.id_solicitud_acta = a.id_solicitud_acta
        INNER JOIN [$(eConnect)].dbo.productos c ON
            c.id_cliente = b.id_cliente
        AND c.codigo = a.prtnum

        UPDATE a
        SET  a.id_estado_inventario = b.id_estado_inventario
            ,a.estado_inventario_nombre = b.nombre
        FROM #base a
        INNER JOIN [$(eConnect)].dbo.estados_inventario b ON
            b.id_estado_inventario = a.invsts

        UPDATE a
        SET  a.id_bodega_virtual = c.id_bodega_virtual
        FROM #base a
        INNER JOIN [$(eConnect)].dbo.solicitudes_actas_ingredion b ON
            b.id_solicitud_acta = a.id_solicitud_acta
        INNER JOIN [$(eConnect)].dbo.bodegas_virtuales c ON
            c.id_cliente = b.id_cliente
        AND c.codigo = a.orgcod

        UPDATE a
        SET  a.id_unidad_medida = c.id_unidad_medida
            ,a.unidad_medida_codigo_alterno_tms = d.codigo_alterno_tms
        FROM #base a
        INNER JOIN [$(eConnect)].dbo.solicitudes_actas_ingredion b ON
            b.id_solicitud_acta = a.id_solicitud_acta
        INNER JOIN [$(eConnect)].dbo.productos_medidas c ON
            c.id_bodega = b.id_bodega
        AND c.id_producto = a.id_producto
        AND c.rcv_flg = 1
        INNER JOIN [$(eConnect)].dbo.unidades_medida d ON
            d.id_unidad_medida = c.id_unidad_medida

        UPDATE a
        SET  a.id_unidad_empaque = c.id_unidad_medida
            ,a.unidad_empaque_codigo_alterno_tms = d.codigo_alterno_tms
        FROM #base a
        INNER JOIN [$(eConnect)].dbo.solicitudes_actas_ingredion b ON
            b.id_solicitud_acta = a.id_solicitud_acta
        INNER JOIN [$(eConnect)].dbo.productos_medidas c ON
            c.id_bodega = b.id_bodega
        AND c.id_producto = a.id_producto
        AND c.cas_flg = 1
        INNER JOIN [$(eConnect)].dbo.unidades_medida d ON
            d.id_unidad_medida = c.id_unidad_medida

        ;WITH
        cte_00 AS
        (
            SELECT DISTINCT
                 id_solicitud_acta
                ,estado_suscripcion
                ,stgdte
                ,rmanum
            FROM #base 
        )
        UPDATE a
        SET 
             a.estado_solicitud = b.estado_suscripcion
            ,a.stgdte = b.stgdte
            ,a.rmanum = b.rmanum

            ,a.numero_solicitud = RTRIM(LTRIM(REPLACE(a.numero_solicitud,';','')))
            ,a.bodega_codigo_alterno = RTRIM(LTRIM(REPLACE(a.bodega_codigo_alterno,';','')))
            
            ,a.tercero_identificacion = RTRIM(LTRIM(REPLACE(a.tercero_identificacion,';','')))
            ,a.tercero_nombre = RTRIM(LTRIM(REPLACE(a.tercero_nombre,';','')))
            ,a.ciudad_codigo_alterno = RTRIM(LTRIM(REPLACE(a.ciudad_codigo_alterno,';','')))
            ,a.ciudad_nombre_alterno = RTRIM(LTRIM(REPLACE(a.ciudad_nombre_alterno,';','')))
            ,a.direccion = RTRIM(LTRIM(REPLACE(a.direccion,';','')))
            ,a.punto_codigo_alterno = RTRIM(LTRIM(REPLACE(a.punto_codigo_alterno,';','')))
            ,a.punto_nombre_alterno = RTRIM(LTRIM(REPLACE(a.punto_nombre_alterno,';','')))
            ,a.periodo = RTRIM(LTRIM(REPLACE(a.periodo,';','')))
            ,a.planta = RTRIM(LTRIM(REPLACE(a.planta,';','')))
            ,a.identificador = RTRIM(LTRIM(REPLACE(a.identificador,';','')))
            ,a.programa_codigo = RTRIM(LTRIM(REPLACE(a.programa_codigo,';','')))
            ,a.programa = RTRIM(LTRIM(REPLACE(a.programa,';','')))
            ,a.regional_codigo = RTRIM(LTRIM(REPLACE(a.regional_codigo,';','')))
            ,a.regional = RTRIM(LTRIM(REPLACE(a.regional,';','')))
            ,a.centro_zonal = RTRIM(LTRIM(REPLACE(a.centro_zonal,';','')))
            ,a.responsable_principal = RTRIM(LTRIM(REPLACE(a.responsable_principal,';','')))
            ,a.responsable_suplente = RTRIM(LTRIM(REPLACE(a.responsable_suplente,';','')))
            ,a.telefono = RTRIM(LTRIM(REPLACE(a.telefono,';','')))
        FROM [$(eConnect)].dbo.solicitudes_actas_ingredion a
        INNER JOIN #base b ON
            b.id_solicitud_acta = a.id_solicitud_acta

        UPDATE a
        SET  a.cliente_codigo_alterno_tms   = c.codigo_alterno_tms

            ,a.remitente_identificacion     = d.numero_identificacion
            ,a.remitente_nombre             = d.nombre
            ,a.remitente_departamento       = COALESCE(j.codigo_alterno_tms,g.codigo_alterno_tms,'')
            ,a.remitente_ciudad             = COALESCE(i.codigo_alterno_tms,f.codigo_alterno_tms,'')
            ,a.remitente_direccion          = COALESCE(h.direccion,e.direccion,'')
            ,a.remitente_telefono           = COALESCE(h.telefono,e.telefono,'')
            ,a.remitente_contacto           = COALESCE(h.contacto,e.contacto,'')

            ,a.destinatario_identificacion  = a.tercero_identificacion
            ,a.destinatario_nombre          = a.punto_nombre_alterno
            ,a.destinatario_departamento    = l.codigo_alterno_tms
            ,a.destinatario_ciudad          = k.codigo_alterno_tms
            ,a.destinatario_direccion       = a.direccion
            ,a.destinatario_telefono        = a.telefono
            ,a.destinatario_contacto        = a.responsable_principal
        FROM [$(eConnect)].dbo.solicitudes_actas_ingredion a
        INNER JOIN #base b ON
            b.id_solicitud_acta = a.id_solicitud_acta
        INNER JOIN [$(eConnect)].dbo.clientes c ON
            c.id_cliente = a.id_cliente
        
        --REMITENTE
        INNER JOIN [$(eConnect)].dbo.empresas d ON
            d.codigo = 'EGAKAT'

        LEFT OUTER JOIN [$(eConnect)].dbo.bodegas e ON
            e.id_bodega = a.id_bodega
        LEFT OUTER JOIN [$(eConnect)].dbo.ciudades f ON
            f.id_ciudad = e.id_ciudad
        LEFT OUTER JOIN [$(eConnect)].dbo.departamentos g ON
            g.id_departamento = f.id_departamento

        LEFT OUTER JOIN [$(eConnect)].dbo.bodegas_virtuales h ON
            h.id_bodega_virtual = b.id_bodega_virtual
        LEFT OUTER JOIN [$(eConnect)].dbo.ciudades i ON
            i.id_ciudad = h.id_ciudad
        LEFT OUTER JOIN [$(eConnect)].dbo.departamentos j ON
            j.id_departamento = i.id_departamento

        --DESTINATARIO
        INNER JOIN [$(eConnect)].dbo.ciudades k ON
            k.id_ciudad = a.id_ciudad
        INNER JOIN [$(eConnect)].dbo.departamentos l ON
            l.id_departamento = k.id_departamento

        INSERT INTO [$(eConnect)].dbo.solicitudes_actas_ingredion_lineas_alistadas
            (id_solicitud_acta
            ,prtnum
            ,invsts
            ,orgcod
            ,lotnum
            ,expire_dte
            ,untqty
            ,untcas
            ,empaques
            ,peso_empaques
            ,volumen_empaques
            ,id_producto
            ,producto_nombre
            ,id_estado_inventario
            ,estado_inventario_nombre
            ,id_bodega_virtual
            ,id_unidad_medida
            ,unidad_medida_codigo_alterno_tms
            ,id_unidad_empaque
            ,unidad_empaque_codigo_alterno_tms)
        SELECT
             id_solicitud_acta
            ,prtnum
            ,invsts
            ,orgcod
            ,lotnum
            ,expire_dte
            ,untqty
            ,untcas
            ,empaques
            ,peso_empaques
            ,volumen_empaques
            ,id_producto
            ,producto_nombre
            ,id_estado_inventario
            ,estado_inventario_nombre
            ,id_bodega_virtual
            ,id_unidad_medida
            ,unidad_medida_codigo_alterno_tms
            ,id_unidad_empaque
            ,unidad_empaque_codigo_alterno_tms
        FROM #base

        SET @success = 1
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 BEGIN
            ROLLBACK TRANSACTION
        END
        ;THROW
    END CATCH

    IF @success = 1 BEGIN
        UPDATE a
        SET 
             a.estado_suscripcion = 'PROCESADO'
        FROM [$(WMS_DB_SERVER)].[$(eIntegrationOrdenes)].dbo.suscripciones a
        INNER JOIN #base b ON
             a.suscripcion = b.suscripcion
        AND  a.id_externo = b.id_externo
    END
END