CREATE TABLE [dbo].[pckexc] (
    [pck_exc_ref] NVARCHAR (10)  NOT NULL,
    [colnam]      NVARCHAR (100) NOT NULL,
    [wh_id]       NVARCHAR (32)  NOT NULL,
    [colval]      NVARCHAR (200) NOT NULL,
    [client_id]   NVARCHAR (32)  NULL,
    [untdte]      DATETIME       NULL,
    [moddte]      DATETIME       NULL,
    [mod_usr_id]  NVARCHAR (40)  NULL,
    CONSTRAINT [pckexc_pk] PRIMARY KEY CLUSTERED ([pck_exc_ref] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is used to represent pick exclusion details. It is maintained by Pick Exclusion Maintenance. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckexc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pick Exclusion Reference', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckexc', @level2type = N'COLUMN', @level2name = N'pck_exc_ref';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Column Name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckexc', @level2type = N'COLUMN', @level2name = N'colnam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckexc', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Column Value', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckexc', @level2type = N'COLUMN', @level2name = N'colval';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client Identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckexc', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date on which the pckexc will be purged from the system', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckexc', @level2type = N'COLUMN', @level2name = N'untdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date on which the last modification occured', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckexc', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last modified by', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckexc', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

