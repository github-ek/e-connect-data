CREATE TABLE [dbo].[wcs_disc_attr] (
    [attr_id]          INT            NOT NULL,
    [attr_nam]         NVARCHAR (50)  NOT NULL,
    [wcs_val]          NVARCHAR (100) NULL,
    [wms_val]          NVARCHAR (100) NULL,
    [lpn_id]           INT            NOT NULL,
    [u_version]        INT            NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [wcs_disc_attr_pk] PRIMARY KEY CLUSTERED ([attr_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stores all LPN attributes information for Warehouse Control System (WCS) discrepancies.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_attr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Attribute ID. Surrogate key that has no business meaning in the table, but rather, it serves as the identity column of the table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_attr', @level2type = N'COLUMN', @level2name = N'attr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of the inventory attribute that has found to be discrepant between WCS and WMS.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_attr', @level2type = N'COLUMN', @level2name = N'attr_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Attribute value that exist on the WCS end that was sent to WMS for the comparison.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_attr', @level2type = N'COLUMN', @level2name = N'wcs_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Attribute value that existed on the WMS end at time two systems were compared.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_attr', @level2type = N'COLUMN', @level2name = N'wms_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'LPN ID. Foreign key to the wcs_disc_lpn table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_attr', @level2type = N'COLUMN', @level2name = N'lpn_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_attr', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_attr', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_attr', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_attr', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_attr', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

