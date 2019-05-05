
CREATE PROCEDURE CrearSuscripcionesOrdenesAlistamientoActasIngredion
AS
BEGIN
    IF OBJECT_ID('tempdb..#base') IS NOT NULL BEGIN
        DROP TABLE #base
    END

    SELECT
         a.id_solicitud_acta
        ,'ORDENES_DE_ALISTAMIENTO_ACTAS_INGREDION' AS suscripcion
        ,a.numero_solicitud AS id_externo
        ,'NO_PROCESADO' AS estado_suscripcion

        ,CAST(a.id_solicitud_acta AS VARCHAR(20))   AS arg0
        ,b.codigo_alterno_wms                       AS arg1
        ,c.codigo                                   AS arg2
        ,CAST('ORDNUM' AS VARCHAR(20))              AS arg3
    INTO #base
    FROM [$(eConnect)].dbo.solicitudes_actas_ingredion a
    INNER JOIN [$(eConnect)].dbo.clientes b ON
        b.id_cliente = a.id_cliente
    INNER JOIN [$(eConnect)].dbo.bodegas c ON
        c.id_bodega = a.id_bodega
    WHERE
        a.estado_solicitud = 'NO_PROCESADO'

    INSERT INTO [$(WMS_DB_SERVER)].[$(eIntegrationOrdenes)].dbo.suscripciones
        (suscripcion
        ,id_externo
        ,estado_suscripcion
        ,arg0
        ,arg1
        ,arg2
        ,arg3)
    SELECT
         a.suscripcion
        ,a.id_externo
        ,a.estado_suscripcion
        ,a.arg0
        ,a.arg1
        ,a.arg2
        ,a.arg3
    FROM #base a

    UPDATE a
    SET a.estado_solicitud = 'CREACION_SOLICITUD_NOTIFICADA'
    FROM [$(eConnect)].dbo.solicitudes_actas_ingredion a
    INNER JOIN #base b ON
        b.id_solicitud_acta = a.id_solicitud_acta
END