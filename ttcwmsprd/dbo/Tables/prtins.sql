CREATE TABLE [dbo].[prtins] (
    [prtnum]        NVARCHAR (50) NOT NULL,
    [prt_client_id] NVARCHAR (32) NOT NULL,
    [wh_id]         NVARCHAR (32) NOT NULL,
    [inskey]        NVARCHAR (30) NOT NULL,
    CONSTRAINT [prtins_pk] PRIMARY KEY CLUSTERED ([prtnum] ASC, [wh_id] ASC, [inskey] ASC, [prt_client_id] ASC) WITH (FILLFACTOR = 90)
);

