CREATE TABLE [dbo].[wh_uom] (
    [wh_id]                   NVARCHAR (32) NOT NULL,
    [uomcod]                  NVARCHAR (2)  NOT NULL,
    [default_shp_release_flg] INT           DEFAULT ((1)) NULL,
    [default_wko_release_flg] INT           DEFAULT ((1)) NULL,
    [default_bulk_pick_flg]   INT           DEFAULT ((0)) NULL,
    [ins_dt]                  DATETIME      NULL,
    [ins_user_id]             NVARCHAR (40) NULL,
    [moddte]                  DATETIME      NULL,
    [mod_usr_id]              NVARCHAR (40) NULL,
    CONSTRAINT [wh_uom_pk] PRIMARY KEY CLUSTERED ([wh_id] ASC, [uomcod] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [whuom_defblkpckflg_ck] CHECK ([default_bulk_pick_flg]=(0) OR [default_bulk_pick_flg]=(1)),
    CONSTRAINT [whuom_defshpflg_ck] CHECK ([default_shp_release_flg]=(0) OR [default_shp_release_flg]=(1)),
    CONSTRAINT [whuom_defwkoflg_ck] CHECK ([default_wko_release_flg]=(0) OR [default_wko_release_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is used for storing the combination of warehouse id and uom code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_uom';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_uom', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unit of measure that is available or use in the warehouse.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_uom', @level2type = N'COLUMN', @level2name = N'uomcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this flag is set to 1, the UOM code will be marked for immediate release by default during allocation of outbound shipments.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_uom', @level2type = N'COLUMN', @level2name = N'default_shp_release_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this flag is set to 1, the UOM code will be marked for immediate release by default during allocation of work orders.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_uom', @level2type = N'COLUMN', @level2name = N'default_wko_release_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this flag is set to 1, the UOM code will be marked as bulk pick uom.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_uom', @level2type = N'COLUMN', @level2name = N'default_bulk_pick_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The insert date of this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_uom', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user who insert this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_uom', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The last modify date of this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_uom', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user who made the last modification of this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_uom', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

