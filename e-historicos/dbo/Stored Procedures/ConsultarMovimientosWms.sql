CREATE PROCEDURE [dbo].[ConsultarMovimientosWms] AS
BEGIN
DECLARE @fecha_desde AS DATE = CAST(GETDATE() - 30 AS DATE)
DECLARE @ultima_fecha_modificacion AS DATE = CAST(DATEADD(DAY,-3,SYSDATETIME()) AS DATE)

--SELECT @fecha_desde
--SELECT @ultima_fecha_modificacion

--BODEGAS
BEGIN
    IF OBJECT_ID('tempdb..#bodegas') IS NOT NULL BEGIN
        DROP TABLE #bodegas
    END

    ;WITH
    cte_00 AS
    (
    SELECT 
        b.codigo AS BODEGA_EK,
        id_estado_inventario AS ESTADO_INVENTARIO_EK_REAL,
        id_estado_inventario_equivalente_cliente AS ESTADO_INVENTARIO_EK,
        codigo_alterno AS BODEGA_CLIENTE,
        ROW_NUMBER() OVER(PARTITION BY a.id_bodega,a.id_estado_inventario ORDER BY codigo_alterno) AS orden
    FROM dbo.clientes_bodegas a
    INNER JOIN dbo.bodegas b ON
        b.id_bodega = a.id_bodega
    WHERE
        id_cliente = 18
    )
    SELECT
        BODEGA_EK,
        ESTADO_INVENTARIO_EK_REAL,
        ESTADO_INVENTARIO_EK,
        BODEGA_CLIENTE
    INTO #bodegas
    FROM cte_00 a
    WHERE
        a.orden = 1
END

