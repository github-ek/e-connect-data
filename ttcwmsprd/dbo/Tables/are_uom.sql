CREATE TABLE [dbo].[are_uom] (
    [arecod]           NVARCHAR (10)  NOT NULL,
    [wh_id]            NVARCHAR (32)  NOT NULL,
    [uomcod]           NVARCHAR (2)   NOT NULL,
    [stoflg]           INT            DEFAULT ((0)) NOT NULL,
    [pckflg]           INT            DEFAULT ((0)) NOT NULL,
    [pipflg]           INT            DEFAULT ((0)) NOT NULL,
    [skip_pick_valdt]  NVARCHAR (200) NOT NULL,
    [rplpckcod]        INT            DEFAULT ((0)) NOT NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [are_uom_pk] PRIMARY KEY CLUSTERED ([arecod] ASC, [wh_id] ASC, [uomcod] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [are_uom_pckflg_ck] CHECK ([pckflg]=(0) OR [pckflg]=(1)),
    CONSTRAINT [are_uom_pipflg_ck] CHECK ([pipflg]=(0) OR [pipflg]=(1)),
    CONSTRAINT [are_uom_rplpckcod_ck] CHECK ([rplpckcod]=(0) OR [rplpckcod]=(1)),
    CONSTRAINT [are_uom_stoflg_ck] CHECK ([stoflg]=(0) OR [stoflg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The are_uom table is created to set UOMs for the area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_uom';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Area Code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_uom', @level2type = N'COLUMN', @level2name = N'arecod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_uom', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specified UOM code for area. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_uom', @level2type = N'COLUMN', @level2name = N'uomcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Storable Flag - indicate area can store inventory by this UOM.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_uom', @level2type = N'COLUMN', @level2name = N'stoflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pickable Flag - indicate user can pick inventory from area by this UOM.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_uom', @level2type = N'COLUMN', @level2name = N'pckflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag indicates that whether this UOM will be used for pre-inventory allocation.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_uom', @level2type = N'COLUMN', @level2name = N'pipflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Pre-Validation scheme will be used before picking.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_uom', @level2type = N'COLUMN', @level2name = N'skip_pick_valdt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This field indicates which mode the replenishment will be performed at the UOM level in this area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_uom', @level2type = N'COLUMN', @level2name = N'rplpckcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_uom', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_uom', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_uom', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_uom', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

