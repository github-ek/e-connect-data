CREATE TABLE [dbo].[alt_prtmst] (
    [alt_prtnum]          NVARCHAR (50) NOT NULL,
    [prtnum]              NVARCHAR (50) NOT NULL,
    [prt_client_id]       NVARCHAR (32) DEFAULT (N'----') NOT NULL,
    [alt_prt_typ]         NVARCHAR (20) NOT NULL,
    [uomcod]              NVARCHAR (2)  NULL,
    [rfid_filter_val_cod] NVARCHAR (40) NULL,
    [moddte]              DATETIME      NULL,
    [mod_usr_id]          NVARCHAR (40) NULL,
    [u_version]           INT           NULL,
    [ins_dt]              DATETIME      NULL,
    [last_upd_dt]         DATETIME      NULL,
    [ins_user_id]         NVARCHAR (40) NULL,
    [last_upd_user_id]    NVARCHAR (40) NULL,
    CONSTRAINT [alt_prtmst_pk] PRIMARY KEY CLUSTERED ([alt_prtnum] ASC, [prtnum] ASC, [prt_client_id] ASC, [alt_prt_typ] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [alt_prtmst_aprttyp]
    ON [dbo].[alt_prtmst]([prtnum] ASC, [prt_client_id] ASC, [alt_prt_typ] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The alternate item master table is used to keep track of alternate item numbers for a given item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alt_prtmst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The alternate item number which uniquely identifies the item. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alt_prtmst', @level2type = N'COLUMN', @level2name = N'alt_prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Also referred to as item number or SKU. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alt_prtmst', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The client which owns the item number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alt_prtmst', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The alternate item type. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alt_prtmst', @level2type = N'COLUMN', @level2name = N'alt_prt_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unit of measure code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alt_prtmst', @level2type = N'COLUMN', @level2name = N'uomcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The filter value used for RFID tags', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alt_prtmst', @level2type = N'COLUMN', @level2name = N'rfid_filter_val_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The last modified date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alt_prtmst', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The last modified user', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alt_prtmst', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alt_prtmst', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alt_prtmst', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alt_prtmst', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alt_prtmst', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alt_prtmst', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

