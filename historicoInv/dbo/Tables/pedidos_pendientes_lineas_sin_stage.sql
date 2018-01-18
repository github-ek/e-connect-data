CREATE TABLE [dbo].[pedidos_pendientes_lineas_sin_stage] (
    [fecha]          DATE          NULL,
    [prt_client_id]  NVARCHAR (32) NULL,
    [wh_id]          NVARCHAR (32) NOT NULL,
    [ordnum]         NVARCHAR (35) NOT NULL,
    [adddte]         DATETIME      NULL,
    [ordlin]         NVARCHAR (10) NOT NULL,
    [prtnum]         NVARCHAR (50) NULL,
    [invsts]         NVARCHAR (4)  NULL,
    [ordqty]         INT           NOT NULL,
    [fecha_creacion] DATETIME      NOT NULL
);

