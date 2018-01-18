CREATE TABLE [dbo].[pcklst_slot_load] (
    [lodnum]           NVARCHAR (30) NOT NULL,
    [slot_lodnum]      NVARCHAR (30) NOT NULL,
    [asset_slot]       NVARCHAR (10) NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [pcklst_slot_load_pk] PRIMARY KEY CLUSTERED ([lodnum] ASC, [slot_lodnum] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Define the relationship between pick list load and slot load.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_slot_load';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset load number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_slot_load', @level2type = N'COLUMN', @level2name = N'lodnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Slot asset load number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_slot_load', @level2type = N'COLUMN', @level2name = N'slot_lodnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Slot number for the asset', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst_slot_load', @level2type = N'COLUMN', @level2name = N'asset_slot';

