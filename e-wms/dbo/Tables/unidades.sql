CREATE TABLE [dbo].[unidades] (
    [id]                 BIGINT        IDENTITY (1, 1) NOT NULL,
    [operacion]          NVARCHAR (50) NOT NULL,
    [fecha_creacion]     DATETIME      NOT NULL,
    [fecha_modificacion] DATETIME      NOT NULL,
    [id_unidad]          BIGINT        NOT NULL,
    [uomcod]             NVARCHAR (2)  NOT NULL,
    CONSTRAINT [PK_unidades] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [UK_unidades_01] UNIQUE NONCLUSTERED ([uomcod] ASC)
);

