CREATE TABLE [dbo].[ordenes_atributos] (
    [id]                   BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_orden]             BIGINT        NOT NULL,
    [numero_linea]         INT           NOT NULL,
    [id_tipo_atributo]     VARCHAR (50)  NOT NULL,
    [valor]                VARCHAR (50)  NOT NULL,
    [version]              INT           NOT NULL,
    [usuario_creacion]     VARCHAR (50)  NOT NULL,
    [fecha_creacion]       DATETIME2 (0) NOT NULL,
    [usuario_modificacion] VARCHAR (50)  NOT NULL,
    [fecha_modificacion]   DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_ordenes_atributos] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_ordenes_atributos_ordenes] FOREIGN KEY ([id_orden]) REFERENCES [dbo].[ordenes] ([id_orden])
);

