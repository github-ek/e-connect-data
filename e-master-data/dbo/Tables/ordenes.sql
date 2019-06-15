﻿CREATE TABLE [dbo].[ordenes] (
    [id_solicitud]                               BIGINT           NOT NULL,
    [estado_integracion]                         VARCHAR (50)     NOT NULL,
    [id_orden]                                   INT              NOT NULL,
    [numero_documento_orden_cliente]             VARCHAR (30)     NOT NULL,
    [numero_orden_compra]                        VARCHAR (30)     NOT NULL,
    [id_estado_orden]                            VARCHAR (20)     NOT NULL,
    [id_estado_distribucion]                     VARCHAR (50)     NOT NULL,
    [id_cliente]                                 INT              NOT NULL,
    [id_tipo_servicio]                           INT              NOT NULL,
    [tipo_servicio_codigo_alterno]               VARCHAR (20)     NOT NULL,
    [requiere_servicio_distribucion]             BIT              NOT NULL,
    [requiere_confirmacion_cita]                 BIT              NOT NULL,
    [fecha_entrega_sugerida_minima]              DATE             NOT NULL,
    [fecha_entrega_sugerida_maxima]              DATE             NOT NULL,
    [hora_entrega_sugerida_minima]               TIME (0)         NULL,
    [hora_entrega_sugerida_maxima]               TIME (0)         NULL,
    [id_bodega_destino]                          INT              NULL,
    [bodega_destino_codigo_alterno]              VARCHAR (20)     NULL,
    [id_segmento]                                INT              NULL,
    [segmento_codigo_alterno]                    VARCHAR (20)     NULL,
    [id_destinatario_remitente_destinatario]     INT              NULL,
    [destinatario_numero_identificacion_alterno] VARCHAR (20)     NOT NULL,
    [destinatario_nombre_alterno]                VARCHAR (100)    NOT NULL,
    [id_destino_origen_destino]                  INT              NULL,
    [destino_nombre_alterno]                     VARCHAR (100)    NOT NULL,
    [destino_contacto_email]                     VARCHAR (100)    NOT NULL,
    [destino_contacto_nombres]                   VARCHAR (100)    NOT NULL,
    [destino_contacto_telefonos]                 VARCHAR (50)     NOT NULL,
    [id_ciudad_destino]                          INT              NOT NULL,
    [destino_ciudad_nombre_alterno]              VARCHAR (100)    NOT NULL,
    [destino_direccion]                          VARCHAR (150)    NOT NULL,
    [valor_declarado]                            INT              NULL,
    [notas]                                      VARCHAR (200)    NOT NULL,
    [fecha_confirmacion]                         DATETIME2 (0)    NOT NULL,
    [usuario_confirmacion]                       VARCHAR (50)     NOT NULL,
    [fecha_aceptacion]                           DATETIME2 (0)    NOT NULL,
    [usuario_aceptacion]                         VARCHAR (50)     NOT NULL,
    [orden_recibo_wms_generada]                  BIT              NOT NULL,
    [orden_recibo_wms_confirmada]                BIT              NOT NULL,
    [INVNUM]                                     VARCHAR (35)     NULL,
    [INV_WH_ID]                                  VARCHAR (32)     NULL,
    [INV_DTE]                                    DATETIME         NULL,
    [INV_USR_ID]                                 VARCHAR (40)     NULL,
    [orden_salida_wms_generada]                  BIT              NOT NULL,
    [orden_salida_wms_confirmada]                BIT              NOT NULL,
    [ORDNUM]                                     VARCHAR (35)     NOT NULL,
    [ORD_WH_ID]                                  VARCHAR (32)     NOT NULL,
    [ORD_DTE]                                    DATETIME         NOT NULL,
    [ORD_USR_ID]                                 VARCHAR (40)     NOT NULL,
    [id_estado_georeferenciacion]                VARCHAR (50)     NOT NULL,
    [id_tipo_georeferenciacion]                  INT              NULL,
    [destino_direccion_estandarizada]            VARCHAR (150)    NULL,
    [destino_longitud]                           NUMERIC (18, 15) NULL,
    [destino_latitud]                            NUMERIC (18, 15) NULL,
    [zona_nombre]                                VARCHAR (100)    NULL,
    [localidad_nombre]                           VARCHAR (100)    NULL,
    [barrio_nombre]                              VARCHAR (100)    NULL,
    [fecha_georeferenciacion]                    DATETIME2 (0)    NULL,
    [fecha_georeferenciacion_manual]             DATETIME2 (0)    NULL,
    [usuario_georeferenciacion_manual]           VARCHAR (50)     NULL,
    [fecha_creacion]                             DATETIME2 (0)    NOT NULL,
    [usuario_creacion]                           VARCHAR (50)     NOT NULL,
    [fecha_actualizacion]                        DATETIME2 (0)    NOT NULL,
    [usuario_actualizacion]                      VARCHAR (50)     NOT NULL,
    CONSTRAINT [PK_ordenes] PRIMARY KEY CLUSTERED ([id_solicitud] ASC) WITH (FILLFACTOR = 80)
);
