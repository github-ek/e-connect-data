CREATE TABLE [dbo].[pedidos_pendientes_lineas] (
    [fecha]          DATE          NOT NULL,
    [prt_client_id]  NVARCHAR (32) NOT NULL,
    [wh_id]          NVARCHAR (32) NOT NULL,
    [ordnum]         NVARCHAR (35) NOT NULL,
    [adddte]         DATETIME      NOT NULL,
    [ordlin]         NVARCHAR (10) NOT NULL,
    [prtnum]         NVARCHAR (50) NOT NULL,
    [invsts]         NVARCHAR (4)  NOT NULL,
    [ordqty]         INT           NOT NULL,
    [fecha_creacion] DATETIME      NOT NULL
);

