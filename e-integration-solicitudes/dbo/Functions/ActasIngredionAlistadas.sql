
CREATE FUNCTION [dbo].[ActasIngredionAlistadas]() 
RETURNS TABLE 
AS
RETURN 
(
WITH
cte_00 AS
(
    SELECT
         a.id_solicitud_acta
        ,a.id_externo
        ,a.estado_solicitud
        ,a.subestado_solicitud
        ,a.reintentos
        ,a.numero_confirmacion_silogtran
        ,a.fecha_integracion_silogtran
        ,a.fecha_creacion
        ,a.fecha_modificacion

        ,a.id_bodega
        ,b.id_bodega_virtual
        ,a.fecha_minima_solicitada
        ,a.fecha_maxima_solicitada
    

        --ENCABEZADO
        ,COALESCE(d.valor,'') AS centro_costo
        ,'DISTRIBUCION INGREDION' AS tipo_remesa
        ,a.cliente_codigo_alterno_tms
        ,'0' AS cliente_division
        ,'NIT' AS solicitud_tipo_documento
        ,a.numero_solicitud AS solicitud_numero_documento
        ,a.ordnum AS orden_alistamiento_numero_documento
        ,'ACTA' AS remision_tipo_remision
        ,a.stgdte
        ,a.rmanum AS remision_numero_documento
    
        --ENCABEZADO REMITENTE
        ,'NIT' AS remitente_tipo_identificacion
        ,a.remitente_identificacion
        ,a.remitente_nombre
        ,a.remitente_departamento
        ,a.remitente_ciudad
        ,a.remitente_direccion
        ,a.remitente_telefono
        ,a.remitente_contacto
    
        --ENCABEZADO DESTINATARIO
        ,'NIT' AS destinatario_tipo_identificacion
        ,a.destinatario_identificacion
        ,a.destinatario_nombre
        ,a.destinatario_departamento
        ,a.destinatario_ciudad
        ,a.destinatario_direccion
        ,a.destinatario_telefono
        ,a.destinatario_contacto

        ,'0' AS destinatario_ciudad_zona
        ,0.0 AS destinatario_coordenada_x
        ,0.0 AS destinatario_coordenada_y

        --ENCABEZADO DATOS DE LA ENTREGA
        ,FORMAT(a.fecha_minima_solicitada,'yyyy-MM-dd') AS fecha_compromiso_inicial
        ,FORMAT(a.fecha_maxima_solicitada,'yyyy-MM-dd') AS fecha_compromiso_final
        ,FORMAT(a.hora_minima_solicitada,'hh\:mm\:ss') AS hora_compromiso_inicial
        ,FORMAT(a.hora_maxima_solicitada,'hh\:mm\:ss') AS hora_compromiso_final
        
        ,'AAA000' AS placa_vehiculo
        ,0 AS secuencia_entrega
        ,0 AS seguro
        ,0 AS tarifa
        ,a.bodega_codigo_alterno
        ,a.programa
        ,a.punto_codigo_alterno
        ,a.punto_nombre_alterno
        ,a.responsable_principal
        ,a.responsable_suplente
        ,a.telefono AS remesa_observacion
		--Campos nuevos
		,a.regional
        ,a.ciudad_codigo_alterno
		,a.ciudad_nombre_alterno
		,a.planta
		------------------------------------------------------------

        --LINEAS
        ,b.id_producto
        ,b.prtnum AS producto_codigo 
        ,b.producto_nombre
        ,b.id_estado_inventario
        ,b.estado_inventario_nombre
        ,b.lotnum AS lote
        ,FORMAT(b.expire_dte,'yyyy-MM-dd') AS fecha_vencimiento
        ,b.empaques AS cantidad
        ,b.unidad_medida_codigo_alterno_tms
        ,1 AS factor_conversion
        ,b.empaques AS cantidad_empaques
        ,b.unidad_empaque_codigo_alterno_tms
        ,b.peso_empaques
        ,b.volumen_empaques
        ,0 AS valor_declarado
        ,a.periodo AS predistribucion
		,a.periodo
    FROM [$(eConnect)].dbo.solicitudes_actas_ingredion a
    INNER JOIN [$(eConnect)].dbo.solicitudes_actas_ingredion_lineas_alistadas b ON
        b.id_solicitud_acta = a.id_solicitud_acta
    INNER JOIN [$(eIntegration)].dbo.mapas c ON
        c.codigo = 'BODEGAS_INGREDION_CENTROS_COSTO'
    LEFT OUTER JOIN [$(eIntegration)].dbo.mapas_valores d ON
        d.id_mapa = c.id_mapa
    AND d.clave = a.bodega_codigo_alterno
)
SELECT
     REPLACE(REPLACE(
	 CONCAT(
        tipo_remesa,';',
        cliente_codigo_alterno_tms,';',
        cliente_division,';',
        remitente_nombre,';',
        remitente_tipo_identificacion,';',
        remitente_identificacion,';',
        remitente_direccion,';',
        remitente_telefono,';',
        remitente_contacto,';',
        remitente_ciudad,';',
        remitente_departamento,';',
        destinatario_nombre,';',
        destinatario_tipo_identificacion,';',
        destinatario_identificacion,';',
        destinatario_direccion,';',
        destinatario_telefono,';',
        destinatario_contacto,';',
        destinatario_ciudad,';',
        destinatario_departamento,';',
        destinatario_ciudad_zona,';',
        
        REPLACE(destinatario_coordenada_x,',','.'),';',
        REPLACE(destinatario_coordenada_y,',','.'),';',
        
        remesa_observacion,';',
        fecha_compromiso_inicial,';',
		fecha_compromiso_final,';',
        hora_compromiso_inicial,';',
        hora_compromiso_final,';',
        placa_vehiculo,';',
        secuencia_entrega,';',

        id_producto,';',
        producto_nombre,';',
        unidad_empaque_codigo_alterno_tms,';',
        
        REPLACE(peso_empaques,',','.'),';',
        REPLACE(peso_empaques,',','.'),';',
        REPLACE(cantidad,',','.'),';',
        REPLACE(volumen_empaques,',','.'),';',
        REPLACE(valor_declarado,',','.'),';',

        solicitud_tipo_documento,';',
        remision_tipo_remision,';',
        remision_numero_documento,';',
        orden_alistamiento_numero_documento,';',
        solicitud_numero_documento,';',
        remesa_observacion,';',
        predistribucion,';',
        factor_conversion,';',
        REPLACE(cantidad_empaques,',','.'),';',
        seguro,';',
        tarifa,';',

        lote,';',
        estado_inventario_nombre,';',
        fecha_vencimiento,';',
        bodega_codigo_alterno,';',
        programa,';',
        punto_codigo_alterno,';',
        responsable_principal,';',
        responsable_suplente,';',
		--Adicion dos nuevos campos en la remesa
		regional,';',
		ciudad_nombre_alterno,';',
		planta,';',
		periodo,';',
		REPLACE(cantidad_empaques,',','.')
    ),CHAR(10),''),CHAR(13),'') AS registro
    ,a.*
FROM cte_00 a
)