CREATE TABLE [dbo].[wcs_inv_rec_config] (
    [wh_id]            NVARCHAR (32)  NOT NULL,
    [wcs_id]           NVARCHAR (30)  NOT NULL,
    [fld]              NVARCHAR (128) NOT NULL,
    [srtseq]           INT            NOT NULL,
    [u_version]        INT            NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [wcs_inv_rec_config_pk] PRIMARY KEY CLUSTERED ([wh_id] ASC, [wcs_id] ASC, [fld] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stores the inventory reconciliation fields associated with Warehouse Control System.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_inv_rec_config';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_inv_rec_config', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse Control System (WCS) Identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_inv_rec_config', @level2type = N'COLUMN', @level2name = N'wcs_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Field of inventory, load and etc.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_inv_rec_config', @level2type = N'COLUMN', @level2name = N'fld';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sort Sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_inv_rec_config', @level2type = N'COLUMN', @level2name = N'srtseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_inv_rec_config', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_inv_rec_config', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_inv_rec_config', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_inv_rec_config', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_inv_rec_config', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

