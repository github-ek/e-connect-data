CREATE TABLE [dbo].[client_wh] (
    [client_id]        NVARCHAR (32) NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [trans_wh_id]      NVARCHAR (32) NULL,
    [alw_sup_lot_chg]  INT           NULL,
    [auto_pop_sup_lot] INT           NULL,
    [bulk_pck_flg]     INT           DEFAULT ((0)) NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [client_wh_pk] PRIMARY KEY CLUSTERED ([wh_id] ASC, [client_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [cli_wh_suplotchgck] CHECK ([alw_sup_lot_chg]=(0) OR [alw_sup_lot_chg]=(1)),
    CONSTRAINT [cliwh_bulkpckflg_ck] CHECK ([bulk_pck_flg]=(0) OR [bulk_pck_flg]=(1)),
    CONSTRAINT [cliwh_pop_suplotck] CHECK ([auto_pop_sup_lot]=(0) OR [auto_pop_sup_lot]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client ID - The client code that owns this order.  In a non-3PL system, this value defaults to ''----''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_wh', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - the warehouse in which the order is to be fulfilled.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_wh', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Translated Warehouse ID - This is used to convert a real Warehouse ID to a recognizable Warehouse ID for Host system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_wh', @level2type = N'COLUMN', @level2name = N'trans_wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If set, the system will allow the user to change the supplier lot number while creating inventory. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_wh', @level2type = N'COLUMN', @level2name = N'alw_sup_lot_chg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If set, the system will auto populate the supplier lot number while creating inventory. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_wh', @level2type = N'COLUMN', @level2name = N'auto_pop_sup_lot';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allow Bulk Picking', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_wh', @level2type = N'COLUMN', @level2name = N'bulk_pck_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_wh', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_wh', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_wh', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_wh', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

