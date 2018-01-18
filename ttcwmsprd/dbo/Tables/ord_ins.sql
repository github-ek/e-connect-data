CREATE TABLE [dbo].[ord_ins] (
    [client_id] NVARCHAR (32) NOT NULL,
    [ordnum]    NVARCHAR (35) NOT NULL,
    [inskey]    NVARCHAR (30) NOT NULL,
    CONSTRAINT [ord_ins_pk] PRIMARY KEY CLUSTERED ([ordnum] ASC, [inskey] ASC, [client_id] ASC) WITH (FILLFACTOR = 90)
);

