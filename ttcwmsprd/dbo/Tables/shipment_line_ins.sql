CREATE TABLE [dbo].[shipment_line_ins] (
    [ship_line_id] NVARCHAR (10) NOT NULL,
    [inskey]       NVARCHAR (30) NOT NULL,
    [cmpl_flg]     INT           NULL,
    CONSTRAINT [shipmnt_lin_ins_pk] PRIMARY KEY CLUSTERED ([ship_line_id] ASC, [inskey] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [shplinins_cmpflgck] CHECK ([cmpl_flg]=(0) OR [cmpl_flg]=(1))
);

