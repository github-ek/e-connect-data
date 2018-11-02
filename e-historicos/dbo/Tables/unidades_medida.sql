CREATE TABLE [dbo].[unidades_medida] (
    [id]                 BIGINT  NOT NULL,
    [operacion]          NVARCHAR (1) NOT NULL,
    [cambio_notificado]  BIT NOT NULL DEFAULT 0,
    [fecha_creacion]     DATETIME       NOT NULL,
    [fecha_modificacion] DATETIME       NOT NULL,

    [uomcod]               NVARCHAR (2)   NOT NULL,
    [lngdsc]              NVARCHAR (100)  NOT NULL,

    CONSTRAINT [PK_unidades_medida] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [UK_unidades_medida_01] UNIQUE NONCLUSTERED ([uomcod])
);

