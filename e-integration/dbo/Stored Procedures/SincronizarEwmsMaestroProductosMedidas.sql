
CREATE PROCEDURE [dbo].[SincronizarEwmsMaestrosProductosMedidas]
AS
BEGIN TRY
    BEGIN TRANSACTION

    --CONSOLIDAR SOURCE
    BEGIN
        IF OBJECT_ID('tempdb..#source') IS NOT NULL BEGIN
            DROP TABLE #source
        END

        SELECT
             a.fecha_creacion
            ,a.fecha_modificacion

            ,c.id_cliente
            ,a.id_producto
            ,a.id_bodega
            ,a.id_unidad_medida
            ,CAST(c.codigo_alterno_wms AS NVARCHAR(32)) AS prt_client_id
            ,CAST(b.codigo AS NVARCHAR(50)) AS prtnum
            ,CAST(d.codigo AS NVARCHAR(32)) AS wh_id
            ,CAST(e.codigo AS NVARCHAR(2)) AS uomcod
            ,CAST(a.huella_codigo AS NVARCHAR(30)) AS ftpcod
            ,a.nivel AS uomlvl
            ,a.factor_conversion AS untqty
            ,CAST(a.largo AS NUMERIC(19,4)) AS [len]
            ,CAST(a.ancho AS NUMERIC(19,4)) AS wid
            ,CAST(a.alto AS NUMERIC(19,4)) AS hgt
            ,CAST(a.peso AS NUMERIC(23,8)) AS grswgt
            ,CAST(a.rcv_flg AS BIT) AS rcv_flg
            ,CAST(a.pal_flg AS BIT) AS pal_flg
            ,CAST(a.cas_flg AS BIT) AS cas_flg
        INTO #source
        FROM [$(eConnect)].dbo.productos_medidas a
        INNER JOIN [$(eConnect)].dbo.productos b ON
            b.id_producto = a.id_producto
        INNER JOIN [$(eConnect)].dbo.clientes c ON
            c.id_cliente = b.id_cliente
        INNER JOIN [$(eConnect)].dbo.bodegas d ON
            d.id_bodega = a.id_bodega
        INNER JOIN [$(eConnect)].dbo.unidades_medida e ON
            e.id_unidad_medida = a.id_unidad_medida

        CREATE UNIQUE INDEX ix_source_01 ON #source(id_producto,id_bodega,id_unidad_medida)
    END
        
    --MERGE
    BEGIN
        MERGE [$(eWms)].dbo.productos_medidas AS t
        USING #source AS s ON
            s.id_producto = t.id_producto
        AND s.id_bodega = t.id_bodega
        AND s.id_unidad_medida = t.id_unidad_medida
        WHEN NOT MATCHED BY TARGET THEN
		    INSERT
		    (operacion
            ,fecha_creacion
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
            ,len
            ,wid
            ,hgt
            ,grswgt
            ,rcv_flg
            ,cas_flg
            ,pal_flg)
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
            ,len
            ,wid
            ,hgt
            ,grswgt
            ,rcv_flg
            ,cas_flg
            ,pal_flg)
        WHEN MATCHED AND NOT (0 = 0
        AND t.id_cliente        = s.id_cliente
        AND t.id_producto       = s.id_producto
        AND t.id_bodega         = s.id_bodega
        AND t.id_unidad_medida  = s.id_unidad_medida
        AND t.prt_client_id     = s.prt_client_id
        AND t.prtnum            = s.prtnum
        AND t.wh_id             = s.wh_id
        AND t.ftpcod            = s.ftpcod
        AND t.uomcod            = s.uomcod
        AND t.uomlvl            = s.uomlvl
        AND t.untqty            = s.untqty
        AND t.len               = s.len
        AND t.wid               = s.wid
        AND t.hgt               = s.hgt
        AND t.grswgt            = s.grswgt
        AND t.rcv_flg           = s.rcv_flg
        AND t.cas_flg           = s.cas_flg
        AND t.pal_flg           = s.pal_flg
        ) THEN
		    UPDATE SET 
		        t.operacion = 'U'
		    ,t.fecha_modificacion = s.fecha_modificacion

            ,t.id_cliente       = s.id_cliente
            ,t.id_producto      = s.id_producto
            ,t.id_bodega        = s.id_bodega
            ,t.id_unidad_medida = s.id_unidad_medida
            ,t.prt_client_id    = s.prt_client_id
            ,t.prtnum           = s.prtnum
            ,t.wh_id            = s.wh_id
            ,t.ftpcod           = s.ftpcod
            ,t.uomcod           = s.uomcod
            ,t.uomlvl           = s.uomlvl
            ,t.untqty           = s.untqty
            ,t.len              = s.len
            ,t.wid              = s.wid
            ,t.hgt              = s.hgt
            ,t.grswgt           = s.grswgt
            ,t.rcv_flg          = s.rcv_flg
            ,t.cas_flg          = s.cas_flg
            ,t.pal_flg          = s.pal_flg
        WHEN NOT MATCHED BY SOURCE THEN 
            DELETE
		;
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