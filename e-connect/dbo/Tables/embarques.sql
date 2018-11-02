CREATE TABLE [dbo].[embarques]
(
    [id_embarque]                       BIGINT NOT NULL,
    [numero_embarque]                   VARCHAR (30)  NOT NULL,
    [estado]                            VARCHAR(50)   NOT NULL,
    
    [id_bodega]                         BIGINT        NOT NULL,
    [id_tipo_vehiculo]                  BIGINT        NULL,
    [tipo_vehiculo_codigo_alterno]      VARCHAR(50)   NOT NULL,
    [numero_remolque]                   VARCHAR (20)  NOT NULL,
    [placa]                             VARCHAR(20)   NOT NULL,
    [conductor_numero_identificacion]   VARCHAR(20)   NOT NULL,
    [conductor_nombre]                  VARCHAR(100)   NOT NULL,

    [fecha_arribo]                      DATETIME2 (0) NOT NULL,
    [fecha_cierre]                      DATETIME2 (0) NOT NULL,
    [fecha_despacho]                    DATETIME2 (0) NOT NULL,


    [version]                           INT           NOT NULL DEFAULT 0,
    [usuario_creacion]                  VARCHAR (50)  NOT NULL,
    [fecha_creacion]                    DATETIME2 (0) NOT NULL,
    [usuario_modificacion]              VARCHAR (50)  NOT NULL,
    [fecha_modificacion]                DATETIME2 (0) NOT NULL, 
    CONSTRAINT [PK_embarques] PRIMARY KEY CLUSTERED ([id_embarque] ASC) WITH (FILLFACTOR = 80),

    CONSTRAINT [FK_embarques_bodegas] FOREIGN KEY ([id_bodega]) REFERENCES [dbo].[bodegas] ([id_bodega]),
    CONSTRAINT [FK_embarques_tipos_vehiculo] FOREIGN KEY ([id_tipo_vehiculo]) REFERENCES [dbo].[tipos_vehiculo] ([id_tipo_vehiculo]),
)