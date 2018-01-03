CREATE TABLE [dbo].[ordenes_recibo_rcvlin] (
    [id]                   BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_orden_recibo]      BIGINT        NOT NULL,
    [numero_linea]         INT           NOT NULL,
    [invlin]               NVARCHAR (10) NOT NULL,
    [invsln]               NVARCHAR (10) NOT NULL,
    [prtnum]               NVARCHAR (50) NULL,
    [expqty]               INT           NOT NULL,
    [rcvsts]               NVARCHAR (4)  NULL,
    [version]              INT           NOT NULL,
    [fecha_creacion]       DATETIME2 (0) NOT NULL,
    [usuario_creacion]     VARCHAR (50)  NOT NULL,
    [fecha_modificacion]   DATETIME2 (0) NOT NULL,
    [usuario_modificacion] VARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_ordenes_recibo_rcvlin] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80)
);

