﻿CREATE TABLE [ordenes].[ordenes] (
    [id_orden]                                    INT              IDENTITY (1, 1) NOT NULL,
    [numero_documento_orden_cliente]              VARCHAR (30)     NOT NULL,
    [id_estado_orden]                             VARCHAR (20)     NOT NULL,
    [id_estado_distribucion]                      VARCHAR (50)     NULL,
    [id_cliente]                                  INT              NOT NULL,
    [id_tipo_servicio]                            INT              NOT NULL,
    [tipo_servicio_codigo_alterno]                VARCHAR (20)     NULL,
    [requiere_servicio_distribucion]              BIT              NULL,
    [requiere_confirmacion_cita]                  BIT              NULL,
    [fecha_entrega_sugerida_minima]               DATE             NULL,
    [fecha_entrega_sugerida_maxima]               DATE             NULL,
    [hora_entrega_sugerida_minima]                TIME (0)         NULL,
    [hora_entrega_sugerida_maxima]                TIME (0)         NULL,
    [id_bodega_destino]                           INT              NULL,
    [bodega_destino_codigo_alterno]               VARCHAR (20)     NULL,
    [id_segmento]                                 INT              NULL,
    [segmento_codigo_alterno]                     VARCHAR (20)     NULL,
    [id_destinatario_remitente_destinatario]      INT              NULL,
    [destinatario_numero_identificacion_alterno]  VARCHAR (20)     NULL,
    [destinatario_nombre_alterno]                 VARCHAR (100)    NULL,
    [id_destino_origen_destino]                   INT              NULL,
    [destino_nombre_alterno]                      VARCHAR (100)    NULL,
    [destino_contacto_email]                      VARCHAR (100)    NULL,
    [destino_contacto_nombres]                    VARCHAR (100)    NULL,
    [destino_contacto_telefonos]                  VARCHAR (50)     NULL,
    [id_ciudad_destino]                           INT              NULL,
    [destino_ciudad_nombre_alterno]               VARCHAR (100)    NULL,
    [destino_direccion]                           VARCHAR (150)    NULL,
    [valor_declarado]                             INT              NULL,
    [notas]                                       VARCHAR (200)    NULL,
    [fecha_confirmacion]                          DATETIME2 (0)    NULL,
    [usuario_confirmacion]                        VARCHAR (50)     NOT NULL,
    [fecha_aceptacion]                            DATETIME2 (0)    NULL,
    [usuario_aceptacion]                          VARCHAR (50)     NOT NULL,
    [orden_recibo_wms_generada]                   BIT              NULL,
    [orden_recibo_wms_confirmada]                 BIT              NULL,
    [orden_salida_wms_generada]                   BIT              NULL,
    [orden_salida_wms_confirmada]                 BIT              NULL,
    [id_estado_georeferenciacion]                 VARCHAR (50)     NULL,
    [id_tipo_georeferenciacion]                   INT              NULL,
    [destino_direccion_estandarizada]             VARCHAR (150)    NULL,
    [destino_longitud]                            NUMERIC (18, 15) NULL,
    [destino_latitud]                             NUMERIC (18, 15) NULL,
    [zona_nombre]                                 VARCHAR (100)    NULL,
    [localidad_nombre]                            VARCHAR (100)    NULL,
    [barrio_nombre]                               VARCHAR (100)    NULL,
    [fecha_georeferenciacion]                     DATETIME2 (0)    NULL,
    [fecha_georeferenciacion_manual]              DATETIME2 (0)    NULL,
    [usuario_georeferenciacion_manual]            VARCHAR (50)     NULL,
    [id_estado_planificacion_ruta]                VARCHAR (50)     NULL,
    [id_corte_planificacion_ruta]                 INT              NULL,
    [fecha_corte_planificacion_ruta]              DATETIME2 (0)    NULL,
    [usuario_corte_planificacion_ruta]            VARCHAR (50)     NULL,
    [id_ruta]                                     INT              NULL,
    [fecha_asignacion_ruta]                       DATETIME2 (0)    NULL,
    [usuario_asignacion_ruta]                     VARCHAR (50)     NULL,
    [secuencia_ruta]                              INT              NULL,
    [fecha_estimada_entrega]                      DATETIME2 (0)    NULL,
    [fecha_entrega]                               DATETIME2 (0)    NULL,
    [fecha_creacion]                              DATETIME2 (0)    NULL,
    [usuario_creacion]                            VARCHAR (50)     NULL,
    [fecha_actualizacion]                         DATETIME2 (0)    NULL,
    [usuario_actualizacion]                       VARCHAR (50)     NOT NULL,
    [id_causal_anulacion_orden]                   INT              NULL,
    [notas_anulacion]                             VARCHAR (200)    NULL,
    [fecha_anulacion]                             DATETIME2 (0)    NULL,
    [usuario_anulacion]                           VARCHAR (50)     NULL,
    [requiere_maquila]                            BIT              NULL,
    [fecha_entrega_maxima_segun_promesa_servicio] DATE             NULL,
    [bodega_destino_nombre_alterno]               VARCHAR (100)    NULL,
    [destinatario_codigo_alterno]                 VARCHAR (20)     NULL,
    [destinatario_contacto_telefonos]             VARCHAR (50)     NOT NULL,
    [destinatario_contacto_email]                 VARCHAR (100)    NOT NULL,
    [destinatario_contacto_nombres]               VARCHAR (100)    NOT NULL,
    [destino_codigo_alterno]                      VARCHAR (20)     NULL,
    [destino_ciudad_codigo_alterno]               VARCHAR (100)    NULL,
    [destino_indicaciones_direccion]              VARCHAR (150)    NULL,
    [fecha_inicio_entrega]                        DATETIME2 (0)    NULL,
    [fecha_fin_entrega]                           DATETIME2 (0)    NULL,
    [id_consolidado]                              INT              NULL,
    [id_tipo_forma_pago]                          INT              NULL,
    [id_estado_orden2]                            VARCHAR (20)     NULL,
    [hora_planeada_entrega_minima_adicional]      TIME (0)         NULL,
    [hora_planeada_entrega_maxima_adicional]      TIME (0)         NULL,
    [requiere_planificacion_ruta]                 BIT              NULL,
    [direccion_sugerida_georeferenciacion_manual] VARCHAR (150)    NULL,
    [id_estado_alistamiento]                      VARCHAR (50)     NULL,
    [fecha_planeada_alistamiento]                 DATE             NULL,
    [id_estado_ejecucion_ruta]                    VARCHAR (50)     NULL,
    [hora_sugerida_entrega_maxima_adicional]      TIME (0)         NULL,
    [hora_sugerida_entrega_minima_adicional]      TIME (0)         NULL,
    [fecha_planeada_entrega_maxima]               DATE             NULL,
    [fecha_planeada_entrega_minima]               DATE             NULL,
    [hora_planeada_entrega_maxima]                TIME (0)         NULL,
    [hora_planeada_entrega_minima]                TIME (0)         NULL,
    [id_tipo_distribucion]                        INT              NULL,
    [valor_flete_por_caja]                        INT              NULL,
    [INVNUM]                                      VARCHAR (35)     NULL,
    [INV_WH_ID]                                   VARCHAR (32)     NULL,
    [INV_DTE]                                     DATETIME         NULL,
    [INV_USR_ID]                                  VARCHAR (40)     NULL,
    [ORDNUM]                                      VARCHAR (35)     NULL,
    [ORD_WH_ID]                                   VARCHAR (32)     NULL,
    [ORD_DTE]                                     DATETIME         NULL,
    [ORD_USR_ID]                                  VARCHAR (40)     NULL,
    CONSTRAINT [PK_ordenes] PRIMARY KEY CLUSTERED ([id_orden] ASC) WITH (FILLFACTOR = 80),
)

