CREATE TABLE [dbo].[__embarques_lineas_20180307] (
    [id]           BIGINT         IDENTITY (1, 1) NOT NULL,
    [record_key]   NVARCHAR (200) NOT NULL,
    [line_key]     NVARCHAR (40)  NOT NULL,
    [ship_id]      NVARCHAR (30)  NOT NULL,
    [ship_line_id] NVARCHAR (10)  NOT NULL,
    [dtlnum]       NVARCHAR (30)  NOT NULL,
    [client_id]    NVARCHAR (32)  NOT NULL,
    [wh_id]        NVARCHAR (32)  NOT NULL,
    [ordnum]       NVARCHAR (35)  NOT NULL,
    [ordlin]       NVARCHAR (10)  NOT NULL,
    [prtnum]       NVARCHAR (50)  NOT NULL,
    [linsts]       NVARCHAR (1)   NOT NULL,
    [shpqty]       INT            NOT NULL,
    [lotnum]       NVARCHAR (25)  NOT NULL,
    [untqty]       INT            NOT NULL,
    [moddte]       DATETIME       NOT NULL,
    [mod_usr_id]   NVARCHAR (40)  NOT NULL
);

