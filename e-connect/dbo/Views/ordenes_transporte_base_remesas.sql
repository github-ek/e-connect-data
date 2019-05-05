CREATE VIEW dbo.ordenes_transporte_base_remesas
AS
SELECT        k.id, a.id_orden_transporte, a.estado_orden, '1' AS remesas_centro_costo, d.codigo_alterno_tms AS remesas_tipo_remesa, e.codigo_alterno_tms AS remesas_codigo_cliente, '0' AS remesas_division_cliente, 
                         a.remitente_nombre AS remesas_nombre_remitente, o.codigo_alterno_tms AS remesas_tipo_documento_remitente, a.remitente_identificacion AS remesas_documento_remitente, 
                         a.remitente_direccion AS remesas_direccion_remitente, a.remitente_telefonos AS remesas_telefono_remitente, a.remitente_contacto AS remesas_contacto_remitente, f.id_ciudad, 
                         f.codigo_alterno_tms AS remesas_ciudad_remitente, g.codigo_alterno_tms AS remesas_departamento_remitente, a.destinatario_nombre AS remesas_nombre_destinatario, 
                         o.codigo_alterno_tms AS remesas_tipo_documento_destinatario, a.destinatario_identificacion AS remesas_documento_destinatario, a.destinatario_direccion AS remesas_direccion_destinatario, 
                         a.destinatario_telefonos AS remesas_telefono_destinatario, a.destinatario_contacto AS remesas_contacto_destinatario1, '???' AS remesas_contacto_destinatario2, h.codigo_alterno_tms AS remesas_ciudad_destinatario, 
                         i.codigo_alterno_tms AS remesas_departamento_destinatario, '0' AS remesas_zona_ciudad_destinatario, a.destinatario_cx AS remesas_coordenada_x_longitud, a.destinatario_cy AS remesas_coordenada_y_latitud, 
                         'OBSERVACION REMESA' AS remesas_observacion_remesa, FORMAT(a.fecha_minima_solicitada, 'yyyy-MM-dd') AS remesas_fecha_compromiso_minima, FORMAT(a.fecha_maxima_solicitada, 'yyyy-MM-dd') 
                         AS remesas_fecha_compromiso_maxima, FORMAT(a.hora_minima_solicitada, 'hh\:mm\:ss') AS remesas_hora_compromiso_maxima, FORMAT(a.hora_maxima_solicitada, 'hh\:mm\:ss') AS remesas_hora_compromiso_minima, 
                         a.placa AS remesas_placa_vehiculo, a.secuencia_ruta AS remesas_secuencia_entrega, '???' AS remesas_tipo_remision, a.numero_remesa AS remesas_remision, a.numero_orden_wms AS remesas_documento_wms, 
                         a.numero_orden AS remesas_documento_numero_solicitud, a.id_solicitud AS remesas_id_ordentransporte, '???' AS remesas_punto_codigo_alterno, '???' AS remesas_regional, '???' AS remesas_ciudad_nombre_alterno, 
                         '???' AS remesas_bodega_codigo_alterno, '???' AS remesas_programa, '???' AS remesas_planta, k.id_producto AS remesas_items_id_producto_econnect, k.producto_codigo AS remesas_items_codigo_producto, 
                         k.producto_nombre AS remesas_items_producto_nombre, k.producto_codigo_ministerio AS remesas_items_producto_codigoministerio, l.codigo_alterno_tms AS remesas_items_naturaleza_carga, 
                         m.codigo_alterno_tms AS remesas_items_tipo_producto, n.codigo_alterno_tms AS remesas_items_codigo_empaque, k.unidades AS remesas_items_cantidad, k.factor_conversion AS remesas_items_factor_conversion, 
                         k.unidades_embalaje AS remesas_items_cantidad_embalaje, k.peso_unitario AS remesas_items_peso, k.peso_bruto_unitario AS remesas_items_peso_bruto, k.volumen_unitario AS remesas_items_volumen, 
                         k.valor_declarado_unitario AS remesas_items_valor_declarado, 'DETALLE REMESA' AS remesas_items_descripcion_detalle_remesa, k.predistribucion AS remesas_items_predistribucion, 'ITEMS LOTE' AS remesas_items_lote,
                          'ESTADO INVENTARIO NOMBRE' AS remesas_items_estado_inventario_nombre, GETDATE() + 2 AS remesas_items_fecha_vencimiento
