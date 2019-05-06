
CREATE PROCEDURE ConfirmarCreacionOrdenesAlistamientoActasIngredion
AS
BEGIN
    IF OBJECT_ID('tempdb..#base') IS NOT NULL BEGIN
        DROP TABLE #base
    END

    SELECT
         a.suscripcion
        ,a.id_externo
        ,a.estado_suscripcion
        ,CAST(a.arg0 AS BIGINT) AS id_solicitud_acta
        ,CAST(a.arg1 AS VARCHAR(32)) AS client_id
        ,CAST(a.arg2 AS VARCHAR(32)) AS wh_id
        ,CAST(a.arg3 AS VARCHAR(35)) AS ordnum
    INTO #base
    FROM [$(WMS_DB_SERVER)].[$(eIntegrationOrdenes)].dbo.suscripciones a
    WHERE
        a.suscripcion = 'ORDENES_DE_ALISTAMIENTO_ACTAS_INGREDION'
    AND a.estado_suscripcion = 'ORDEN_ALISTAMIENTO_CONFIRMADA'

    DECLARE @success BIT = 0
    BEGIN TRY
        BEGIN TRANSACTION
        UPDATE a
        SET 
             a.estado_solicitud = b.estado_suscripcion
            ,a.client_id = b.client_id
            ,a.ordnum = b.ordnum
            ,a.wh_id = b.wh_id
            ,a.id_bodega = c.id_bodega
        FROM [$(eConnect)].dbo.solicitudes_actas_ingredion a
        INNER JOIN #base b ON
            b.id_solicitud_acta = a.id_solicitud_acta
        INNER JOIN eConnect.dbo.bodegas c ON
            c.codigo = b.wh_id

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
             a.estado_suscripcion = 'ORDEN_ALISTAMIENTO_NOTIFICADA'
        FROM [$(WMS_DB_SERVER)].[$(eIntegrationOrdenes)].dbo.suscripciones a
        INNER JOIN #base b ON
             a.suscripcion = b.suscripcion
        AND  a.id_externo = b.id_externo
    END
END