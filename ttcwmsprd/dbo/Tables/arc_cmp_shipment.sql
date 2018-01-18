CREATE TABLE [dbo].[arc_cmp_shipment] (
    [cmpkey]           NVARCHAR (20) NOT NULL,
    [client_id]        NVARCHAR (32) NOT NULL,
    [ordnum]           NVARCHAR (35) NOT NULL,
    [ordlin]           NVARCHAR (10) NOT NULL,
    [ordsln]           NVARCHAR (10) NOT NULL,
    [btcust]           NVARCHAR (20) NOT NULL,
    [stcust]           NVARCHAR (20) NOT NULL,
    [rtcust]           NVARCHAR (20) NOT NULL,
    [untqty]           INT           NOT NULL,
    [shpdte]           DATETIME      NOT NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [arc_cmp_shipmentpk] PRIMARY KEY CLUSTERED ([cmpkey] ASC, [ordnum] ASC, [ordlin] ASC, [ordsln] ASC, [client_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Contains archived information linking Top-Level Items to shipments.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmp_shipment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A system generated number used to track production information.  Ties directly to the cmphdr table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmp_shipment', @level2type = N'COLUMN', @level2name = N'cmpkey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used as part of the link to the associated order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmp_shipment', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used as part of the link to the associated order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmp_shipment', @level2type = N'COLUMN', @level2name = N'ordnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used as part of the link to the associated order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmp_shipment', @level2type = N'COLUMN', @level2name = N'ordlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used as part of the link to the associated order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmp_shipment', @level2type = N'COLUMN', @level2name = N'ordsln';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Contains tracking information so that the warehouse can notify customers who received these componenets.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmp_shipment', @level2type = N'COLUMN', @level2name = N'btcust';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Contains tracking information so that the warehouse can notify customers who received these components.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmp_shipment', @level2type = N'COLUMN', @level2name = N'stcust';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Contains tracking information so that the warehouse can notify customers who received these componenets.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmp_shipment', @level2type = N'COLUMN', @level2name = N'rtcust';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Quantity shipped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmp_shipment', @level2type = N'COLUMN', @level2name = N'untqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date this order was shipped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmp_shipment', @level2type = N'COLUMN', @level2name = N'shpdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmp_shipment', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmp_shipment', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmp_shipment', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmp_shipment', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arc_cmp_shipment', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

