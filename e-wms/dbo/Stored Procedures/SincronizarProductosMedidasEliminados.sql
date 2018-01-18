CREATE PROCEDURE dbo.[SincronizarProductosMedidasEliminados]
AS
BEGIN
    IF OBJECT_ID('tempdb..#target') IS NOT NULL BEGIN
	    DROP TABLE #target
    END

    SELECT
         a.id_producto
        ,a.id_bodega
        ,a.uomlvl
    INTO #target
    FROM dbo.productos_medidas a 

    IF OBJECT_ID('tempdb..#deleted') IS NOT NULL BEGIN
	    DROP TABLE #deleted
    END

    SELECT
        a.*
    INTO #deleted
    FROM #target a
    LEFT OUTER JOIN [$(eConnect)].dbo.productos_medidas b ON
        b.id_producto = a.id_producto
    AND b.id_bodega = a.id_bodega
    AND b.nivel = a.uomlvl
    WHERE
        b.id_producto IS NULL

    DELETE a
    FROM dbo.productos_medidas a
    INNER JOIN #deleted b ON
        b.id_producto = a.id_producto
    AND b.id_bodega = a.id_bodega
    AND b.uomlvl = a.uomlvl
END