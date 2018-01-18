
CREATE PROCEDURE [dbo].[SincronizarSaldosInventario]
AS
BEGIN TRY
    SET NOCOUNT ON;

	DECLARE @t AS TABLE(fecha_extraccion_anterior DATETIME2(0))
	DECLARE @fecha_extraccion_actual DATETIME2(0)
	DECLARE @fecha_extraccion_anterior DATETIME2(0)

	--BEGIN TRANSACTION

	--OBTENER FECHA DE ULTIMA EXTRACCION
	BEGIN
		SET @fecha_extraccion_actual = CAST(SYSDATETIME() AS DATE)

		UPDATE a
		SET a.fecha_ultima_extraccion = @fecha_extraccion_actual
		OUTPUT deleted.fecha_ultima_extraccion
		INTO @t(fecha_extraccion_anterior)
		FROM [$(eIntegration)]..dbo.integraciones a
		WHERE
			a.codigo = 'WMS_SALDOS_INVENTARIOS'
        
        SELECT
		    @fecha_extraccion_anterior = CAST(a.fecha_extraccion_anterior AS DATE)
		FROM @t a
	END

    --COPIAR DATOS
    BEGIN
        DECLARE @fecha_corte DATE = @fecha_extraccion_anterior
        
        SET IDENTITY_INSERT dbo.saldos_inventario ON

        WHILE @fecha_corte <= @fecha_extraccion_actual
        BEGIN
            BEGIN TRANSACTION
            
            SELECT @fecha_corte

            DELETE a
            FROM dbo.saldos_inventario a
            WHERE
                a.fecha_corte = @fecha_corte

            INSERT INTO dbo.saldos_inventario
                (id
                ,fecha_creacion
                ,fecha_corte
                ,prt_client_id
                ,wh_id
                ,prtnum
                ,invsts
                ,lotnum
                ,untqty
                ,lst_arecod
                ,expire_dte
                ,inv_attr_str7
                ,stoloc
                ,lodnum)
            SELECT
                 a.id
                ,a.fecha_creacion
                ,a.fecha_corte
                ,a.prt_client_id
                ,a.wh_id
                ,a.prtnum
                ,a.invsts
                ,a.lotnum
                ,a.untqty
                ,a.lst_arecod
                ,a.expire_dte
                ,a.inv_attr_str7
                ,a.stoloc
                ,a.lodnum
            FROM eConfig.wms.saldos_inventario a
            WHERE
                a.fecha_corte = @fecha_corte

            SET @fecha_corte = DATEADD(DAY,1,@fecha_corte)
            COMMIT TRANSACTION
        END
    
        SET IDENTITY_INSERT dbo.saldos_inventario OFF
    END
	
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
    ;THROW;
END CATCH