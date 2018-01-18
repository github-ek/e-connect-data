CREATE TABLE [dbo].[cstins] (
    [client_id] NVARCHAR (32) NOT NULL,
    [cstnum]    NVARCHAR (20) NOT NULL,
    [inskey]    NVARCHAR (30) NOT NULL,
    CONSTRAINT [cstins_pk] PRIMARY KEY CLUSTERED ([cstnum] ASC, [inskey] ASC, [client_id] ASC) WITH (FILLFACTOR = 90)
);

