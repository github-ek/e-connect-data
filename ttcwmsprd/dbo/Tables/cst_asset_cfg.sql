CREATE TABLE [dbo].[cst_asset_cfg] (
    [cstnum]           NVARCHAR (20) NOT NULL,
    [mc_csttyp]        NVARCHAR (4)  NOT NULL,
    [asset_typ]        NVARCHAR (30) NOT NULL,
    [pck_uom]          NVARCHAR (2)  NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [cst_asset_cfg_pk] PRIMARY KEY CLUSTERED ([cstnum] ASC, [mc_csttyp] ASC, [asset_typ] ASC, [pck_uom] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is used to store the asset configuration details for customers', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_asset_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customer Number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_asset_cfg', @level2type = N'COLUMN', @level2name = N'cstnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customer Type.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_asset_cfg', @level2type = N'COLUMN', @level2name = N'mc_csttyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Type - This field groups assets based on common traits such as the dimensions, weight, manufacture, etc.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_asset_cfg', @level2type = N'COLUMN', @level2name = N'asset_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'UOM set according to pckqty when created in allocating inventory. Represents at which UOM level shoud user pick the inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_asset_cfg', @level2type = N'COLUMN', @level2name = N'pck_uom';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_asset_cfg', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_asset_cfg', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_asset_cfg', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_asset_cfg', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

