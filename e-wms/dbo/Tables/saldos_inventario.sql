CREATE TABLE [dbo].[saldos_inventario] (
    [id]             BIGINT         IDENTITY (1, 1) NOT NULL,
    [fecha_creacion] DATETIME       NOT NULL,
    [fecha_corte]    DATE           NOT NULL,
    [prt_client_id]  NVARCHAR (32)  NOT NULL,
    [wh_id]          NVARCHAR (32)  NOT NULL,
    [prtnum]         NVARCHAR (50)  NOT NULL,
    [invsts]         NVARCHAR (4)   NOT NULL,
    [lotnum]         NVARCHAR (25)  NOT NULL,
    [untqty]         INT            NOT NULL,
    [lst_arecod]     NVARCHAR (10)  NOT NULL,
    [expire_dte]     DATETIME       NULL,
    [inv_attr_str7]  NVARCHAR (100) NOT NULL,
    [stoloc]         NVARCHAR (20)  NOT NULL,
    [lodnum]         NVARCHAR (30)  NOT NULL,
    [orgcod] NVARCHAR(25) NOT NULL, 
    CONSTRAINT [PK_saldos_inventario] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_saldos_inventario_01]
    ON [dbo].[saldos_inventario]([fecha_corte] ASC, [prt_client_id] ASC, [wh_id] ASC);

