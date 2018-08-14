﻿CREATE TABLE [dbo].[salidas] (
    [id]                               BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_archivo]                       BIGINT        NOT NULL,
    [estado]                           VARCHAR (50)  NOT NULL,
    [numero_linea]                     INT           NOT NULL,
    [cliente_codigo]                   VARCHAR (20)  NOT NULL,
    [servicio_codigo_alterno]          VARCHAR (50)  NOT NULL,
    [numero_solicitud]                 VARCHAR (20)  NOT NULL,
    [prefijo]                          VARCHAR (20)  NOT NULL,
    [numero_solicitud_sin_prefijo]     VARCHAR (20)  NOT NULL,
    [femi]                             DATE          NULL,
    [fema]                             DATE          NULL,
    [nota]                             VARCHAR (200) NOT NULL,
    [producto_codigo_alterno]          VARCHAR (50)  NOT NULL,
    [producto_nombre]                  VARCHAR (200) NOT NULL,
    [cantidad]                         INT           NOT NULL,
    [unidad_medida_codigo_alterno]     VARCHAR (50)  NOT NULL,
    [bodega_codigo_alterno]            VARCHAR (50)  NOT NULL,
    [estado_inventario_codigo_alterno] VARCHAR (50)  NOT NULL,
    [lote]                             VARCHAR (30)  NOT NULL,
    [valor_unitario_declarado]         INT           NULL,
    [requiere_agendamiento]            VARCHAR (1)   NOT NULL,
    [homi]                             TIME (0)      NULL,
    [homa]                             TIME (0)      NULL,
    [tercero_identificacion]           VARCHAR (20)  NOT NULL,
    [tercero_nombre]                   VARCHAR (100) NOT NULL,
    [canal_codigo_alterno]             VARCHAR (50)  NOT NULL,
    [requiere_transporte]              VARCHAR (1)   NOT NULL,
    [ciudad_codigo_alterno]            VARCHAR (50)  NOT NULL,
    [direccion]                        VARCHAR (150) NOT NULL,
    [punto_codigo_alterno]             VARCHAR (50)  NOT NULL,
    [punto_nombre]                     VARCHAR (100) NOT NULL,
    [contacto_nombres]                 VARCHAR (100) NOT NULL,
    [contacto_telefonos]               VARCHAR (50)  NOT NULL,
    [contacto_email]                   VARCHAR (100) NOT NULL,
    [documento_cliente]                VARCHAR (20)  NOT NULL,
    [fecha_documento_cliente]          DATE          NULL,
    [predistribucion_crossdock]        VARCHAR (200) NOT NULL,
    [autorizado_identificacion]        VARCHAR (20)  NOT NULL,
    [autorizado_nombres]               VARCHAR (100) NOT NULL,
    [requiere_recaudo]                 VARCHAR (1)   NOT NULL,
    [valor_recaudar]                   INT           NULL,
    [id_cliente]                       BIGINT        NULL,
    [id_servicio]                      BIGINT        NULL,
    [id_producto]                      BIGINT        NULL,
    [id_unidad_medida]                 BIGINT        NULL,
    [id_bodega]                        BIGINT        NULL,
    [id_estado_inventario]             VARCHAR (4)   NULL,
    [id_tercero]                       BIGINT        NULL,
    [id_canal]                         BIGINT        NULL,
    [id_ciudad]                        BIGINT        NULL,
    [id_punto]                         BIGINT        NULL,
    [version]                          INT           NOT NULL,
    [fecha_creacion]                   DATETIME2 (0) NOT NULL,
    [usuario_creacion]                 VARCHAR (50)  NOT NULL,
    [fecha_modificacion]               DATETIME2 (0) NOT NULL,
    [usuario_modificacion]             VARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_salidas] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80)
);

