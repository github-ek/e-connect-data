
CREATE PROCEDURE LimpiarSuscripcionesOrdenesAlistamientoActasIngredion
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
    INTO #base
    FROM dbo.suscripciones a
    WHERE
        a.suscripcion = 'ORDENES_DE_ALISTAMIENTO_ACTAS_INGREDION'
    AND a.estado_suscripcion = 'PROCESADO'

    DELETE a
    FROM dbo.solicitudes_actas_ingredion_lineas_alistadas a
    INNER JOIN #base b ON
        b.suscripcion = a.suscripcion
    AND b.id_externo = a.id_externo

    DELETE a
    FROM dbo.suscripciones a
    INNER JOIN #base b ON
        b.suscripcion = a.suscripcion
    AND b.id_externo = a.id_externo

    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0 BEGIN
        ROLLBACK TRANSACTION
    END
    ;THROW
END CATCH
END