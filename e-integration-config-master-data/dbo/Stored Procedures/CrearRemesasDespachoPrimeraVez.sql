
CREATE PROCEDURE [dbo].[CrearRemesasDespachoPrimeraVez]
AS
BEGIN TRY
    ----------------------------------------------------------------------------------------------------------------------------
    --01 CONSOLIDACION DE DATOS
    ----------------------------------------------------------------------------------------------------------------------------
    BEGIN
        ----------------------------------------------------------------------------------------------------------------------------
        --01 REMESAS PROGRAMADAS
        ----------------------------------------------------------------------------------------------------------------------------
        BEGIN
            IF OBJECT_ID('tempdb..#remesas_programadas') IS NOT NULL BEGIN
	            DROP TABLE #remesas_programadas
            END

            ;WITH
            cte_00 AS
            (
                SELECT
                     a.id_remesa_programada
                    ,a.tipo_remesa
                    ,a.es_reprogramacion
                    ,a.numero_remesa

                    ,a.id_linea_negocio
                    ,a.id_bodega
                    ,a.id_cliente
                    ,a.id_servicio
                    ,a.id_tipo_ruta
                    ,a.id_tipo_vehiculo

                    ,a.id_orden
                    ,a.numero_solicitud

                    ,a.placa_programada
                    ,a.fecha_programada
                    ,a.hora_cita_minima
                    ,a.hora_cita_maxima
                    ,a.es_servicio_dedicado

                    ,a.client_id
                    ,a.wh_id
                    ,a.ordnum

                    ,a.estado
                    ,a.notas_migracion
                FROM [eConnect].dbo.remesas_programadas a
                LEFT OUTER JOIN [eSilogtran].dbo.remesas_primera_migracion b ON
                    b.id_cliente = a.id_cliente
                AND b.numero_solicitud = a.numero_solicitud
                AND b.fecha_programada = a.fecha_programada
                AND b.placa_programada = a.placa_programada
                WHERE 1 = 1
                AND b.id_cliente IS NULL
                AND a.estado = 'NO_PROCESADA'
                AND a.tipo_remesa = 'DESPACHO'
                AND a.es_reprogramacion = 0

                AND a.fecha_programada <= CAST(SYSDATETIME() AS DATE)
                AND DATEDIFF(MINUTE,fecha_creacion,SYSDATETIME()) > 15
            )
            SELECT
                a.*

                ,CAST('900083625-3' AS VARCHAR(20)) AS bodega_identificacion
                ,CAST('' AS VARCHAR(100)) AS bodega_nombre
                ,CAST(NULL AS INT) AS id_ciudad_bodega
                ,CAST('' AS VARCHAR(150)) AS bodega_direccion
                ,CAST(0 AS NUMERIC(18,15)) AS bodega_cx
                ,CAST(0 AS NUMERIC(18,15)) AS bodega_cy

                ,COALESCE(b.destinatario_numero_identificacion_alterno,c.numero_identificacion,'---')  COLLATE SQL_Latin1_General_CP1_CI_AS AS tercero_identificacion
                ,CASE 
                 WHEN COALESCE(b.destinatario_nombre_alterno,'') <> '' THEN COALESCE(b.destinatario_nombre_alterno,'')
                 WHEN COALESCE(c.nombre,'') <> '' THEN COALESCE(c.nombre,'')
                 ELSE '' END COLLATE SQL_Latin1_General_CP1_CI_AS AS tercero_nombre
                ,b.id_ciudad_destino AS id_ciudad_tercero
                ,COALESCE(b.destino_direccion,'')  COLLATE SQL_Latin1_General_CP1_CI_AS AS tercero_direccion
                ,COALESCE(b.destino_longitud,0) AS tercero_cx
                ,COALESCE(b.destino_latitud,0) AS tercero_cy

                ,COALESCE(b.requiere_servicio_distribucion,1) AS requiere_servicio_distribucion
                ,CAST(b.fecha_confirmacion AS DATE) AS fecha_solicitud
            INTO #remesas_programadas
            FROM cte_00 a
            INNER JOIN [192.168.10.15].[Satelite].ordenes.ordenes b ON
                b.id_orden = a.id_orden
            LEFT OUTER JOIN [192.168.10.15].[Satelite].crm.destinatarios_remitentes c ON
                c.id_destinatario_remitente = b.id_destinatario_remitente_destinatario

            CREATE UNIQUE CLUSTERED INDEX ix_remesas_programadas_01 ON #remesas_programadas(id_orden,fecha_programada,placa_programada)
        
            CREATE INDEX ix_remesas_programadas_02 ON #remesas_programadas(client_id,wh_id,ordnum)

            UPDATE a
            SET 
                 a.bodega_nombre = b.nombre
                ,a.id_ciudad_bodega = c.id_ciudad
                ,a.bodega_direccion = b.direccion
            FROM #remesas_programadas a
            INNER JOIN [eConnect].dbo.bodegas b ON
                b.id_bodega = a.id_bodega
            LEFT OUTER JOIN [eConnect].dbo.ciudades c ON
                c.id_ciudad = CASE WHEN b.codigo IN ('TL-BOG-SIB-01') THEN 1003 ELSE b.id_ciudad END

            UPDATE a
            SET 
                 a.id_ciudad_tercero = a.id_ciudad_bodega
                ,a.tercero_direccion = a.bodega_direccion
                ,a.tercero_cx = a.bodega_cx
                ,a.tercero_cy = a.bodega_cy
            FROM #remesas_programadas a
            WHERE
                a.requiere_servicio_distribucion = 0
            AND (a.id_ciudad_tercero IS NULL OR a.tercero_direccion = '')

        END

        ----------------------------------------------------------------------------------------------------------------------------
        --02 ORDENES LINEAS
        ----------------------------------------------------------------------------------------------------------------------------
        BEGIN
            IF OBJECT_ID('tempdb..#ordenes_lineas') IS NOT NULL BEGIN
	            DROP TABLE #ordenes_lineas
            END

            SELECT
                 a.id_orden
                ,a.id_bodega

                ,b.numero_item AS numero_linea
                ,CAST(b.id_producto AS BIGINT) AS id_producto
                ,COALESCE(c.codigo,'') AS producto_codigo
                ,CAST(LEFT(b.id_estado_inventario,4) AS VARCHAR(4)) COLLATE SQL_Latin1_General_CP1_CI_AS AS id_estado_inventario
                ,CAST(b.id_unidad AS BIGINT) AS id_unidad_medida
                ,b.cantidad AS unidades_solicitadas
                ,COALESCE(b.valor_declarado_por_unidad,0) AS valor_unitario_declarado
            INTO #ordenes_lineas
            FROM #remesas_programadas a
            INNER JOIN [192.168.10.15].[Satelite].ordenes.lineas_orden b ON
                b.id_orden = a.id_orden    
            LEFT OUTER JOIN [eConnect].dbo.productos c ON
                c.id_producto = b.id_producto

            UPDATE a
            SET
                a.id_unidad_medida = b.id_unidad_medida
            FROM #ordenes_lineas a
            LEFT OUTER JOIN [eConnect].dbo.productos_medidas b ON
                b.id_producto = a.id_producto
            AND b.id_bodega = a.id_bodega
            AND b.rcv_flg = 1
            WHERE
                a.id_unidad_medida IS NULL 
        
            CREATE UNIQUE CLUSTERED INDEX ix_ordenes_01 ON #ordenes_lineas(id_orden,numero_linea)
        END

        ----------------------------------------------------------------------------------------------------------------------------
        --03 SOURCE EMBARQUES
        ----------------------------------------------------------------------------------------------------------------------------
        BEGIN
            IF OBJECT_ID('tempdb..#source_embarques') IS NOT NULL BEGIN
	            DROP TABLE #source_embarques
            END

            ;WITH
            cte_00 AS
            (
                SELECT
                     a.id_remesa_programada
                    ,a.id_bodega
                    ,a.id_cliente
                    ,a.id_orden
                    ,a.numero_solicitud
                    ,a.placa_programada
                    ,a.fecha_programada
            
                    ,a.client_id
                    ,a.wh_id
                    ,a.ordnum

                    ,c.ship_id AS numero_embarque
                    ,c.trlr_typ AS tipo_vehiculo_codigo_alterno
                    ,c.trlr_id AS numero_remolque
                    ,REPLACE(RTRIM(LTRIM(UPPER(c.tractor_num))),' ','') AS placa_despachada
                    ,UPPER(c.driver_lic_num) AS conductor_numero_identificacion
                    ,UPPER(c.driver_nam) AS conductor_nombre
                    ,CAST(c.dispatch_dte AS DATE) AS fecha_cierre_remolque
                    ,c.shipment_mod_usr_id
                    ,c.shipment_moddte

                    ,b.ordlin
                    ,COALESCE(TRY_CAST(b.ordlin AS INT),0) AS numero_linea
                    ,d.id_producto
                    ,b.prtnum AS producto_codigo
                    ,b.invsts AS id_estado_inventario
                    ,e.id_unidad_medida
                    ,b.untqty AS unidades_despachadas
                    ,b.lotnum AS lote
                    ,b.mod_usr_id AS usuario_modificacion
                    ,b.moddte AS fecha_modificacion
            
                    ,b.record_key
                    ,b.line_key
                FROM #remesas_programadas a
                INNER JOIN [eWms].dbo.embarques_lineas b ON
                    b.client_id = a.client_id
                AND b.wh_id = a.wh_id
                AND b.ordnum = a.ordnum
                INNER JOIN [eWms].dbo.embarques c ON
                    c.record_key = b.record_key
                LEFT OUTER JOIN [eConnect].dbo.productos d ON
                    d.id_cliente = a.id_cliente
                AND d.codigo = b.prtnum
                LEFT OUTER JOIN [eConnect].dbo.productos_medidas e ON
                    e.id_producto = d.id_producto
                AND e.id_bodega = a.id_bodega
                AND e.rcv_flg = 1
                WHERE 1 = 1
                AND c.estado = 'CERRADA'
            )
            SELECT
                 a.*
                ,ROW_NUMBER() OVER(PARTITION BY a.id_remesa_programada,a.ordlin ORDER BY a.fecha_modificacion DESC) AS orden_modificacion_linea
        
                ,CASE WHEN a.placa_despachada = '' THEN 1 ELSE 0 END AS placa_despachada_vacia
                ,CASE WHEN a.placa_despachada <> '' AND a.placa_programada <> a.placa_despachada THEN 1 ELSE 0 END AS placas_diferentes
                ,CASE WHEN a.id_producto IS NULL THEN 1 ELSE 0 END AS producto_no_existe
                ,CASE WHEN a.id_unidad_medida IS NULL THEN 1 ELSE 0 END AS unidad_medida_no_existe
            INTO #source_embarques
            FROM cte_00 a
        END

        ----------------------------------------------------------------------------------------------------------------------------
        --CORRECCION DE NUMERO DE LINEA: CASOS ANTIGUOS EN LOS CUALES EN UNA ORDEN ORDLIN = 2 Y 0002 = NUMERO LINEA = 2 Y 2
        --ESTA SITUACION SE PRODUCIA POR LA ANTIGUA INTERFAZ WMS QUE NO RELLENABA CON 0 EL VALOR DE ORDLIN Y LUEGO AL CREAR LINEAS 
        --MANUALMENTE ESTAD ULTIMAS QUEDABAN RELLENADAS i.e. 0002. SON LINEAS DIFERENTES PERO CON EL MISMO NUMERO DE LINEA
        ----------------------------------------------------------------------------------------------------------------------------
        BEGIN
            IF OBJECT_ID('tempdb..#embarques_lineas_correcion_error_por_adicion_lineas') IS NOT NULL BEGIN
	            DROP TABLE #embarques_lineas_correcion_error_por_adicion_lineas
            END

            ;WITH
            cte_00 AS
            (
                SELECT DISTINCT
                        id_orden
                    ,numero_linea
                    ,ordlin
                FROM #source_embarques
            ),
            cte_01 AS
            (
                SELECT
                        id_orden
                    ,numero_linea
                FROM cte_00
                GROUP BY
                        id_orden
                    ,numero_linea
                HAVING
                    COUNT(DISTINCT ordlin) > 1
            )
            SELECT DISTINCT
                 a.id_orden
                ,a.ordlin
                ,a.numero_linea + CASE WHEN ROW_NUMBER() OVER(PARTITION BY a.id_orden,a.numero_linea ORDER BY LEN(a.ordlin)) = 1 THEN 0 ELSE 10000 END AS numero_linea
            INTO #embarques_lineas_correcion_error_por_adicion_lineas
            FROM cte_00 a
            INNER JOIN cte_01 b ON
                b.id_orden = a.id_orden
            AND b.numero_linea = a.numero_linea
    
            UPDATE a
            SET a.numero_linea = b.numero_linea 
            FROM #source_embarques a
            INNER JOIN #embarques_lineas_correcion_error_por_adicion_lineas b ON
                b.id_orden = a.id_orden
            AND b.ordlin = a.ordlin
            WHERE
                a.numero_linea <> b.numero_linea
        END

        ----------------------------------------------------------------------------------------------------------------------------
        --02 EMBARQUES
        ----------------------------------------------------------------------------------------------------------------------------
        BEGIN
            IF OBJECT_ID('tempdb..#embarques') IS NOT NULL BEGIN
	            DROP TABLE #embarques
            END

            SELECT DISTINCT
                 id_remesa_programada
                ,id_bodega	
                ,id_cliente	
                ,id_orden	
                ,numero_solicitud	
                ,placa_programada	
                ,fecha_programada	
                ,client_id	
                ,wh_id	
                ,ordnum

                ,numero_embarque
                ,tipo_vehiculo_codigo_alterno	
                ,numero_remolque	
                ,placa_despachada	
                ,conductor_numero_identificacion	
                ,conductor_nombre	
                ,fecha_cierre_remolque
            INTO #embarques
            FROM #source_embarques
            WHERE 1 = 1
            AND fecha_cierre_remolque <= fecha_programada

            IF OBJECT_ID('tempdb..#embarques_subtotales') IS NOT NULL BEGIN
	            DROP TABLE #embarques_subtotales
            END

            SELECT
                 id_remesa_programada
                ,numero_embarque
                ,ordlin
                ,numero_linea	
                ,id_producto
                ,producto_codigo	
                ,id_estado_inventario	
                ,id_unidad_medida	
                ,SUM(unidades_despachadas) AS unidades_despachadas
            INTO #embarques_subtotales
            FROM #source_embarques
            WHERE 1 = 1
            AND fecha_cierre_remolque <= fecha_programada
            GROUP BY
                 id_remesa_programada
                ,numero_embarque
                ,ordlin
                ,numero_linea	
                ,id_producto
                ,producto_codigo	
                ,id_estado_inventario	
                ,id_unidad_medida	

            IF OBJECT_ID('tempdb..#embarques_totales') IS NOT NULL BEGIN
	            DROP TABLE #embarques_totales
            END

            ;WITH
            cte_00 AS
            (
                SELECT
                     id_remesa_programada
                    ,ordlin
                    ,numero_linea	
                    ,id_producto
                    ,producto_codigo	
                    ,id_estado_inventario	
                    ,id_unidad_medida	
                    ,SUM(unidades_despachadas) AS unidades_despachadas
                FROM #source_embarques
                WHERE 1 = 1
                AND fecha_cierre_remolque <= fecha_programada
                GROUP BY
                     id_remesa_programada
                    ,ordlin
                    ,numero_linea	
                    ,id_producto
                    ,producto_codigo	
                    ,id_estado_inventario	
                    ,id_unidad_medida	
            )
            SELECT
                 a.*
                ,b.usuario_modificacion
                ,b.fecha_modificacion
            INTO #embarques_totales
            FROM cte_00 a
            INNER JOIN #source_embarques b ON
                b.id_remesa_programada = a.id_remesa_programada
            AND b.numero_linea = a.numero_linea
            AND b.orden_modificacion_linea = 1

            CREATE UNIQUE CLUSTERED INDEX ix_embarques_01 ON #embarques(id_remesa_programada,numero_embarque)

            CREATE UNIQUE CLUSTERED INDEX ix_embarques_subtotales_01 ON #embarques_subtotales(id_remesa_programada,numero_embarque,numero_linea)

            CREATE UNIQUE CLUSTERED INDEX ix_embarques_totales_01 ON #embarques_totales(id_remesa_programada,numero_linea)
        END

        ----------------------------------------------------------------------------------------------------------------------------
        --03 SALIDAS
        ----------------------------------------------------------------------------------------------------------------------------
        BEGIN
            IF OBJECT_ID('tempdb..#salidas_lineas') IS NOT NULL BEGIN
	            DROP TABLE #salidas_lineas
            END

            SELECT
                 a.id_remesa_programada
                ,a.id_bodega
                ,a.id_cliente
                ,a.id_orden
                ,a.numero_solicitud
                ,a.placa_programada
                ,a.fecha_programada
            
                ,a.client_id
                ,a.wh_id
                ,a.ordnum

                ,b.ordlin
                ,CAST(c.id_producto AS BIGINT) AS id_producto
                ,b.prtnum AS producto_codigo
                ,b.invsts_prg AS id_estado_inventario
                ,CAST(d.id_unidad_medida AS BIGINT) AS id_unidad_medida
                ,b.ordqty AS unidades_solicitadas
                ,b.shpqty AS unidades_despachadas
                ,b.remqty AS unidades_canceladas

                ,b.ordlin_mod_usr_id
                ,b.ordlin_moddte

                ,CASE WHEN c.id_producto IS NULL THEN 1 ELSE 0 END AS producto_no_existe
                ,CASE WHEN d.id_unidad_medida IS NULL THEN 1 ELSE 0 END AS unidad_medida_no_existe
            INTO #salidas_lineas
            FROM #remesas_programadas a
            INNER JOIN [eWms].dbo.ordenes_salida b ON
                b.client_id = a.client_id
            AND b.wh_id = a.wh_id
            AND b.ordnum = a.ordnum
            LEFT OUTER JOIN [eConnect].dbo.productos c ON
                c.id_cliente = a.id_cliente
            AND c.codigo = b.prtnum
            LEFT OUTER JOIN [eConnect].dbo.productos_medidas d ON
                d.id_producto = c.id_producto
            AND d.id_bodega = a.id_bodega
            AND d.rcv_flg = 1

            CREATE UNIQUE CLUSTERED INDEX ix_ordenes_01 ON #salidas_lineas(id_orden,ordlin)
        END
    END

    ----------------------------------------------------------------------------------------------------------------------------
    --02 DETECCION DE INCONSISTENCIAS
    ----------------------------------------------------------------------------------------------------------------------------
    BEGIN
        ----------------------------------------------------------------------------------------------------------------------------
        --01 INTEGRIDAD REFERENCIAL
        ----------------------------------------------------------------------------------------------------------------------------
        BEGIN
            IF OBJECT_ID('tempdb..#remesas_programadas_sin_movimientos_cedi') IS NOT NULL BEGIN
	            DROP TABLE #remesas_programadas_sin_movimientos_cedi
            END

            ;WITH
            cte_00 AS
            (
                SELECT DISTINCT
                     a.id_remesa_programada
                    ,a.numero_solicitud
                    ,a.client_id
                    ,a.wh_id
                    ,a.ordnum
                    ,CASE WHEN b.id_remesa_programada IS NULL THEN 1 ELSE 0 END AS embarque_no_existe
                    ,CASE WHEN c.id_remesa_programada IS NULL THEN 1 ELSE 0 END AS salida_no_existe
                FROM #remesas_programadas a
                LEFT OUTER JOIN #embarques b ON
                    b.id_remesa_programada = a.id_remesa_programada
                LEFT OUTER JOIN #salidas_lineas c ON
                    c.id_remesa_programada = a.id_remesa_programada
                WHERE
                    a.estado = 'NO_PROCESADA'
            )
            SELECT
                a.*
            INTO #remesas_programadas_sin_movimientos_cedi
            FROM cte_00 a
            WHERE 1 = 0
            OR a.embarque_no_existe = 1
            OR a.salida_no_existe = 1

            UPDATE a
            SET 
                 a.estado = 'ERROR_GENERACION'
                ,a.notas_migracion = 
                CASE WHEN b.embarque_no_existe = 1 THEN 'EMBARQUE NO EXISTE O NO HA SIDO CERRADO O FUE CERRADO POSTERIOR A LA FECHA PROGRAMADA.' ELSE '' END + 
                CASE WHEN b.salida_no_existe = 1 THEN 'SALIDA NO EXISTE WMS.' ELSE '' END
            FROM #remesas_programadas a
            INNER JOIN #remesas_programadas_sin_movimientos_cedi b ON
                b.id_remesa_programada = a.id_remesa_programada
        END

        ----------------------------------------------------------------------------------------------------------------------------
        --02 CANTIDADES ORDLIN VS SHIPMENT_LINE
        ----------------------------------------------------------------------------------------------------------------------------
        BEGIN
            IF OBJECT_ID('tempdb..#salidas_embarques_inconsistencias') IS NOT NULL BEGIN
	            DROP TABLE #salidas_embarques_inconsistencias
            END

            ;WITH
            cte_00 AS
            (
                SELECT
                    id_remesa_programada,ordlin,producto_codigo,SUM(a.unidades_solicitadas) AS unidades_solicitadas,SUM(a.unidades_despachadas) AS unidades_despachadas 
                FROM #salidas_lineas a
                GROUP BY
                    id_remesa_programada,ordlin,producto_codigo
            ),
            cte_01 AS
            (
                SELECT
                    id_remesa_programada,ordlin,producto_codigo,SUM(a.unidades_despachadas) AS unidades_embarcadas
                FROM #embarques_totales a
                GROUP BY
                    id_remesa_programada,ordlin,producto_codigo
            ),
            cte_02 AS
            (
                SELECT
                     COALESCE(a.id_remesa_programada,b.id_remesa_programada) AS id_remesa_programada
                    ,COALESCE(a.ordlin,b.ordlin) AS ordlin
                    ,COALESCE(a.producto_codigo,b.producto_codigo) AS producto_codigo
                    ,COALESCE(a.unidades_solicitadas,0) AS unidades_solicitadas
                    ,COALESCE(a.unidades_despachadas,0) AS unidades_despachadas
                    ,COALESCE(b.unidades_embarcadas,0) AS unidades_embarcadas
                FROM cte_00 a
                FULL OUTER JOIN cte_01 b ON
                    b.id_remesa_programada = a.id_remesa_programada
                AND b.ordlin = a.ordlin
                AND b.producto_codigo = a.producto_codigo
            )
            SELECT
                 a.id_remesa_programada
                ,a.fecha_programada
                ,a.numero_solicitud
                ,a.client_id
                ,a.wh_id
                ,a.ordnum
                ,b.ordlin
                ,b.producto_codigo
                ,b.unidades_solicitadas
                ,b.unidades_despachadas
                ,b.unidades_embarcadas
            INTO #salidas_embarques_inconsistencias
            FROM #remesas_programadas a
            INNER JOIN cte_02 b ON
                b.id_remesa_programada = a.id_remesa_programada
            WHERE 1 = 1
            AND a.estado = 'NO_PROCESADA'
            AND (b.unidades_solicitadas = 0 OR b.unidades_despachadas <> b.unidades_embarcadas)
            ORDER BY
                id_remesa_programada,TRY_CAST(ordlin AS INT)

            CREATE UNIQUE CLUSTERED INDEX ix_ordenes_embarques_inconsistencias_01 ON #salidas_embarques_inconsistencias(id_remesa_programada,ordlin)

            ;WITH
            cte_00 AS
            (
                SELECT DISTINCT
                     a.id_remesa_programada
                    ,CONCAT(a.ordlin,',SKU:',a.producto_codigo,',Solicitado:',a.unidades_solicitadas,',Salida:',a.unidades_despachadas,',Embarque:',a.unidades_embarcadas,'.') AS notas_migracion
                    ,ROW_NUMBER() OVER (PARTITION BY a.id_remesa_programada ORDER BY a.ordlin) AS orden
                FROM #salidas_embarques_inconsistencias a
            ),
            cte_01 AS
            (
                SELECT
                    id_remesa_programada
                    ,CONCAT([1],[2],[3],[4],[5],CASE WHEN [6] IS NOT NULL THEN '...' ELSE '' END) AS notas_migracion
                FROM cte_00 a
                PIVOT
                (MAX(notas_migracion)
                FOR orden IN ([1], [2], [3], [4], [5], [6])
                ) AS b
            )
            UPDATE a
            SET 
                 a.estado = 'ERROR_GENERACION'
                ,a.notas_migracion = LEFT(CONCAT('EXISTEN DIFERENCIAS ENTRE LA CANTIDAD DESPACHADA EN LAS SALIDAS DEL INVENTARIO (ORDLIN) Y LOS EMBARQUES DESPACHADOS (shipment_line). VERIFIQUE QUE TODOS LOS DESPACHOS SEAN ANTERIORES O IGUALES A LA FECHA PROGRAMADA DEL SERVICIO.',b.notas_migracion),1024)
            FROM #remesas_programadas a
            INNER JOIN cte_01 b ON
                b.id_remesa_programada = a.id_remesa_programada
        END

        ----------------------------------------------------------------------------------------------------------------------------
        --04 ORDENES
        ----------------------------------------------------------------------------------------------------------------------------
        BEGIN
            IF OBJECT_ID('tempdb..#ordenes_inconsistencias') IS NOT NULL BEGIN
	            DROP TABLE #ordenes_inconsistencias
            END

            ;WITH
            cte_00 AS
            (
                SELECT
                     a.id_remesa_programada

                    ,b.numero_linea
                    ,b.id_producto
                    ,b.id_estado_inventario
                    ,b.id_unidad_medida
                    ,b.unidades_solicitadas
                    ,b.valor_unitario_declarado

                    ,CASE WHEN a.id_ciudad_tercero IS NULL THEN 1 ELSE 0 END AS tercero_ciudad_no_existe
                    ,CASE WHEN a.tercero_direccion = '' THEN 1 ELSE 0 END AS tercero_direccion_vacia
                    ,CASE WHEN b.valor_unitario_declarado > 1000*1000*20 THEN 1 ELSE 0 END AS valor_unitario_declarado_muy_alto
                FROM #remesas_programadas a
                INNER JOIN #ordenes_lineas b ON
                    b.id_orden = a.id_orden
            )
            SELECT
                 a.*
            INTO #ordenes_inconsistencias
            FROM cte_00 a
            WHERE 0 = 1
            OR a.tercero_ciudad_no_existe = 1
            OR a.tercero_direccion_vacia = 1
            --OR a.valor_unitario_declarado_muy_alto = 1
        
            CREATE CLUSTERED INDEX ix_ordenes_inconsistencias_01 ON #ordenes_inconsistencias(id_remesa_programada)

            UPDATE a
            SET 
                 a.estado = 'ERROR_GENERACION'
                ,a.notas_migracion = 
                CASE WHEN b.tercero_ciudad_no_existe = 1 THEN 'HACE FALTA LA CIUDAD DEL DESTINATARIO;' ELSE '' END + 
                CASE WHEN b.tercero_direccion_vacia = 1 THEN 'HACE FALTA LA DIRECCION DEL DESTINATARIO;' ELSE '' END +
                CASE WHEN b.valor_unitario_declarado_muy_alto = 1 THEN 'AL MENOS UNO DE LOS PRODUCTOS TIENE UN VALOR UNITARIO MUY ALTO;' ELSE '' END
            FROM #remesas_programadas a
            INNER JOIN #ordenes_inconsistencias b ON
                b.id_remesa_programada = a.id_remesa_programada
        END
    END

    ----------------------------------------------------------------------------------------------------------------------------
    --03 CONSOLIDACION DE REMESAS
    ----------------------------------------------------------------------------------------------------------------------------
    BEGIN
        IF OBJECT_ID('tempdb..#remesas') IS NOT NULL BEGIN
	        DROP TABLE #remesas
        END

        SELECT DISTINCT
             CAST(NULL AS BIGINT) AS id_remesa
            ,a.tipo_remesa
            ,a.es_reprogramacion
            ,a.numero_remesa
            ,'NO_PROCESADA' AS estado
            ,a.numero_solicitud

            ,a.id_linea_negocio
            ,CAST(NULL AS BIGINT) AS id_orden_transporte
            ,a.id_bodega
            ,a.id_cliente
            ,a.id_servicio
            ,a.id_tipo_ruta
            ,a.id_tipo_vehiculo
        
            ,a.placa_programada
            ,a.fecha_programada
            ,b.placa_despachada
            ,b.fecha_cierre_remolque AS fecha_despacho
            --SOLO APLICA PARA LAS REMESAS CON UN SOLO DESPACHO. REVISAR COMO QUEDARIA CON LAS REPROGRAMACIONES
            ,a.placa_programada AS placa_remesa
            ,a.fecha_programada AS fecha_remesa
        
            ,a.hora_cita_minima
            ,a.hora_cita_maxima
            ,a.es_servicio_dedicado

            ,'NIT' AS remitente_tipo_documento
            ,a.bodega_identificacion AS remitente_numero_documento
            ,a.bodega_nombre AS remitente_nombre
            ,a.id_ciudad_bodega AS id_ciudad_remitente
            ,a.bodega_direccion AS remitente_direccion
            ,a.bodega_cx AS remitente_cx
            ,a.bodega_cy AS remitente_cy
            ,'' AS remitente_telefonos
            ,'' AS remitente_contacto

            ,'NIT' AS destinatario_tipo_documento
            ,a.tercero_identificacion AS destinatario_numero_documento
            ,a.tercero_nombre AS destinatario_nombre
            ,a.id_ciudad_tercero AS id_ciudad_destinatario
            ,a.tercero_direccion AS destinatario_direccion
            ,a.tercero_cx AS destinatario_cx
            ,a.tercero_cy AS destinatario_cy
            ,'' AS destinatario_telefonos
            ,'' AS destinatario_contacto

            ,SYSTEM_USER AS usuario_creacion
            ,SYSDATETIME() AS fecha_creacion
            ,SYSTEM_USER AS usuario_modificacion
            ,SYSDATETIME() AS fecha_modificacion

            ,a.id_orden
            ,a.id_remesa_programada
        INTO #remesas
        FROM #remesas_programadas a
        INNER JOIN #embarques b ON
            b.id_remesa_programada = a.id_remesa_programada
        WHERE
            a.estado = 'NO_PROCESADA'

        IF OBJECT_ID('tempdb..#remesas_duplicadas_por_embarques') IS NOT NULL BEGIN
	        DROP TABLE #remesas_duplicadas_por_embarques
        END

        SELECT 
            id_remesa_programada
        INTO #remesas_duplicadas_por_embarques
        FROM #remesas
        GROUP BY
            id_remesa_programada,placa_programada,fecha_programada
        HAVING COUNT(1)>1

        UPDATE a
        SET 
             a.estado = 'ERROR_GENERACION'
            ,a.notas_migracion = 'ESTA REMESA POSEE MAS DE UN DESPACHO EN WMS POR PLACA O FECHA DE DESPACHO DIFERENTES'
        FROM #remesas_programadas a
        INNER JOIN #remesas_duplicadas_por_embarques b ON
            b.id_remesa_programada = a.id_remesa_programada

        DELETE a
        FROM #remesas a
        INNER JOIN #remesas_duplicadas_por_embarques b ON
            b.id_remesa_programada = a.id_remesa_programada

        CREATE UNIQUE INDEX ix_remesas_01 ON #remesas(id_remesa_programada)

        IF OBJECT_ID('tempdb..#remesas_lineas') IS NOT NULL BEGIN
	        DROP TABLE #remesas_lineas
        END

        SELECT
             a.id_orden
            ,b.*

            ,c.largo
            ,c.ancho
            ,c.alto
            ,c.peso
            ,CAST(0 AS INT) AS valor_unitario_declarado

            ,d.id_unidad_medida AS id_unidad_medida_caja
            ,d.factor_conversion
            ,d.largo AS caja_largo
            ,d.ancho AS caja_ancho
            ,d.alto AS caja_alto
            ,d.peso AS caja_peso
        INTO #remesas_lineas
        FROM #remesas a
        INNER JOIN #embarques_totales b ON
            b.id_remesa_programada = a.id_remesa_programada
        LEFT OUTER JOIN [eConnect].dbo.productos_medidas c ON
            c.id_producto = b.id_producto
        AND c.id_bodega = a.id_bodega
        AND c.id_unidad_medida = b.id_unidad_medida
        LEFT OUTER JOIN [eConnect].dbo.productos_medidas d ON
            d.id_producto = b.id_producto
        AND d.id_bodega = a.id_bodega
        AND d.cas_flg = 1

        UPDATE a
        SET a.valor_unitario_declarado = COALESCE(b.valor_unitario_declarado,0)
        FROM #remesas_lineas a
        INNER JOIN #ordenes_lineas b ON
            b.id_orden = a.id_orden
        AND b.numero_linea = a.numero_linea

        CREATE UNIQUE INDEX ix_remesas_lineas_01 ON #remesas_lineas(id_remesa_programada,numero_linea)
    END

    ----------------------------------------------------------------------------------------------------------------------------
    --04 CREACION DE REMESAS
    ----------------------------------------------------------------------------------------------------------------------------
    BEGIN TRANSACTION
    BEGIN
        DECLARE @t AS TABLE(id_orden BIGINT,fecha_remesa DATE,placa_remesa VARCHAR(20),id_remesa BIGINT)

        INSERT INTO [eConnect].dbo.remesas
            (tipo_remesa
            ,es_reprogramacion
            ,numero_remesa
            ,estado
            ,numero_solicitud

            ,id_linea_negocio
            ,id_orden_transporte
            ,id_bodega
            ,id_cliente
            ,id_servicio
            ,id_tipo_ruta
            ,id_tipo_vehiculo

            ,placa_programada
            ,fecha_programada
            ,placa_despachada
            ,fecha_despacho
            ,placa_remesa
            ,fecha_remesa

            ,hora_cita_minima
            ,hora_cita_maxima
            ,es_servicio_dedicado

            ,remitente_tipo_documento
            ,remitente_numero_documento
            ,remitente_nombre
            ,id_ciudad_remitente
            ,remitente_direccion
            ,remitente_cx
            ,remitente_cy
            ,remitente_telefonos
            ,remitente_contacto

            ,destinatario_tipo_documento
            ,destinatario_numero_documento
            ,destinatario_nombre
            ,id_ciudad_destinatario
            ,destinatario_direccion
            ,destinatario_cx
            ,destinatario_cy
            ,destinatario_telefonos
            ,destinatario_contacto
        
            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion
        
            ,id_orden)
            OUTPUT inserted.id_orden,inserted.fecha_remesa,inserted.placa_remesa,inserted.id_remesa
            INTO @t
        SELECT
             tipo_remesa
            ,es_reprogramacion
            ,numero_remesa
            ,estado
            ,numero_solicitud

            ,id_linea_negocio
            ,id_orden_transporte
            ,id_bodega
            ,id_cliente
            ,id_servicio
            ,id_tipo_ruta
            ,id_tipo_vehiculo

            ,placa_programada
            ,fecha_programada
            ,placa_despachada
            ,fecha_despacho
            ,placa_remesa
            ,fecha_remesa

            ,hora_cita_minima
            ,hora_cita_maxima
            ,es_servicio_dedicado

            ,remitente_tipo_documento
            ,remitente_numero_documento
            ,remitente_nombre
            ,id_ciudad_remitente
            ,remitente_direccion
            ,remitente_cx
            ,remitente_cy
            ,remitente_telefonos
            ,remitente_contacto

            ,destinatario_tipo_documento
            ,destinatario_numero_documento
            ,destinatario_nombre
            ,id_ciudad_destinatario
            ,destinatario_direccion
            ,destinatario_cx
            ,destinatario_cy
            ,destinatario_telefonos
            ,destinatario_contacto
        
            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion
        
            ,id_orden
        FROM #remesas a

        UPDATE a
        SET a.id_remesa = b.id_remesa
        FROM #remesas a 
        INNER JOIN @t b ON
            b.id_orden = a.id_orden
        AND b.fecha_remesa = a.fecha_remesa
        AND b.placa_remesa = a.placa_remesa

        INSERT INTO [eConnect].dbo.remesas_lineas
            (id_remesa
            ,numero_linea
            ,id_producto
            ,producto_codigo
            ,id_estado_inventario
            ,id_unidad_medida
            ,unidades_despachadas

            ,largo
            ,ancho
            ,alto
            ,peso
            ,valor_unitario_declarado

            ,id_unidad_medida_caja
            ,factor_conversion
            ,caja_largo
            ,caja_ancho
            ,caja_alto
            ,caja_peso

            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion)
        SELECT
             a.id_remesa
        
            ,b.numero_linea
            ,b.id_producto
            ,b.producto_codigo
            ,b.id_estado_inventario
            ,b.id_unidad_medida
            ,b.unidades_despachadas

            ,b.largo
            ,b.ancho
            ,b.alto
            ,b.peso
            ,b.valor_unitario_declarado

            ,b.id_unidad_medida_caja
            ,b.factor_conversion
            ,b.caja_largo
            ,b.caja_ancho
            ,b.caja_alto
            ,b.caja_peso
        
            ,a.usuario_creacion
            ,a.fecha_creacion
            ,a.usuario_modificacion
            ,a.fecha_modificacion
        FROM #remesas a
        INNER JOIN #remesas_lineas b ON
            b.id_remesa_programada = a.id_remesa_programada
    END

    BEGIN
        UPDATE a
        SET 
             a.estado = 'GENERADA'
            ,a.notas_migracion = '' 
        FROM #remesas_programadas a
        INNER JOIN #remesas b ON
            b.id_remesa_programada = a.id_remesa_programada

        UPDATE a
        SET 
             a.estado = b.estado
            ,a.notas_migracion = b.notas_migracion
            ,a.[version] = a.[version] + 1
            ,a.usuario_modificacion = SYSTEM_USER
            ,a.fecha_modificacion = SYSDATETIME()
        FROM [eConnect].dbo.remesas_programadas a
        INNER JOIN #remesas_programadas b ON
            b.id_remesa_programada = a.id_remesa_programada
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
