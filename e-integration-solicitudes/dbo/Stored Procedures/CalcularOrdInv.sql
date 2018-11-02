CREATE PROCEDURE [dbo].[CalcularOrdInv]
AS
BEGIN

    ;WITH
    cte_00 AS
    (
        SELECT
                b.clave
            ,b.valor
            ,LEN(b.clave) - LEN(REPLACE(b.clave,'%','')) AS prioridad
        FROM [$(eIntegration)].dbo.mapas a
        INNER JOIn [$(eIntegration)].dbo.mapas_valores b ON
            b.id_mapa = a.id_mapa
        WHERE
            a.codigo = 'ORDINV'
    ),
    cte_01 AS
    (
        SELECT
                a.id
            ,CONCAT(a.prt_client_id,'|',a.wh_id,'|',a.dte_code,'|',CASE WHEN a.lotnum <> '' THEN 'S' ELSE 'N' END) AS clave
        FROM #mensajes_lineas_ordinv a
    ),
    cte_02 AS
    (
        SELECT
                a.id
            ,b.clave
            ,CAST(LEFT(b.valor,30) AS NVARCHAR(30)) AS ordinv
            ,ROW_NUMBER() OVER(PARTITION BY a.id ORDER BY prioridad) AS orden
        FROM cte_01 a
        LEFT OUTER JOIN cte_00 b ON
            a.clave LIKE b.clave
    )
    UPDATE a
    SET a.ordinv = b.ordinv
    FROM #mensajes_lineas_ordinv a
    INNER JOIN cte_02 b ON
        b.id = a.id
    AND b.orden = 1

END
