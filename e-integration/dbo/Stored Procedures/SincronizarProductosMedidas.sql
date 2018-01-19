
CREATE PROCEDURE [dbo].[SincronizarProductosMedidas]
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
		FROM dbo.integraciones a
		WHERE
			a.codigo = 'WMS_PRODUCTOS_MEDIDAS'
        
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
                 SYSDATETIME() AS fecha_modificacion

                ,c.id_cliente
                ,a.id_producto
                ,a.id_bodega
                ,a.id_unidad_medida
                ,CAST(c.codigo_alterno_wms AS NVARCHAR(32)) AS prt_client_id
                ,CAST(b.codigo AS NVARCHAR(50)) AS prtnum
                ,CAST(d.codigo AS NVARCHAR(32)) AS wh_id
                ,CAST(a.huella_codigo AS NVARCHAR(30)) AS ftpcod
                ,CAST(e.codigo AS NVARCHAR(2)) AS uomcod
                ,a.nivel AS uomlvl
                ,a.factor_conversion untqty
                ,CAST(a.largo AS NUMERIC(19,4)) AS [len]
                ,CAST(a.ancho AS NUMERIC(19,4)) AS wid
                ,CAST(a.alto AS NUMERIC(19,4)) AS hgt
                ,CAST(a.peso AS NUMERIC(23,8)) AS grswgt
                ,CAST(a.cas_flg AS INT) AS cas_flg
                ,CAST(a.pal_flg AS INT) AS pal_flg
                ,CAST(a.rcv_flg AS INT) AS rcv_flg
            FROM [$(eConnect)].dbo.productos_medidas a
            INNER JOIN [$(eConnect)].dbo.productos b ON
                b.id_producto = a.id_producto
            INNER JOIN [$(eConnect)].dbo.clientes c ON
                c.id_cliente = b.id_cliente
            INNER JOIN [$(eConnect)].dbo.bodegas d ON
                d.id_bodega = a.id_bodega
            INNER JOIN [$(eConnect)].dbo.unidades_medida e ON
                e.id_unidad_medida = a.id_unidad_medida
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
        MERGE [$(eWms)].dbo.productos_medidas AS t
        USING #source AS s ON 
            s.id_producto = t.id_producto
        AND s.id_bodega = t.id_bodega
        AND s.uomlvl = t.uomlvl
        WHEN NOT MATCHED BY TARGET THEN
		    INSERT
		    (operacion
            ,fecha_creacion
            ,fecha_modificacion

            ,id_cliente
            ,id_producto
            ,id_bodega
            ,id_unidad
            ,prt_client_id
            ,prtnum
            ,wh_id
            ,ftpcod
            ,uomcod
            ,uomlvl
            ,untqty
            ,[len]
            ,wid
            ,hgt
            ,grswgt
            ,cas_flg
            ,pal_flg
            ,rcv_flg)
		    VALUES
		    ('C'
            ,fecha_modificacion
            ,fecha_modificacion

            ,id_cliente
            ,id_producto
            ,id_bodega
            ,id_unidad_medida
            ,prt_client_id
            ,prtnum
            ,wh_id
            ,ftpcod
            ,uomcod
            ,uomlvl
            ,untqty
            ,[len]
            ,wid
            ,hgt
            ,grswgt
            ,cas_flg
            ,pal_flg
            ,rcv_flg)
        WHEN MATCHED THEN
		    UPDATE SET 
		     t.operacion = 'U'
		    ,t.fecha_modificacion = s.fecha_modificacion

            ,t.id_cliente = s.id_cliente
            ,t.id_unidad = s.id_unidad_medida
            ,t.prt_client_id = s.prt_client_id
            ,t.ftpcod = s.ftpcod
            ,t.uomcod = s.uomcod
            ,t.untqty = s.untqty
            ,t.[len] = s.[len]
            ,t.wid = s.wid
            ,t.hgt = s.hgt
            ,t.grswgt = s.grswgt
            ,t.cas_flg = s.cas_flg
            ,t.pal_flg = s.pal_flg
            ,t.rcv_flg = s.rcv_flg
        ;
    END

	COMMIT TRANSACTION
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
    ;THROW;
END CATCH