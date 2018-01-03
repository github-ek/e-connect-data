CREATE PROCEDURE [dbo].[SincronizarUbicaciones]
AS
BEGIN TRY
    SET NOCOUNT ON;

	DECLARE @t AS TABLE(fecha_extraccion_anterior DATETIME2(0))
	DECLARE @fecha_extraccion_actual DATETIME2(0)
	DECLARE @fecha_extraccion_anterior DATETIME2(0)

	BEGIN TRANSACTION

	--OBTENER FECHA DE ULTIMA EXTRACCION
	BEGIN
		SET @fecha_extraccion_actual = SYSDATETIME()

		UPDATE a
		SET a.fecha_ultima_extraccion = @fecha_extraccion_actual
		OUTPUT deleted.fecha_ultima_extraccion
		INTO @t(fecha_extraccion_anterior)
		FROM eIntegration.dbo.integraciones a
		WHERE
			a.codigo = 'WMS_UBICACIONES'
        
        SELECT
		    @fecha_extraccion_anterior = a.fecha_extraccion_anterior
		FROM @t a
	END

    --CONSOLIDACION SOURCE
    BEGIN
		IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
			DROP TABLE #source
		END

        ;WITH
        cte_00 AS
        (
            SELECT
                 a.id
                ,a.operacion
                ,a.fecha_creacion
                ,a.fecha_modificacion
                ,b.id_bodega
                ,a.wh_id
                ,a.arecod
                ,a.stoloc
                ,a.wrkzon
                ,a.last_upd_dt
                ,a.last_upd_user_id
            FROM eConfig.wms.ubicaciones a
            INNER JOIN tactic_connect.wms.bodegas b ON
                b.codigo = a.wh_id
            WHERE
                a.fecha_modificacion > @fecha_extraccion_anterior
            AND a.fecha_modificacion <= @fecha_extraccion_actual
        )
        SELECT
             a.*
        INTO #source
        FROM cte_00 a
    END

    --MERGE TARGET/SOURCE
    BEGIN
        MERGE dbo.ubicaciones AS t
        USING #source AS s ON 
            s.id = t.id
        WHEN NOT MATCHED BY TARGET THEN
		    INSERT
		    (id
            ,operacion
            ,fecha_creacion
            ,fecha_modificacion
            ,id_bodega
            ,wh_id
            ,arecod
            ,stoloc
            ,wrkzon
            ,last_upd_dt
            ,last_upd_user_id)
		    VALUES
		    (id
            ,operacion
            ,fecha_creacion
            ,fecha_modificacion
            ,id_bodega
            ,wh_id
            ,arecod
            ,stoloc
            ,wrkzon
            ,last_upd_dt
            ,last_upd_user_id)
        WHEN MATCHED THEN
		    UPDATE SET 
		     t.operacion = s.operacion
            ,t.fecha_creacion = s.fecha_creacion
            ,t.fecha_modificacion = s.fecha_modificacion
            ,t.id_bodega = s.id_bodega
            ,t.wh_id = s.wh_id
            ,t.arecod = s.arecod
            ,t.stoloc = s.stoloc
            ,t.wrkzon = s.wrkzon
            ,t.last_upd_dt = s.last_upd_dt
            ,t.last_upd_user_id = s.last_upd_user_id
        ;
    END

	COMMIT TRANSACTION
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
    ;THROW;
END CATCH