FROM            dbo.ordenes_transporte AS a INNER JOIN
                         dbo.bodegas AS b ON b.id_bodega = a.id_bodega INNER JOIN
                         dbo.centros_costo AS c ON c.id_centro_costo = 1 INNER JOIN
                         dbo.tipos_remesa AS d ON d.id_tipo_remesa = a.id_tipo_remesa INNER JOIN
                         dbo.clientes AS e ON e.id_cliente = a.id_cliente INNER JOIN
                         dbo.ciudades AS f ON f.id_ciudad = a.id_ciudad_remitente INNER JOIN
                         dbo.departamentos AS g ON g.id_departamento = f.id_departamento INNER JOIN
                         dbo.ciudades AS h ON h.id_ciudad = a.id_ciudad_destinatario INNER JOIN
                         dbo.departamentos AS i ON i.id_departamento = h.id_departamento INNER JOIN
                         dbo.tipos_remesa AS j ON j.id_tipo_remesa = a.id_tipo_remesa INNER JOIN
                         dbo.ordenes_transporte_lineas_alistadas AS k ON k.id_orden_transporte = a.id_orden_transporte INNER JOIN
                         dbo.tipos_naturaleza_producto AS l ON l.id_tipo_naturaleza_producto = k.id_tipo_naturaleza_producto INNER JOIN
                         dbo.tipos_producto AS m ON m.id_tipo_producto = k.id_tipo_producto INNER JOIN
                         dbo.unidades_medida AS n ON n.id_unidad_medida = k.id_unidad_medida INNER JOIN
                         dbo.tipos_identificacion AS o ON o.id_tipo_identificacion = a.id_tipo_identificacion_remitente INNER JOIN
                         dbo.tipos_identificacion AS p ON p.id_tipo_identificacion = a.id_tipo_identificacion_destinatario
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'ordenes_transporte_base_remesas';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'
         Begin Table = "h"
            Begin Extent = 
               Top = 930
               Left = 38
               Bottom = 1060
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "i"
            Begin Extent = 
               Top = 1062
               Left = 38
               Bottom = 1192
               Right = 241
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "j"
            Begin Extent = 
               Top = 1194
               Left = 38
               Bottom = 1324
               Right = 241
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "k"
            Begin Extent = 
               Top = 1326
               Left = 38
               Bottom = 1456
               Right = 277
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "l"
            Begin Extent = 
               Top = 1458
               Left = 38
               Bottom = 1588
               Right = 276
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "m"
            Begin Extent = 
               Top = 1590
               Left = 38
               Bottom = 1720
               Right = 241
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "n"
            Begin Extent = 
               Top = 1722
               Left = 38
               Bottom = 1852
               Right = 241
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "o"
            Begin Extent = 
               Top = 1854
               Left = 38
               Bottom = 1984
               Right = 241
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 1986
               Left = 38
               Bottom = 2116
               Right = 241
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'ordenes_transporte_base_remesas';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[30] 4[4] 2[47] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -1536
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 307
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 241
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 400
               Right = 241
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 402
               Left = 38
               Bottom = 532
               Right = 241
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "e"
            Begin Extent = 
               Top = 534
               Left = 38
               Bottom = 664
               Right = 249
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "f"
            Begin Extent = 
               Top = 666
               Left = 38
               Bottom = 796
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "g"
            Begin Extent = 
               Top = 798
               Left = 38
               Bottom = 928
               Right = 241
            End
            DisplayFlags = 280
            TopColumn = 0
         End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'ordenes_transporte_base_remesas';

