USE [eConnect]
GO
INSERT [dbo].[tipos_wms_integracion] ([id_tipo_wms_integracion], [codigo], [nombre], [descripcion], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (1, N'ALISTAMIENTO', N'ALISTAMIENTO', N'', 1, 1, 0, N'', CAST(N'2018-11-07T00:00:00.0000000' AS DateTime2), N'', CAST(N'2018-11-07T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_wms_integracion] ([id_tipo_wms_integracion], [codigo], [nombre], [descripcion], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (2, N'RECIBO', N'RECIBO', N'', 2, 1, 0, N'', CAST(N'2018-11-07T00:00:00.0000000' AS DateTime2), N'', CAST(N'2018-11-07T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_wms_integracion] ([id_tipo_wms_integracion], [codigo], [nombre], [descripcion], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (3, N'TRABAJO', N'TRABAJO', N'', 3, 1, 0, N'', CAST(N'2018-11-07T00:00:00.0000000' AS DateTime2), N'', CAST(N'2018-11-07T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_wms_orden] ([id_tipo_orden_wms], [codigo], [nombre], [descripcion], [id_tipo_wms_integracion], [codigo_wms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (1, N'RET', N'PEDIDO', N'', 1, N'RET', 1, 1, 0, N'', CAST(N'2018-11-07T14:06:40.0000000' AS DateTime2), N'', CAST(N'2018-11-07T14:06:40.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_wms_orden] ([id_tipo_orden_wms], [codigo], [nombre], [descripcion], [id_tipo_wms_integracion], [codigo_wms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (2, N'XD', N'PREDISTRIBUCION', N'', 1, N'XD', 2, 1, 0, N'', CAST(N'2018-11-07T14:06:40.0000000' AS DateTime2), N'', CAST(N'2018-11-07T14:06:40.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_wms_orden] ([id_tipo_orden_wms], [codigo], [nombre], [descripcion], [id_tipo_wms_integracion], [codigo_wms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (3, N'REC', N'RECIBO', N'', 2, N'REC', 3, 1, 0, N'', CAST(N'2018-11-07T14:06:40.0000000' AS DateTime2), N'', CAST(N'2018-11-07T14:06:40.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_wms_orden] ([id_tipo_orden_wms], [codigo], [nombre], [descripcion], [id_tipo_wms_integracion], [codigo_wms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (4, N'DEV', N'DEVOLUCION', N'', 2, N'DEV', 4, 1, 0, N'', CAST(N'2018-11-07T14:06:40.0000000' AS DateTime2), N'', CAST(N'2018-11-07T14:06:40.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_wms_orden] ([id_tipo_orden_wms], [codigo], [nombre], [descripcion], [id_tipo_wms_integracion], [codigo_wms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (5, N'RHZ', N'RECHAZO', N'', 2, N'RHZ', 5, 1, 0, N'', CAST(N'2018-11-07T14:06:40.0000000' AS DateTime2), N'', CAST(N'2018-11-07T14:06:40.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_wms_orden] ([id_tipo_orden_wms], [codigo], [nombre], [descripcion], [id_tipo_wms_integracion], [codigo_wms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (6, N'TRS-SALIDA', N'TRASLADO ENTRE CEDIS-SALIDA', N'', 1, N'TRS', 6, 1, 0, N'', CAST(N'2018-11-07T14:06:40.0000000' AS DateTime2), N'', CAST(N'2018-11-07T14:06:40.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_wms_orden] ([id_tipo_orden_wms], [codigo], [nombre], [descripcion], [id_tipo_wms_integracion], [codigo_wms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (7, N'TRS-RECIBO', N'TRASLADO ENTRE CEDIS-RECIBO', N'', 2, N'TRS', 7, 1, 0, N'', CAST(N'2018-11-07T14:06:40.0000000' AS DateTime2), N'', CAST(N'2018-11-07T14:06:40.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_wms_orden] ([id_tipo_orden_wms], [codigo], [nombre], [descripcion], [id_tipo_wms_integracion], [codigo_wms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (8, N'DSENSAMBLE', N'DESENSAMBLE DE OFERTAS', N'', 3, N'DSENSAMBLE', 8, 1, 0, N'', CAST(N'2018-11-07T14:06:40.0000000' AS DateTime2), N'', CAST(N'2018-11-07T14:06:40.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_wms_orden] ([id_tipo_orden_wms], [codigo], [nombre], [descripcion], [id_tipo_wms_integracion], [codigo_wms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (9, N'ESTAMPILLA', N'ESTAMPILLADO', N'', 3, N'ESTAMPILLA', 9, 1, 0, N'', CAST(N'2018-11-07T14:06:40.0000000' AS DateTime2), N'', CAST(N'2018-11-07T14:06:40.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_wms_orden] ([id_tipo_orden_wms], [codigo], [nombre], [descripcion], [id_tipo_wms_integracion], [codigo_wms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (10, N'ETIQUETADO', N'ETIQUETADO', N'', 3, N'ETIQUETADO', 10, 1, 0, N'', CAST(N'2018-11-07T14:06:40.0000000' AS DateTime2), N'', CAST(N'2018-11-07T14:06:40.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_wms_orden] ([id_tipo_orden_wms], [codigo], [nombre], [descripcion], [id_tipo_wms_integracion], [codigo_wms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (11, N'MAQRECUP', N'RECUPERACIÓN', N'', 3, N'MAQRECUP', 11, 1, 0, N'', CAST(N'2018-11-07T14:06:40.0000000' AS DateTime2), N'', CAST(N'2018-11-07T14:06:40.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_wms_orden] ([id_tipo_orden_wms], [codigo], [nombre], [descripcion], [id_tipo_wms_integracion], [codigo_wms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (12, N'OFERTAS', N'ENSAMBLE DE OFERTAS', N'', 3, N'OFERTAS', 12, 1, 0, N'', CAST(N'2018-11-07T14:06:40.0000000' AS DateTime2), N'', CAST(N'2018-11-07T14:06:40.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_wms_orden] ([id_tipo_orden_wms], [codigo], [nombre], [descripcion], [id_tipo_wms_integracion], [codigo_wms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (13, N'RECCAJA', N'RECUPERACIÓN POR CAJA', N'', 3, N'RECCAJA', 13, 1, 0, N'', CAST(N'2018-11-07T14:06:40.0000000' AS DateTime2), N'', CAST(N'2018-11-07T14:06:40.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_wms_orden] ([id_tipo_orden_wms], [codigo], [nombre], [descripcion], [id_tipo_wms_integracion], [codigo_wms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (14, N'RECCOMP', N'RECUPERACIÓN COMPOTAS', N'', 3, N'RECCOMP', 14, 1, 0, N'', CAST(N'2018-11-07T14:06:40.0000000' AS DateTime2), N'', CAST(N'2018-11-07T14:06:40.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_wms_orden] ([id_tipo_orden_wms], [codigo], [nombre], [descripcion], [id_tipo_wms_integracion], [codigo_wms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (15, N'RECINKJE', N'RECUPERACIÓN INK-JET', N'', 3, N'RECINKJE', 15, 1, 0, N'', CAST(N'2018-11-07T14:06:40.0000000' AS DateTime2), N'', CAST(N'2018-11-07T14:06:40.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_wms_orden] ([id_tipo_orden_wms], [codigo], [nombre], [descripcion], [id_tipo_wms_integracion], [codigo_wms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (16, N'RECTERMO', N'RECUPERACIÓN TERMO ENCOGIDO', N'', 3, N'RECTERMO', 16, 1, 0, N'', CAST(N'2018-11-07T14:06:40.0000000' AS DateTime2), N'', CAST(N'2018-11-07T14:06:40.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_solicitud] ([id_tipo_solicitud], [codigo], [nombre], [descripcion], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (1, N'SALIDA', N'SALIDA', N'', 1, 1, 0, N'', CAST(N'2018-11-07T00:00:00.0000000' AS DateTime2), N'', CAST(N'2018-11-07T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_solicitud] ([id_tipo_solicitud], [codigo], [nombre], [descripcion], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (2, N'ENTRADA', N'ENTRADA', N'', 2, 1, 0, N'', CAST(N'2018-11-07T00:00:00.0000000' AS DateTime2), N'', CAST(N'2018-11-07T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_solicitud] ([id_tipo_solicitud], [codigo], [nombre], [descripcion], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (3, N'TRASLADO', N'TRASLADO', N'', 3, 1, 0, N'', CAST(N'2018-11-07T00:00:00.0000000' AS DateTime2), N'', CAST(N'2018-11-07T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_solicitud] ([id_tipo_solicitud], [codigo], [nombre], [descripcion], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (4, N'MANUFACTURA', N'MANUFACTURA', N'', 4, 1, 0, N'', CAST(N'2018-11-07T00:00:00.0000000' AS DateTime2), N'', CAST(N'2018-11-07T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[servicios] ([id_servicio], [codigo], [nombre], [descripcion], [id_tipo_solicitud], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (1, N'DESTRUCCION', N'DESTRUCCION', N'', 1, 1, 0, 0, N'', CAST(N'2017-04-16T00:00:00.0000000' AS DateTime2), N'', CAST(N'2017-04-16T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[servicios] ([id_servicio], [codigo], [nombre], [descripcion], [id_tipo_solicitud], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (2, N'XD', N'CROSS DOCKING', N'', 1, 2, 0, 0, N'esbTacticConect', CAST(N'2016-03-16T14:05:45.0000000' AS DateTime2), N'esbTacticConect', CAST(N'2016-03-16T14:05:45.0000000' AS DateTime2))
GO
INSERT [dbo].[servicios] ([id_servicio], [codigo], [nombre], [descripcion], [id_tipo_solicitud], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (3, N'SALIDA', N'SALIDA', N'', 1, 3, 1, 0, N'esbTacticConect', CAST(N'2016-03-16T14:05:45.0000000' AS DateTime2), N'esbTacticConect', CAST(N'2016-03-16T14:05:45.0000000' AS DateTime2))
GO
INSERT [dbo].[servicios] ([id_servicio], [codigo], [nombre], [descripcion], [id_tipo_solicitud], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (4, N'COMPRA', N'COMPRA', N'', 2, 4, 1, 0, N'esbTacticConect', CAST(N'2016-03-16T14:05:45.0000000' AS DateTime2), N'esbTacticConect', CAST(N'2016-03-16T14:05:45.0000000' AS DateTime2))
GO
INSERT [dbo].[servicios] ([id_servicio], [codigo], [nombre], [descripcion], [id_tipo_solicitud], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (5, N'DEVOLUCION', N'LOGISTICA INVERSA', N'', 2, 5, 1, 0, N'esbTacticConect', CAST(N'2016-03-16T14:05:45.0000000' AS DateTime2), N'esbTacticConect', CAST(N'2016-03-16T14:05:45.0000000' AS DateTime2))
GO
INSERT [dbo].[servicios] ([id_servicio], [codigo], [nombre], [descripcion], [id_tipo_solicitud], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (6, N'TRASLADO', N'TRASLADO', N'', 3, 6, 1, 0, N'esbTacticConect', CAST(N'2016-03-16T14:05:45.0000000' AS DateTime2), N'esbTacticConect', CAST(N'2016-03-16T14:05:45.0000000' AS DateTime2))
GO
INSERT [dbo].[servicios] ([id_servicio], [codigo], [nombre], [descripcion], [id_tipo_solicitud], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (10, N'OFERTAS', N'ENSAMBLE DE OFERTAS', N'', 4, 21, 1, 0, N'', CAST(N'2017-05-08T00:00:00.0000000' AS DateTime2), N'', CAST(N'2017-05-08T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[servicios] ([id_servicio], [codigo], [nombre], [descripcion], [id_tipo_solicitud], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (11, N'DSENSAMBLE', N'DESENSAMBLE DE OFERTAS', N'', 4, 22, 1, 0, N'', CAST(N'2017-06-15T00:00:00.0000000' AS DateTime2), N'', CAST(N'2017-06-15T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[servicios] ([id_servicio], [codigo], [nombre], [descripcion], [id_tipo_solicitud], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (12, N'ESTAMPILLA', N'ESTAMPILLADO', N'', 4, 20, 1, 0, N'', CAST(N'2017-05-08T00:00:00.0000000' AS DateTime2), N'', CAST(N'2017-05-08T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[servicios] ([id_servicio], [codigo], [nombre], [descripcion], [id_tipo_solicitud], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (13, N'DSESTAMPILLA', N'DSESTAMPILLA', N'', 4, 24, 1, 0, N'', CAST(N'2018-02-24T00:00:00.0000000' AS DateTime2), N'', CAST(N'2018-02-24T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[servicios] ([id_servicio], [codigo], [nombre], [descripcion], [id_tipo_solicitud], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (14, N'ETIQUETADO', N'ETIQUETADO', N'', 4, 23, 1, 0, N'', CAST(N'0207-06-15T00:00:00.0000000' AS DateTime2), N'', CAST(N'0207-06-15T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[servicios] ([id_servicio], [codigo], [nombre], [descripcion], [id_tipo_solicitud], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (20, N'MAQRECUP', N'MAQRECUP', N'', 4, 30, 1, 0, N'', CAST(N'2018-11-07T00:00:00.0000000' AS DateTime2), N'', CAST(N'2018-11-07T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[servicios] ([id_servicio], [codigo], [nombre], [descripcion], [id_tipo_solicitud], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (21, N'RECCAJA', N'RECCAJA', N'', 4, 31, 1, 0, N'', CAST(N'2018-11-07T19:00:06.0000000' AS DateTime2), N'', CAST(N'2018-11-07T19:00:06.0000000' AS DateTime2))
GO
INSERT [dbo].[servicios] ([id_servicio], [codigo], [nombre], [descripcion], [id_tipo_solicitud], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (22, N'RECCOMP', N'RECCOMP', N'', 4, 32, 1, 0, N'', CAST(N'2018-11-07T19:00:17.0000000' AS DateTime2), N'', CAST(N'2018-11-07T19:00:17.0000000' AS DateTime2))
GO
INSERT [dbo].[servicios] ([id_servicio], [codigo], [nombre], [descripcion], [id_tipo_solicitud], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (23, N'RECINKJE', N'RECINKJE', N'', 4, 33, 1, 0, N'', CAST(N'2018-11-07T19:01:15.0000000' AS DateTime2), N'', CAST(N'2018-11-07T19:01:15.0000000' AS DateTime2))
GO
INSERT [dbo].[servicios] ([id_servicio], [codigo], [nombre], [descripcion], [id_tipo_solicitud], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (24, N'RECTERMO', N'RECTERMO', N'', 4, 34, 1, 0, N'', CAST(N'2018-11-07T19:01:24.0000000' AS DateTime2), N'', CAST(N'2018-11-07T19:01:24.0000000' AS DateTime2))
GO
INSERT [dbo].[servicios_tipos_wms_orden] ([id_servicio], [id_tipo_orden_wms], [generacion_automatica]) VALUES (1, 1, 1)
GO
INSERT [dbo].[servicios_tipos_wms_orden] ([id_servicio], [id_tipo_orden_wms], [generacion_automatica]) VALUES (2, 2, 1)
GO
INSERT [dbo].[servicios_tipos_wms_orden] ([id_servicio], [id_tipo_orden_wms], [generacion_automatica]) VALUES (2, 5, 0)
GO
INSERT [dbo].[servicios_tipos_wms_orden] ([id_servicio], [id_tipo_orden_wms], [generacion_automatica]) VALUES (3, 1, 1)
GO
INSERT [dbo].[servicios_tipos_wms_orden] ([id_servicio], [id_tipo_orden_wms], [generacion_automatica]) VALUES (3, 5, 0)
GO
INSERT [dbo].[servicios_tipos_wms_orden] ([id_servicio], [id_tipo_orden_wms], [generacion_automatica]) VALUES (4, 3, 1)
GO
INSERT [dbo].[servicios_tipos_wms_orden] ([id_servicio], [id_tipo_orden_wms], [generacion_automatica]) VALUES (5, 4, 1)
GO
INSERT [dbo].[servicios_tipos_wms_orden] ([id_servicio], [id_tipo_orden_wms], [generacion_automatica]) VALUES (6, 6, 1)
GO
INSERT [dbo].[servicios_tipos_wms_orden] ([id_servicio], [id_tipo_orden_wms], [generacion_automatica]) VALUES (6, 7, 0)
GO
INSERT [dbo].[servicios_tipos_wms_orden] ([id_servicio], [id_tipo_orden_wms], [generacion_automatica]) VALUES (10, 12, 1)
GO
INSERT [dbo].[servicios_tipos_wms_orden] ([id_servicio], [id_tipo_orden_wms], [generacion_automatica]) VALUES (11, 8, 1)
GO
INSERT [dbo].[servicios_tipos_wms_orden] ([id_servicio], [id_tipo_orden_wms], [generacion_automatica]) VALUES (12, 9, 1)
GO
INSERT [dbo].[servicios_tipos_wms_orden] ([id_servicio], [id_tipo_orden_wms], [generacion_automatica]) VALUES (14, 10, 1)
GO
INSERT [dbo].[servicios_tipos_wms_orden] ([id_servicio], [id_tipo_orden_wms], [generacion_automatica]) VALUES (20, 11, 1)
GO
INSERT [dbo].[servicios_tipos_wms_orden] ([id_servicio], [id_tipo_orden_wms], [generacion_automatica]) VALUES (21, 13, 1)
GO
INSERT [dbo].[servicios_tipos_wms_orden] ([id_servicio], [id_tipo_orden_wms], [generacion_automatica]) VALUES (22, 14, 1)
GO
INSERT [dbo].[servicios_tipos_wms_orden] ([id_servicio], [id_tipo_orden_wms], [generacion_automatica]) VALUES (23, 15, 1)
GO
INSERT [dbo].[servicios_tipos_wms_orden] ([id_servicio], [id_tipo_orden_wms], [generacion_automatica]) VALUES (24, 16, 1)
GO
INSERT [dbo].[clientes_servicios] ([id_cliente], [id_servicio]) VALUES (17, 3)
GO
INSERT [dbo].[clientes_servicios] ([id_cliente], [id_servicio]) VALUES (18, 3)
GO
INSERT [dbo].[clientes_servicios] ([id_cliente], [id_servicio]) VALUES (18, 5)
GO
INSERT [dbo].[clientes_servicios] ([id_cliente], [id_servicio]) VALUES (18, 6)
GO
INSERT [dbo].[clientes_servicios] ([id_cliente], [id_servicio]) VALUES (37, 3)
GO
INSERT [dbo].[centros_costo] ([id_centro_costo], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (1, N'32', N'IBAGUE
', N'', N'32
', 32, 1, 1, N'', CAST(N'2019-03-14T00:00:00.0000000' AS DateTime2), N'', CAST(N'2019-03-14T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[centros_costo] ([id_centro_costo], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (10, N'76', N'VALLEDUPAR INGREDION', N'', N'76', 76, 1, 1, N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2), N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2))
GO
INSERT [dbo].[centros_costo] ([id_centro_costo], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (18, N'77', N'NEIVA INGREDION', N'', N'77', 77, 1, 1, N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2), N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2))
GO
INSERT [dbo].[centros_costo] ([id_centro_costo], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (32, N'78', N'TENJO INGREDION', N'', N'78', 78, 1, 1, N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2), N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2))
GO
INSERT [dbo].[centros_costo] ([id_centro_costo], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (33, N'79', N'MONTERIA INGREDION', N'', N'79', 79, 1, 1, N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2), N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2))
GO
INSERT [dbo].[centros_costo] ([id_centro_costo], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (36, N'71', N'INGREDION', N'', N'71', 71, 1, 1, N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2), N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2))
GO
INSERT [dbo].[centros_costo] ([id_centro_costo], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (37, N'80', N'TUNJA INGREDION', N'', N'80', 80, 1, 1, N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2), N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2))
GO
INSERT [dbo].[centros_costo] ([id_centro_costo], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (38, N'81', N'BARRANQUILLA INGREDION', N'', N'81', 81, 1, 1, N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2), N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2))
GO
INSERT [dbo].[centros_costo] ([id_centro_costo], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (39, N'82', N'CARTAGENA INGREDION', N'', N'82', 82, 1, 1, N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2), N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2))
GO
INSERT [dbo].[centros_costo] ([id_centro_costo], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (40, N'83', N'SANTA MARTA INGREDION', N'', N'83', 83, 1, 1, N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2), N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2))
GO
INSERT [dbo].[centros_costo] ([id_centro_costo], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (41, N'84', N'SINCELEJO INGREDION', N'', N'84', 84, 1, 1, N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2), N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2))
GO
INSERT [dbo].[centros_costo] ([id_centro_costo], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (42, N'85', N'RIOHACHA INGREDION', N'', N'85', 85, 1, 1, N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2), N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2))
GO
INSERT [dbo].[centros_costo] ([id_centro_costo], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (43, N'86', N'LA ESTRELLA INGREDION', N'', N'86', 86, 1, 1, N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2), N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2))
GO
INSERT [dbo].[centros_costo] ([id_centro_costo], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (44, N'87', N'DOSQUEBRADAS INGREDION', N'', N'87', 87, 1, 1, N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2), N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2))
GO
INSERT [dbo].[centros_costo] ([id_centro_costo], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (45, N'88', N'BUCARAMANGAINGREDION', N'', N'88', 88, 1, 1, N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2), N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2))
GO
INSERT [dbo].[centros_costo] ([id_centro_costo], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (46, N'89', N'CUCUTA INGREDION', N'', N'89', 89, 1, 1, N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2), N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2))
GO
INSERT [dbo].[centros_costo] ([id_centro_costo], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (47, N'90', N'IBAGUE INGREDION', N'', N'90', 90, 1, 1, N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2), N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2))
GO
INSERT [dbo].[centros_costo] ([id_centro_costo], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (48, N'91', N'YUMBO INGREDION', N'', N'91', 91, 1, 1, N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2), N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2))
GO
INSERT [dbo].[centros_costo] ([id_centro_costo], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (49, N'92', N'BUENAVENTURA INGREDION', N'', N'92', 92, 1, 1, N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2), N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2))
GO
INSERT [dbo].[centros_costo] ([id_centro_costo], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (50, N'93', N'PASTO INGREDION', N'', N'93', 93, 1, 1, N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2), N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2))
GO
INSERT [dbo].[centros_costo] ([id_centro_costo], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (51, N'94', N'VILLAVICENCIO INGREDION', N'', N'94', 94, 1, 1, N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2), N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2))
GO
INSERT [dbo].[centros_costo] ([id_centro_costo], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (52, N'95', N'FLORENCIA INGREDION', N'', N'95', 95, 1, 1, N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2), N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2))
GO
INSERT [dbo].[centros_costo] ([id_centro_costo], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (53, N'96', N'SAN JOSE DEL GUAVIARE INGREDION', N'', N'96', 96, 1, 1, N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2), N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2))
GO
INSERT [dbo].[centros_costo] ([id_centro_costo], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (54, N'97', N'SABANAGRANDE INGREDION', N'', N'97', 97, 1, 1, N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2), N'', CAST(N'2019-03-15T15:50:28.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_documento] ([id_tipo_documento], [codigo], [nombre], [descripcion], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (1, N'OCCF', N'ORDEN DE COMPRA CLIENTE FINAL', N'', 1, 1, 0, N'', CAST(N'2018-11-07T00:00:00.0000000' AS DateTime2), N'', CAST(N'2018-11-07T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_naturaleza_producto] ([id_tipo_naturaleza_producto], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (1, N'1', N'NORMAL', N'', N'NORMAL', 1, 1, 0, N'', CAST(N'2019-03-14T00:00:00.0000000' AS DateTime2), N'', CAST(N'2019-03-14T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_naturaleza_producto] ([id_tipo_naturaleza_producto], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (2, N'2', N'PELIGROSA', N'', N'PELIGROSA', 2, 1, 0, N'', CAST(N'2019-03-15T16:30:46.0000000' AS DateTime2), N'', CAST(N'2019-03-15T16:30:46.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_naturaleza_producto] ([id_tipo_naturaleza_producto], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (3, N'3', N'EXTRA DIMENSIONADA', N'', N'EXTRA DIMENSIONADA', 3, 1, 0, N'', CAST(N'2019-03-15T16:30:46.0000000' AS DateTime2), N'', CAST(N'2019-03-15T16:30:46.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_naturaleza_producto] ([id_tipo_naturaleza_producto], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (4, N'4', N'EXTRA PESADA', N'', N'EXTRA PESADA', 4, 1, 0, N'', CAST(N'2019-03-15T16:30:46.0000000' AS DateTime2), N'', CAST(N'2019-03-15T16:30:46.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_naturaleza_producto] ([id_tipo_naturaleza_producto], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (5, N'5', N'DESECHOS PELIGROSOS', N'', N'DESECHOS PELIGROSOS', 5, 1, 0, N'', CAST(N'2019-03-15T16:30:46.0000000' AS DateTime2), N'', CAST(N'2019-03-15T16:30:46.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_producto] ([id_tipo_producto], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (1, N'1', N'PRODUCTOS ALIMENTICIOS', N'', N'PRODUCTOS ALIMENTICIOS', 1, 1, 0, N'', CAST(N'2019-03-14T00:00:00.0000000' AS DateTime2), N'', CAST(N'2019-03-04T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_producto] ([id_tipo_producto], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (2, N'2', N'QUIMICOS', N'', N'QUIMICOS', 2, 1, 0, N'', CAST(N'2019-03-15T16:36:46.0000000' AS DateTime2), N'', CAST(N'2019-03-15T16:36:46.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_producto] ([id_tipo_producto], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (3, N'6', N'MERCANCIAS VARIAS', N'', N'MERCANCIAS VARIAS', 6, 1, 0, N'', CAST(N'2019-03-15T16:36:46.0000000' AS DateTime2), N'', CAST(N'2019-03-15T16:36:46.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_producto] ([id_tipo_producto], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (4, N'7', N'COMUNICACIONES', N'', N'COMUNICACIONES', 7, 1, 0, N'', CAST(N'2019-03-15T16:36:46.0000000' AS DateTime2), N'', CAST(N'2019-03-15T16:36:46.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_producto] ([id_tipo_producto], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (5, N'4', N'SEGURIDAD', N'', N'SEGURIDAD', 4, 1, 0, N'', CAST(N'2019-03-15T16:36:46.0000000' AS DateTime2), N'', CAST(N'2019-03-15T16:36:46.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_producto] ([id_tipo_producto], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (6, N'5', N'VEHICULOS', N'', N'VEHICULOS', 5, 1, 0, N'', CAST(N'2019-03-15T16:36:46.0000000' AS DateTime2), N'', CAST(N'2019-03-15T16:36:46.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_producto] ([id_tipo_producto], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (7, N'3', N'VALE', N'', N'VALE', 3, 1, 0, N'', CAST(N'2019-03-15T16:36:46.0000000' AS DateTime2), N'', CAST(N'2019-03-15T16:36:46.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_producto] ([id_tipo_producto], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (8, N'8', N'CONTENEDORES', N'', N'CONTENEDORES', 8, 1, 0, N'', CAST(N'2019-03-15T16:36:46.0000000' AS DateTime2), N'', CAST(N'2019-03-15T16:36:46.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_producto] ([id_tipo_producto], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (16, N'16', N'TARJETAS MAS EFECTIVAS', N'', N'TARJETAS MAS EFECTIVAS', 16, 1, 0, N'', CAST(N'2019-03-15T16:36:46.0000000' AS DateTime2), N'', CAST(N'2019-03-15T16:36:46.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_producto] ([id_tipo_producto], [codigo], [nombre], [descripcion], [codigo_alterno_tms], [ordinal], [activo], [version], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_modificacion]) VALUES (17, N'17', N'COMERCIALIZADORA', N'', N'COMERCIALIZADORA', 17, 1, 0, N'', CAST(N'2019-03-15T16:36:46.0000000' AS DateTime2), N'', CAST(N'2019-03-15T16:36:46.0000000' AS DateTime2))
GO
