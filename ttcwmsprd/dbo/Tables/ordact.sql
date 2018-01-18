CREATE TABLE [dbo].[ordact] (
    [wh_id]             NVARCHAR (32)   NOT NULL,
    [ordact_id]         NVARCHAR (10)   NOT NULL,
    [trndte]            DATETIME        NULL,
    [actcod]            NVARCHAR (40)   NULL,
    [ship_line_id]      NVARCHAR (10)   NULL,
    [ship_id]           NVARCHAR (30)   NULL,
    [client_id]         NVARCHAR (32)   NULL,
    [ordnum]            NVARCHAR (35)   NULL,
    [ordlin]            NVARCHAR (10)   NULL,
    [ordsln]            NVARCHAR (10)   NULL,
    [prt_client_id]     NVARCHAR (32)   NULL,
    [prtnum]            NVARCHAR (50)   NULL,
    [stcust]            NVARCHAR (20)   NULL,
    [ordtyp]            NVARCHAR (4)    NULL,
    [carcod]            NVARCHAR (10)   NULL,
    [srvlvl]            NVARCHAR (10)   NULL,
    [stop_id]           NVARCHAR (10)   NULL,
    [stop_seq]          INT             NULL,
    [car_move_id]       NVARCHAR (10)   NULL,
    [ordqty]            INT             NULL,
    [pckqty]            INT             NULL,
    [schbat]            NVARCHAR (32)   NULL,
    [orig_ship_id]      NVARCHAR (30)   NULL,
    [orig_ship_line_id] NVARCHAR (10)   NULL,
    [super_ship_id]     NVARCHAR (30)   NULL,
    [super_ship_flg]    INT             NULL,
    [ordlin_chg_reacod] NVARCHAR (20)   NULL,
    [reacod_cmnt]       NVARCHAR (240)  NULL,
    [mod_collst]        NVARCHAR (2000) NULL,
    [mod_vallst]        NVARCHAR (2000) NULL,
    [arcdte]            DATETIME        NULL,
    [arc_src]           NVARCHAR (30)   NULL,
    [usr_id]            NVARCHAR (40)   NULL,
    [rowid]             INT             IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [ordact_pk] PRIMARY KEY CLUSTERED ([ordact_id] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [ordact_supshpflgck] CHECK ([super_ship_flg]=(0) OR [super_ship_flg]=(1))
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ordact_rowid]
    ON [dbo].[ordact]([rowid] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [ordact_ord_clnt_wh]
    ON [dbo].[ordact]([ordnum] ASC, [wh_id] ASC, [client_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [ordact_ordnumcltid]
    ON [dbo].[ordact]([ordnum] ASC, [client_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The ord_act table is used to store order activity history.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ordact';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - the warehouse in which the order is to be fulfilled', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ordact', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier for the order activity record. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ordact', @level2type = N'COLUMN', @level2name = N'ordact_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date and time the order activity occurred. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ordact', @level2type = N'COLUMN', @level2name = N'trndte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The shipment line the order line was associated with. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ordact', @level2type = N'COLUMN', @level2name = N'ship_line_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The shipment ID the order was on.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ordact', @level2type = N'COLUMN', @level2name = N'ship_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The client which owns the order. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ordact', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The order number the activity record is for. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ordact', @level2type = N'COLUMN', @level2name = N'ordnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The line number for the order line. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ordact', @level2type = N'COLUMN', @level2name = N'ordlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The sub-line number for the order line. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ordact', @level2type = N'COLUMN', @level2name = N'ordsln';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The client which owns the item number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ordact', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Also referred to as item number or SKU. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ordact', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The carrier code.  This may be the carrier code for either the order or the shipment, depending on which entity the activity is being logged for. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ordact', @level2type = N'COLUMN', @level2name = N'carcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The service level.  ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ordact', @level2type = N'COLUMN', @level2name = N'srvlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The stop  the order was assigned to. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ordact', @level2type = N'COLUMN', @level2name = N'stop_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The order in which the stop will be loaded onto the trailer.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ordact', @level2type = N'COLUMN', @level2name = N'stop_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifier which ties stops together for a single trailer. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ordact', @level2type = N'COLUMN', @level2name = N'car_move_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The original quantity the order line should fulfill.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ordact', @level2type = N'COLUMN', @level2name = N'ordqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The actual quantity the order line will fulfill. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ordact', @level2type = N'COLUMN', @level2name = N'pckqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The wave number the order was planned into, if the order was waveable ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ordact', @level2type = N'COLUMN', @level2name = N'schbat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The original shipment id if this shipment was split ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ordact', @level2type = N'COLUMN', @level2name = N'orig_ship_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The original shipment line id if this shipment line was split ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ordact', @level2type = N'COLUMN', @level2name = N'orig_ship_line_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this shipment was planned into a super shipment, this is the super shipment identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ordact', @level2type = N'COLUMN', @level2name = N'super_ship_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag indicates if this shipment is a super shipment', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ordact', @level2type = N'COLUMN', @level2name = N'super_ship_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Reason Code - uniquely identifies a reason why order line was changed. A corresponding description of the reason is stored in dscmst', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ordact', @level2type = N'COLUMN', @level2name = N'ordlin_chg_reacod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Reason Code Comment - provides comments for reacod ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ordact', @level2type = N'COLUMN', @level2name = N'reacod_cmnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The list of columns that changed when a change was logged for either the order or the shipment. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ordact', @level2type = N'COLUMN', @level2name = N'mod_collst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The list of values that changed when a change was logged for either an order or a shipment. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ordact', @level2type = N'COLUMN', @level2name = N'mod_vallst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Archive Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ordact', @level2type = N'COLUMN', @level2name = N'arcdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Archive Source', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ordact', @level2type = N'COLUMN', @level2name = N'arc_src';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user the did the action that the activity is being captured for. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ordact', @level2type = N'COLUMN', @level2name = N'usr_id';

