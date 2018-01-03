CREATE TABLE [dbo].[ordenes_manufactura_wkohdr] (
    [id]                   BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_orden_manufactura] BIGINT        NOT NULL,
    [numero_linea]         INT           NOT NULL,
    [wkonum]               NVARCHAR (20) NOT NULL,
    [wkorev]               NVARCHAR (10) NOT NULL,
    [prtnum]               NVARCHAR (50) NULL,
    [invsts]               NVARCHAR (4)  NOT NULL,
    [wkoqty]               INT           NOT NULL,
    [lotnum]               NVARCHAR (25) NULL,
    [version]              INT           NOT NULL,
    [fecha_creacion]       DATETIME2 (0) NOT NULL,
    [usuario_creacion]     VARCHAR (50)  NOT NULL,
    [fecha_modificacion]   DATETIME2 (0) NOT NULL,
    [usuario_modificacion] VARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_ordenes_manufactura_wkohdr] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80)
);

