CREATE TABLE [dbo].[shipment_ins] (
    [ship_id]   NVARCHAR (30) NOT NULL,
    [client_id] NVARCHAR (32) NOT NULL,
    [ordnum]    NVARCHAR (35) NOT NULL,
    [inskey]    NVARCHAR (30) NOT NULL,
    [cmpl_flg]  INT           NULL,
    CONSTRAINT [shipment_ins_pk] PRIMARY KEY CLUSTERED ([ship_id] ASC, [ordnum] ASC, [inskey] ASC, [client_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [shphdrins_cmpflgck] CHECK ([cmpl_flg]=(0) OR [cmpl_flg]=(1))
);

