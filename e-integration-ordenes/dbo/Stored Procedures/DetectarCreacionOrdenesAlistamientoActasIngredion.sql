
CREATE PROCEDURE [dbo].[DetectarCreacionOrdenesAlistamientoActasIngredion]
AS
BEGIN
BEGIN TRY
    BEGIN TRANSACTION
    
    IF OBJECT_ID('tempdb..#base') IS NOT NULL BEGIN
        DROP TABLE #base
    END

    SELECT
         a.suscripcion
        ,a.id_externo
        ,a.arg1 AS client_id
        ,CONCAT('_C-%-',a.id_externo) AS numero_solicitud

        ,CAST(NULL AS VARCHAR(32)) AS wh_id
        ,CAST(NULL AS VARCHAR(35)) AS ordnum
    INTO #base
    FROM dbo.suscripciones a
    WHERE
        a.suscripcion = 'ORDENES_DE_ALISTAMIENTO_ACTAS_INGREDION'
    AND a.estado_suscripcion = 'NO_PROCESADO'

    UPDATE a
    SET  
         a.wh_id = b.wh_id
        ,a.ordnum = b.ordnum
    FROM #base a
    INNER JOIN [$(ttcwmsprd)].dbo.ord b ON
        b.client_id = a.client_id
    AND b.ordnum LIKE numero_solicitud

    UPDATE a
    SET
         a.estado_suscripcion = 'ORDEN_ALISTAMIENTO_CONFIRMADA'
        ,a.arg2 = b.wh_id
        ,a.arg3 = b.ordnum
    FROM dbo.suscripciones a
    INNER JOIN #base b ON
        b.suscripcion = a.suscripcion
    AND b.id_externo = a.id_externo
    AND b.ordnum IS NOT NULL
    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0 BEGIN
        ROLLBACK TRANSACTION
    END
    ;THROW
END CATCH
END