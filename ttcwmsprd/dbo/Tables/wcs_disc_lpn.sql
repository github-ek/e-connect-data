CREATE TABLE [dbo].[wcs_disc_lpn] (
    [lpn_id]           INT           NOT NULL,
    [lodnum]           NVARCHAR (30) NOT NULL,
    [disc_typ]         NVARCHAR (1)  NOT NULL,
    [hdr_id]           INT           NOT NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [wcs_disc_lpn_pk] PRIMARY KEY CLUSTERED ([lpn_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stores all LPN information for Warehouse Control System (WCS) discrepancies.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_lpn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'LPN ID. Surrogate key that has no business meaning in the table, but rather, it serves as the identity column of the table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_lpn', @level2type = N'COLUMN', @level2name = N'lpn_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_lpn', @level2type = N'COLUMN', @level2name = N'lodnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Discrepancy Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_lpn', @level2type = N'COLUMN', @level2name = N'disc_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Header ID. Foreign key to the wcs_disc_hdr table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_lpn', @level2type = N'COLUMN', @level2name = N'hdr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_lpn', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_lpn', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_lpn', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_lpn', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_lpn', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

