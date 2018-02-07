CREATE TABLE [dbo].[unidades_medida] (
    [id]                 BIGINT         IDENTITY (1, 1) NOT NULL,
    [operacion]          VARCHAR (1)    NOT NULL,
    [fecha_creacion]     DATETIME2 (0)  NOT NULL,
    [fecha_modificacion] DATETIME2 (0)  NOT NULL,
    [id_unidad_medida]   BIGINT         NOT NULL,
    [uomcod]             NVARCHAR (2)   NOT NULL,
    [lngdsc]             NVARCHAR (100) NOT NULL,
    CONSTRAINT [PK_unidades] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [UK_unidades_01] UNIQUE NONCLUSTERED ([uomcod] ASC)
);