--SALIDAS
BEGIN
    IF OBJECT_ID('tempdb..#salidas') IS NOT NULL BEGIN
        DROP TABLE #salidas
    END

    ;WITH
    cte_00 AS
    (
        SELECT
             client_id
            ,wh_id
            ,ordnum
            ,/*CAST(CASE WHEN SUM(CASE WHEN a.linsts IN ('C','B') THEN 0 ELSE 1 END) = 0 THEN 1 ELSE 0 END AS BIT)*/ 0 AS cerrada
            ,MAX(a.fecha_modificacion) AS ultima_fecha_modificacion
        FROM dbo.salidas a
        WHERE
            a.client_id LIKE 'GLOBAL WINE & SPIRITS LTDA'
        AND a.fecha_creacion >= @fecha_desde
        GROUP BY
             client_id
            ,wh_id
            ,ordnum
    ),
    cte_01 AS
    (
        SELECT
            a.id,
            'WMS' AS APLICACION,
            FORMAT(SYSDATETIME(),'yyyy-MM-dd hh:mm:ss') AS FECHA_HORA_CORTE,
            a.ordtyp AS TIPO_DOCUMENTO,
            '' AS PREFIJO_DOCUMENTO,
            a.ordnum AS NUMERO_DE_DOCUMENTO,
            CASE WHEN a.ordnum LIKE 'TC-1%' AND PATINDEX('%-%',REVERSE(a.rmanum)) > 0 THEN REVERSE(RIGHT(REVERSE(a.rmanum),LEN(a.rmanum) - PATINDEX('%-%',REVERSE(a.rmanum)))) ELSE '' END AS PREFIJO_DOCUMENTO_ORIGEN,
            CASE WHEN a.ordnum LIKE 'TC-1%' AND PATINDEX('%-%',REVERSE(a.rmanum)) > 0 THEN REVERSE(LEFT(REVERSE(a.rmanum),PATINDEX('%-%',REVERSE(a.rmanum))-1)) ELSE '' END AS NUMERO_DE_DOCUMENTO_ORIGEN,
            FORMAT(a.ordlin_moddte,'yyyy-MM-dd hh:mm:ss') AS FECHA_MODIFICACION,
            a.ordlin_mod_usr_id	AS USUARIO_MODIFICACION,

            a.prtnum AS PRODUCTO_CODIGO,
            'TODO' AS PRODUCTO_NOMBRE,
            a.ordqty AS CANTIDAD,
            a.shpqty AS CANTIDAD_DESPACHADA,
            'UN' AS UNIDAD,
            1 AS UNIDADES_POR_EMPAQUE,
            COALESCE(c.BODEGA_CLIENTE,'') AS BODEGA_CLIENTE,
            a.wh_id AS BODEGA_EK,
            COALESCE(c.ESTADO_INVENTARIO_EK,'') AS ESTADO_INVENTARIO_EK,
            '' AS BODEGA_CLIENTE_REAL,
            a.invsts_prg AS ESTADO_INVENTARIO_EK_REAL,
            
            b.ultima_fecha_modificacion,
            b.cerrada,
            CAST(CASE WHEN b.cerrada = 1 AND a.ordqty - a.shpqty > 0 THEN 1 ELSE 0 END AS BIT) AS novedad_despacho,
            a.ordqty - a.shpqty AS diferencia
        FROM dbo.salidas a
        INNER JOIN cte_00 b ON
            b.client_id = a.client_id
        AND b.wh_id = a.wh_id
        AND b.ordnum = a.ordnum
        LEFT OUTER JOIN #bodegas c ON
            c.BODEGA_EK = a.wh_id
        AND c.ESTADO_INVENTARIO_EK_REAL = a.invsts_prg
    )
    SELECT
        a.id,
        a.APLICACION,
        a.FECHA_HORA_CORTE,
        a.TIPO_DOCUMENTO,
        a.PREFIJO_DOCUMENTO,
        a.NUMERO_DE_DOCUMENTO,
        a.PREFIJO_DOCUMENTO_ORIGEN,
        a.NUMERO_DE_DOCUMENTO_ORIGEN,
        a.PREFIJO_DOCUMENTO_ORIGEN AS PREFIJO_DOCUMENTO_ANTERIOR,
        a.NUMERO_DE_DOCUMENTO_ORIGEN AS NUMERO_DE_DOCUMENTO_ANTERIOR,
        a.FECHA_MODIFICACION,
        a.USUARIO_MODIFICACION,
        a.PRODUCTO_CODIGO,
        a.PRODUCTO_NOMBRE,
        a.CANTIDAD,
        a.CANTIDAD_DESPACHADA,
        a.UNIDAD,
        a.UNIDADES_POR_EMPAQUE,
        a.BODEGA_CLIENTE,
        a.BODEGA_EK,
        a.ESTADO_INVENTARIO_EK,
        a.BODEGA_CLIENTE_REAL,
        a.ESTADO_INVENTARIO_EK_REAL,

        a.cerrada,
        a.novedad_despacho,
        a.diferencia
    INTO #salidas
    FROM cte_01 a
    WHERE 0 = 1
    OR (a.cerrada = 0)
    OR (a.cerrada = 1 AND a.ultima_fecha_modificacion >= @ultima_fecha_modificacion)
    --TODO ESTO VA TOCAR CAMBIARLO

    IF OBJECT_ID('tempdb..#despachos') IS NOT NULL BEGIN
        DROP TABLE #despachos
    END

    SELECT
        a.id, 
        a.APLICACION,
        a.FECHA_HORA_CORTE,
        a.TIPO_DOCUMENTO,
        a.PREFIJO_DOCUMENTO,
        a.NUMERO_DE_DOCUMENTO,
        a.PREFIJO_DOCUMENTO_ORIGEN,
        a.NUMERO_DE_DOCUMENTO_ORIGEN,
        a.PREFIJO_DOCUMENTO_ANTERIOR,
        a.NUMERO_DE_DOCUMENTO_ANTERIOR,
        a.FECHA_MODIFICACION,
        a.USUARIO_MODIFICACION,
        a.PRODUCTO_CODIGO,
        a.PRODUCTO_NOMBRE,
        a.CANTIDAD,
        a.CANTIDAD_DESPACHADA,
        a.UNIDAD,
        a.UNIDADES_POR_EMPAQUE,
        a.BODEGA_CLIENTE,
        a.BODEGA_EK,
        a.ESTADO_INVENTARIO_EK,
        a.BODEGA_CLIENTE_REAL,
        a.ESTADO_INVENTARIO_EK_REAL,
        a.cerrada
    INTO #despachos
    FROM #salidas a

    CREATE UNIQUE INDEX ix_despachos_01 ON #despachos(id)

    IF OBJECT_ID('tempdb..#novedades_despachos') IS NOT NULL BEGIN
        DROP TABLE #novedades_despachos
    END
    
    SELECT
        a.id,
        'CONNECT' AS APLICACION,
        a.FECHA_HORA_CORTE,
        'NOV_DES' AS TIPO_DOCUMENTO,
        a.PREFIJO_DOCUMENTO,
        CAST(MIN(a.id) OVER(PARTITION BY a.BODEGA_EK,a.TIPO_DOCUMENTO,a.PREFIJO_DOCUMENTO,a.NUMERO_DE_DOCUMENTO) AS VARCHAR(50)) AS NUMERO_DE_DOCUMENTO,
        a.PREFIJO_DOCUMENTO_ORIGEN,
        a.NUMERO_DE_DOCUMENTO_ORIGEN,
        a.PREFIJO_DOCUMENTO AS PREFIJO_DOCUMENTO_ANTERIOR,
        a.NUMERO_DE_DOCUMENTO AS NUMERO_DE_DOCUMENTO_ANTERIOR,
        a.FECHA_MODIFICACION,
        a.USUARIO_MODIFICACION,
        a.PRODUCTO_CODIGO,
        a.PRODUCTO_NOMBRE,
        -a.diferencia AS CANTIDAD,
        0 AS CANTIDAD_DESPACHADA,
        a.UNIDAD,
        a.UNIDADES_POR_EMPAQUE,
        a.BODEGA_CLIENTE,
        a.BODEGA_EK,
        a.ESTADO_INVENTARIO_EK,
        a.BODEGA_CLIENTE_REAL,
        a.ESTADO_INVENTARIO_EK_REAL,
        1 AS cerrada
    INTO #novedades_despachos
    FROM #salidas a
    WHERE
        a.cerrada = 1
    AND a.diferencia > 0
