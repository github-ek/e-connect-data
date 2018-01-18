CREATE TABLE [dbo].[pcklst_asset_slot] (
    [slot_typ_id]      INT           NOT NULL,
    [asset_typ]        NVARCHAR (30) NOT NULL,
    [asset_slot_code]  NVARCHAR (40) NOT NULL,
    [slot_asset_typ]   NVARCHAR (30) NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [pcklst_asset_slot_pk] PRIMARY KEY CLUSTERED ([slot_typ_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is used to define slot asset type with the slot code. Mainly it will be used in list picking.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_asset_slot';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifiers for slot asset.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_asset_slot', @level2type = N'COLUMN', @level2name = N'slot_typ_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Determines the asset type.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_asset_slot', @level2type = N'COLUMN', @level2name = N'asset_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Determines the asset slot code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_asset_slot', @level2type = N'COLUMN', @level2name = N'asset_slot_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Determines the slot asset type.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_asset_slot', @level2type = N'COLUMN', @level2name = N'slot_asset_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_asset_slot', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_asset_slot', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_asset_slot', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_asset_slot', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

