CREATE VIEW ordenes_transporte_base_remesas AS
SELECT
	 a.id_orden_transporte

	,c.codigo_alterno_tms AS remesas_centro_costo
	,d.codigo_alterno_tms AS remesas_tipo_remesa
	,e.codigo_alterno_tms AS remesas_codigo_cliente
	,'0' AS remesas_division_cliente --NO HAY DEFINICION DE COMO SACARLO DE LA BD. SE UTILIZA EL VALOR CONSTANTE USUALMENTE USADO EN LA GENERACION DE REMESAS

	,a.remitente_nombre AS remesas_nombre_remitente
	,o.codigo_alterno_tms AS remesas_tipo_documento_remitente
	,a.remitente_identificacion AS remesas_documento_remitente
	,a.remitente_direccion AS remesas_direccion_remitente
	,a.remitente_telefonos AS remesas_telefono_remitente
	,a.remitente_contacto AS remesas_contacto_remitente
	,f.id_ciudad
	,f.codigo_alterno_tms AS remesas_ciudad_remitente --ya solicite colocar los codigos de silogtran a esta tabla
	,g.codigo_alterno_tms AS remesas_departamento_remitente --ya solicite colocar los codigos de silogtran a esta tabla

	,a.destinatario_nombre AS remesas_nombre_destinatario
	,o.codigo_alterno_tms AS remesas_tipo_documento_destinatario
	,a.destinatario_identificacion AS remesas_documento_destinatario
	,a.destinatario_direccion AS remesas_direccion_destinatario
	,a.destinatario_telefonos AS remesas_telefono_destinatario
	,a.destinatario_contacto AS remesas_contacto_destinatario1
	,'???' AS remesas_contacto_destinatario2
	,h.codigo_alterno_tms AS remesas_ciudad_destinatario --ya solicite colocar los codigos de silogtran a esta tabla
	,i.codigo_alterno_tms AS remesas_departamento_destinatario --ya solicite colocar los codigos de silogtran a esta tabla

	,'0' AS remesas_zona_ciudad_destinatario  --NO HAY DEFINICION DE COMO SACARLO DE LA BD. SE UTILIZA EL VALOR CONSTANTE USUALMENTE USADO EN LA GENERACION DE REMESAS
	,a.destinatario_cx AS remesas_coordenada_x_longitud --SOLO APLICA PARA REMESAS DE DESPACHO, CUANDO SEAN RECOGIDAS SE DEBE USAR a.remitente_cx y a.remitente_cy
	,a.destinatario_cy AS remesas_coordenada_y_latitud

	,'NO HAN DEFINIDO QUE COLOCAR EN ESTE ATRIBUTO PERO SEGUN ENTIENDO NO PUEDE IR VACIO' AS remesas_observacion_remesa
	,FORMAT(a.fecha_minima_solicitada,'yyyy-MM-dd') AS remesas_fecha_compromiso_minima
    ,FORMAT(a.fecha_maxima_solicitada,'yyyy-MM-dd') AS remesas_fecha_compromiso_maxima
    ,FORMAT(a.hora_minima_solicitada,'hh\:mm\:ss') AS remesas_hora_compromiso_maxima
    ,FORMAT(a.hora_maxima_solicitada,'hh\:mm\:ss') AS remesas_hora_compromiso_minima

	,a.placa AS remesas_placa_vehiculo --OJO PARA QUE ESTE DATO VENGA CON UN VALOR VALIDO TOCA IMPLEMENTAR EL CARGUE DE LAS RUTAS OPTIMIZADAS
	,a.secuencia_ruta AS remesas_secuencia_entrega
	
	,'???' AS remesas_tipo_remision --NO SE HA DEFINIDO COMO DETERMINAR EL TIPO DE DOCUMENTO DE ENTREGA
	,a.numero_remesa_tms AS remesas_remision --ESTE VIENE SIENDO EL NUMERO DE DOCUMENTO DE ENTREGA QUE PUEDE SER LA FACTURA, SALIDA (FREE GOOD) O TRASLADO QUE EN EL CASO DE GWS, SE GENERA DESPUES DE HABER NOTIFICADO LAS ORDENES EN STAGE
	,a.numero_orden_wms AS remesas_documento_wms
	,a.numero_orden AS remesas_documento_numero_solicitud
	,a.id_solicitud AS remesas_id_ordentransporte
	
	,'???' AS remesas_punto_codigo_alterno -- datos solo usados por INGREDION
	,'???' AS remesas_regional -- datos solo usados por INGREDION
	,'???' AS remesas_ciudad_nombre_alterno -- datos solo usados por INGREDION
	,'???' AS remesas_bodega_codigo_alterno -- datos solo usados por INGREDION
	,'???' AS remesas_programa -- datos solo usados por INGREDION
	,'???' AS remesas_planta -- datos solo usados por INGREDION
	
	,k.id_producto AS remesas_items_id_producto_econnect
	,k.producto_codigo AS remesas_items_codigo_producto
	,k.producto_nombre AS remesas_items_producto_nombre
	,k.producto_codigo_ministerio AS remesas_items_producto_codigoministerio --AUN NO SE HA ACLARADO COMO SE VA A POBLAR ESTA COLUMNA EN LA TABLA ordenes_transporte_lineas
	,l.codigo_alterno_tms AS remesas_items_naturaleza_carga --AUN NO SE HA ACLARADO COMO SE VA A POBLAR ESTA COLUMNA EN LA TABLA ordenes_transporte_lineas
	,m.codigo_alterno_tms AS remesas_items_tipo_producto --AUN NO SE HA ACLARADO COMO SE VA A POBLAR ESTA COLUMNA EN LA TABLA ordenes_transporte_lineas

	--ya solicite colocar los codigos de silogtran a esta tabla unidades_medida
	,n.codigo_alterno_tms AS remesas_items_codigo_empaque --PARA QUE LA REMESA SE VEA IGUAL A WMS Y A LA SOLICITUD DEBERIA SER LA UNIDAD MINIMA
	,k.unidades AS remesas_items_cantidad --SI SE DECIDE USAR LA UNIDAD MINIMA SE DEBE USAR k.unidades (ENTERO) PERO SI SE DECIDE ENVIAR EMBALAJE ENTONCES SE DEBE USAR k.unidades_embalaje (DECIMAL)
	,k.factor_conversion AS remesas_items_factor_conversion -- k.unidades = k.unidades_embalaje*k.factor_conversion
	,k.unidades_embalaje AS remesas_items_cantidad_embalaje -- DECIMAL

	,k.peso_unitario AS remesas_items_peso -- DECIMAL. Tambien podria ser k.peso_unitario * k.unidades o k.peso_embalaje o k.peso_embalaje * k.unidades_embalaje
	,k.peso_bruto_unitario AS remesas_items_peso_bruto -- DECIMAL. Tambien podria ser k.peso_unitario * k.unidades o k.peso_embalaje o k.peso_embalaje * k.unidades_embalaje
	,k.volumen_unitario AS remesas_items_volumen
	,k.valor_declarado_unitario AS remesas_items_valor_declarado -- DECIMAL. ESTE DATO NO SE TIENE. Tambien podria ser k.valor_declarado_unitario * k.unidades
	,'NO HAN DEFINIDO QUE COLOCAR EN ESTE ATRIBUTO PERO SEGUN ENTIENDO NO PUEDE IR VACIO' AS remesas_items_descripcion_detalle_remesa
	,k.predistribucion AS remesas_items_predistribucion

	,'SI SE ENVIA ESTE DATO LAS LINEAS DE LA REMESA NO SERAN IGUALES A LAS LINEAS DE ORDENES DE ALISTAMIENTO NI A LAS LINEAS DE LA SOLICITUD. ESTO SERA UN PROBLEMA PARA TEMAS DE SEGUIMIENTO' AS remesas_items_lote
	,'SI SE ENVIA ESTE DATO LAS LINEAS DE LA REMESA NO SERAN IGUALES A LAS LINEAS DE ORDENES DE ALISTAMIENTO NI A LAS LINEAS DE LA SOLICITUD. ESTO SERA UN PROBLEMA PARA TEMAS DE SEGUIMIENTO' AS remesas_items_estado_inventario_nombre
	,'SI SE ENVIA ESTE DATO LAS LINEAS DE LA REMESA NO SERAN IGUALES A LAS LINEAS DE ORDENES DE ALISTAMIENTO NI A LAS LINEAS DE LA SOLICITUD. ESTO SERA UN PROBLEMA PARA TEMAS DE SEGUIMIENTO' AS remesas_items_fecha_vencimiento