END

--RECIBOS
BEGIN
    IF OBJECT_ID('tempdb..#base_recibos') IS NOT NULL BEGIN
        DROP TABLE #base_recibos
    END

    ;WITH
    cte_00 AS
    (
        SELECT
             a.client_id
            ,a.wh_id
            ,a.po_num
            ,a.supnum
            ,a.invnum
            ,a.trknum
            ,CAST(CASE WHEN SUM(CASE WHEN a.rcvtrk_stat IN ('C') THEN 0 ELSE 1 END) = 0 THEN 1 ELSE 0 END AS BIT) AS cerrada
            ,MAX(a.fecha_modificacion) AS ultima_fecha_modificacion
        FROM dbo.entradas a
        WHERE
            a.client_id LIKE 'GLOBAL WINE & SPIRITS LTDA'
        AND a.fecha_creacion >= @fecha_desde
        GROUP BY
             a.client_id
            ,a.wh_id
            ,a.po_num
            ,a.supnum
            ,a.invnum
            ,a.trknum
    ),
    cte_01 AS
    (
        SELECT
            'WMS' AS APLICACION,
            FORMAT(SYSDATETIME(),'yyyy-MM-dd hh:mm:ss') AS FECHA_HORA_CORTE,
            a.invtyp AS TIPO_DOCUMENTO,
            '' AS PREFIJO_DOCUMENTO,
            a.po_num AS NUMERO_DE_DOCUMENTO,
            '' AS PREFIJO_DOCUMENTO_ORIGEN,
            a.po_num AS NUMERO_DE_DOCUMENTO_ORIGEN,
            '' AS PREFIJO_DOCUMENTO_ANTERIOR,
            '' AS NUMERO_DE_DOCUMENTO_ANTERIOR,

            FORMAT(a.rcvlin_moddte,'yyyy-MM-dd hh:mm:ss') AS FECHA_MODIFICACION,
            a.rcvlin_mod_usr_id	AS USUARIO_MODIFICACION,
            a.prtnum AS PRODUCTO_CODIGO,
            'TODO' AS PRODUCTO_NOMBRE,
            a.rcvqty AS CANTIDAD,
            'UN' AS UNIDAD,
            1 AS UNIDADES_POR_EMPAQUE,
            COALESCE(c.BODEGA_CLIENTE,'') AS BODEGA_CLIENTE,
            a.wh_id AS BODEGA_EK,
            COALESCE(c.ESTADO_INVENTARIO_EK,'') AS ESTADO_INVENTARIO_EK,
            '' AS BODEGA_CLIENTE_REAL,
            a.rcvsts AS ESTADO_INVENTARIO_EK_REAL,

            b.ultima_fecha_modificacion
        FROM dbo.entradas a
        INNER JOIN cte_00 b ON
            b.client_id = a.client_id
        AND b.wh_id = a.wh_id
        AND b.po_num = a.po_num
        AND b.supnum = a.supnum
        AND b.invnum = a.invnum
        AND b.trknum = a.trknum
        LEFT OUTER JOIN #bodegas c ON
            c.BODEGA_EK = a.wh_id
        AND c.ESTADO_INVENTARIO_EK_REAL = a.rcvsts
    )
    SELECT
        a.APLICACION,
        a.FECHA_HORA_CORTE,
        a.TIPO_DOCUMENTO,
        a.PREFIJO_DOCUMENTO,
        a.NUMERO_DE_DOCUMENTO,
        a.PREFIJO_DOCUMENTO_ORIGEN,
        a.NUMERO_DE_DOCUMENTO_ORIGEN,
        a.FECHA_MODIFICACION,
        a.USUARIO_MODIFICACION,
        a.PRODUCTO_CODIGO,
        a.PRODUCTO_NOMBRE,
        a.CANTIDAD,
        a.UNIDAD,
        a.UNIDADES_POR_EMPAQUE,
        a.BODEGA_CLIENTE,
        a.BODEGA_EK,
        a.ESTADO_INVENTARIO_EK,
        a.BODEGA_CLIENTE_REAL,
        a.ESTADO_INVENTARIO_EK_REAL,

        ROW_NUMBER() OVER(PARTITION BY a.PREFIJO_DOCUMENTO,a.NUMERO_DE_DOCUMENTO ORDER BY a.FECHA_MODIFICACION DESC) AS orden
    INTO #base_recibos
    FROM cte_01 a
    WHERE 0 = 1
    OR (a.ultima_fecha_modificacion >= @ultima_fecha_modificacion)

    IF OBJECT_ID('tempdb..#recibos') IS NOT NULL BEGIN
        DROP TABLE #recibos
    END

    ;WITH
    cte_00 AS
    (
        SELECT 
            a.APLICACION,
            a.FECHA_HORA_CORTE,
            a.TIPO_DOCUMENTO,
            a.PREFIJO_DOCUMENTO,
            a.NUMERO_DE_DOCUMENTO,
            a.PREFIJO_DOCUMENTO_ORIGEN,
            a.NUMERO_DE_DOCUMENTO_ORIGEN,
            a.FECHA_MODIFICACION,
            a.USUARIO_MODIFICACION,
            a.BODEGA_EK
        FROM #base_recibos a
        WHERE 
            a.orden = 1
    ),
    cte_01 AS
    (
        SELECT 
            a.APLICACION,
            a.TIPO_DOCUMENTO,
            a.PREFIJO_DOCUMENTO,
            a.NUMERO_DE_DOCUMENTO,
            a.BODEGA_EK,

            a.PRODUCTO_CODIGO,
            a.PRODUCTO_NOMBRE,
            SUM(a.CANTIDAD) AS CANTIDAD,
            a.UNIDAD,
            a.UNIDADES_POR_EMPAQUE,
            a.BODEGA_CLIENTE,
            a.ESTADO_INVENTARIO_EK,
            a.BODEGA_CLIENTE_REAL,
            a.ESTADO_INVENTARIO_EK_REAL
        FROM #base_recibos a
        GROUP BY
            a.APLICACION,
            a.TIPO_DOCUMENTO,
            a.PREFIJO_DOCUMENTO,
            a.NUMERO_DE_DOCUMENTO,
            a.BODEGA_EK,
            a.PRODUCTO_CODIGO,
            a.PRODUCTO_NOMBRE,
            a.UNIDAD,
            a.UNIDADES_POR_EMPAQUE,
            a.BODEGA_CLIENTE,
            a.ESTADO_INVENTARIO_EK,
            a.BODEGA_CLIENTE_REAL,
            a.ESTADO_INVENTARIO_EK_REAL
    )
    SELECT
        0 AS id,
        a.APLICACION,
        a.FECHA_HORA_CORTE,
        a.TIPO_DOCUMENTO,
        a.PREFIJO_DOCUMENTO,
        a.NUMERO_DE_DOCUMENTO,
        a.PREFIJO_DOCUMENTO_ORIGEN,
        a.NUMERO_DE_DOCUMENTO_ORIGEN,
        '' AS PREFIJO_DOCUMENTO_ANTERIOR,
        '' AS NUMERO_DE_DOCUMENTO_ANTERIOR,
        a.FECHA_MODIFICACION,
        a.USUARIO_MODIFICACION,
        b.PRODUCTO_CODIGO,
        b.PRODUCTO_NOMBRE,
        b.CANTIDAD,
        0 AS CANTIDAD_DESPACHADA,
        b.UNIDAD,
        b.UNIDADES_POR_EMPAQUE,
        b.BODEGA_CLIENTE,
        a.BODEGA_EK,
        b.ESTADO_INVENTARIO_EK,
        b.BODEGA_CLIENTE_REAL,
        b.ESTADO_INVENTARIO_EK_REAL,
        1 AS cerrada
    INTO #recibos
    FROM cte_00 a
    INNER JOIN cte_01 b ON
        b.APLICACION = a.APLICACION
    AND b.TIPO_DOCUMENTO = a.TIPO_DOCUMENTO
    AND b.PREFIJO_DOCUMENTO = a.PREFIJO_DOCUMENTO
    AND b.NUMERO_DE_DOCUMENTO = a.NUMERO_DE_DOCUMENTO
    AND b.BODEGA_EK = a.BODEGA_EK

    CREATE UNIQUE INDEX ix_recibos_01 ON #recibos(APLICACION,TIPO_DOCUMENTO,PREFIJO_DOCUMENTO,NUMERO_DE_DOCUMENTO,BODEGA_EK,PRODUCTO_CODIGO,ESTADO_INVENTARIO_EK_REAL)
