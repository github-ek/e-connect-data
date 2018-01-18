CREATE TABLE [dbo].[wko_typ] (
    [wh_id]            NVARCHAR (32) NOT NULL,
    [wko_typ]          NVARCHAR (10) NOT NULL,
    [disass_flg]       INT           DEFAULT ((0)) NOT NULL,
    [prcare]           NVARCHAR (10) NULL,
    [prdlin]           NVARCHAR (20) NULL,
    [bulk_pck_flg]     INT           DEFAULT ((1)) NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [wko_typ_pk] PRIMARY KEY CLUSTERED ([wh_id] ASC, [wko_typ] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [wko_typ_bulkpckflg_ck] CHECK ([bulk_pck_flg]=(0) OR [bulk_pck_flg]=(1)),
    CONSTRAINT [wko_typ_disflg_ck] CHECK ([disass_flg]=(0) OR [disass_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates the Warehouse Id for the work order type.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_typ', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of the work order.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_typ', @level2type = N'COLUMN', @level2name = N'wko_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates the work order type is Disassembly or not.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_typ', @level2type = N'COLUMN', @level2name = N'disass_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The default process area for the work order type.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_typ', @level2type = N'COLUMN', @level2name = N'prcare';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The default production line for the work order type.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_typ', @level2type = N'COLUMN', @level2name = N'prdlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allow bulk picking.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_typ', @level2type = N'COLUMN', @level2name = N'bulk_pck_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_typ', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last update.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_typ', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_typ', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wko_typ', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

