CREATE TABLE [dbo].[unidades_medida] (
    [id]                 BIGINT         IDENTITY (1, 1) NOT NULL,
    [operacion]          NVARCHAR (1)   NOT NULL,
    [cambio_notificado]  BIT            DEFAULT ((0)) NOT NULL,
    [fecha_creacion]     DATETIME       NOT NULL,
    [fecha_modificacion] DATETIME       NOT NULL,
    [uomcod]             NVARCHAR (2)   NOT NULL,
    [lngdsc]             NVARCHAR (100) NOT NULL,
    CONSTRAINT [PK_unidades_medida] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [UK_unidades_medida_01] UNIQUE NONCLUSTERED ([uomcod] ASC) WITH (FILLFACTOR = 80)
);