END

--CONSOLIDADO
BEGIN
    ;WITH
    cte_00 AS
    (
    SELECT 1 AS orden,* 
    FROM #despachos a
    UNION ALL
    SELECT 2 AS orden,* 
    FROM #novedades_despachos a
    UNION ALL
    SELECT 3 AS orden,*
    FROM #recibos a
    )
    SELECT
        a.APLICACION,
        a.FECHA_HORA_CORTE,
        a.TIPO_DOCUMENTO,
        a.PREFIJO_DOCUMENTO,
        a.NUMERO_DE_DOCUMENTO,
        a.PREFIJO_DOCUMENTO_ORIGEN,
        a.NUMERO_DE_DOCUMENTO_ORIGEN,
        a.PREFIJO_DOCUMENTO_ANTERIOR,
        a.NUMERO_DE_DOCUMENTO_ANTERIOR,
        a.FECHA_MODIFICACION,
        a.USUARIO_MODIFICACION,
        a.PRODUCTO_CODIGO,
        a.PRODUCTO_NOMBRE,
        a.CANTIDAD,
        a.CANTIDAD_DESPACHADA,
        a.UNIDAD,
        a.UNIDADES_POR_EMPAQUE,
        a.BODEGA_CLIENTE,
        a.BODEGA_EK,
        a.ESTADO_INVENTARIO_EK,
        a.BODEGA_CLIENTE_REAL,
        a.ESTADO_INVENTARIO_EK_REAL,
        a.cerrada
    FROM cte_00 a 
    ORDER BY 
        a.PREFIJO_DOCUMENTO_ORIGEN,
        a.NUMERO_DE_DOCUMENTO_ORIGEN,
        a.orden,
        a.id
END
END