FROM ordenes_transporte a
INNER JOIN bodegas b ON
	b.id_bodega = a.id_bodega
INNER JOIN centros_costo c ON
	c.id_centro_costo = 1
INNER JOIN tipos_remesa d ON
	d.id_tipo_remesa = a.id_tipo_remesa
INNER JOIN clientes e ON
	e.id_cliente = a.id_cliente
INNER JOIN ciudades f ON
	f.id_ciudad = a.id_ciudad_remitente
INNER JOIN departamentos g ON
	g.id_departamento = f.id_departamento
INNER JOIN ciudades h ON
	h.id_ciudad = a.id_ciudad_destinatario
INNER JOIN departamentos i ON
	i.id_departamento = h.id_departamento
INNER JOIN tipos_remesa j ON
	j.id_tipo_remesa = a.id_tipo_remesa

INNER JOIN ordenes_transporte_lineas_alistadas k ON
	k.id_orden_transporte = a.id_orden_transporte
INNER JOIN tipos_naturaleza_producto l ON
	l.id_tipo_naturaleza_producto = k.id_tipo_naturaleza_producto
INNER JOIN tipos_producto m ON
	m.id_tipo_producto = k.id_tipo_producto
INNER JOIN unidades_medida n ON
	n.id_unidad_medida = k.id_unidad_medida --SI SE DECIDE USAR EL CODIGO DE LA UNIDAD MINIMA (UN, KL)
--	n.id_unidad_medida = k.id_unidad_medida_embalaje --SI SE DECIDE USAR EL CODIGO DE LA UNIDAD DE EMBALAJE (CJ CAJA,BU BULTO)

INNER JOIN tipos_identificacion o ON
	o.id_tipo_identificacion = a.id_tipo_identificacion_remitente
INNER JOIN tipos_identificacion p ON
	p.id_tipo_identificacion = a.id_tipo_identificacion_destinatario