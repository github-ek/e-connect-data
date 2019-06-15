CREATE TABLE [dbo].[poseedores_vehiculos] (
    [id_poseedor_vehiculo]  BIGINT        IDENTITY (1, 1) NOT NULL,
    [codigo]                VARCHAR (20)  NOT NULL,
    [nombre]                VARCHAR (100) NOT NULL,
    [tipo_identificacion]   VARCHAR (20)  NOT NULL,
    [numero_identificacion] VARCHAR (20)  NOT NULL,
    [descripcion]           VARCHAR (200) NOT NULL,
    [placa_predeterminada]  VARCHAR (20)  NOT NULL,
    [ordinal]               INT           NOT NULL,
    [activo]                BIT           NOT NULL,
    [version]               INT           NOT NULL,
    [usuario_creacion]      VARCHAR (50)  NOT NULL,
    [fecha_creacion]        DATETIME2 (0) NOT NULL,
    [usuario_modificacion]  VARCHAR (50)  NOT NULL,
    [fecha_modificacion]    DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_poseedores_vehiculos] PRIMARY KEY CLUSTERED ([id_poseedor_vehiculo] ASC),
    CONSTRAINT [UK_poseedores_vehiculos_01] UNIQUE NONCLUSTERED ([codigo] ASC),
    CONSTRAINT [UK_poseedores_vehiculos_02] UNIQUE NONCLUSTERED ([numero_identificacion] ASC)
);

