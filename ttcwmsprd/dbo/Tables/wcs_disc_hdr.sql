CREATE TABLE [dbo].[wcs_disc_hdr] (
    [hdr_id]           INT           NOT NULL,
    [wcs_id]           NVARCHAR (30) NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [tran_id]          NVARCHAR (50) NOT NULL,
    [tran_dt]          DATETIME      NOT NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [wcs_disc_hdr_pk] PRIMARY KEY CLUSTERED ([hdr_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stores all header information for Warehouse Control System (WCS) discrepancies. Each header row represents a file that sent by WCS and processed by WMS.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_hdr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Header ID. Surrogate key that has no business meaning in the table, but rather, it serves as the identity column of the table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_hdr', @level2type = N'COLUMN', @level2name = N'hdr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse Control System (WCS) Identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_hdr', @level2type = N'COLUMN', @level2name = N'wcs_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_hdr', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Transaction ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_hdr', @level2type = N'COLUMN', @level2name = N'tran_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Transaction Date and Time', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_hdr', @level2type = N'COLUMN', @level2name = N'tran_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_hdr', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_hdr', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_hdr', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_hdr', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wcs_disc_hdr', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

