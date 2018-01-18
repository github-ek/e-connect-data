CREATE TABLE [dbo].[prtrpk] (
    [prtnum]        NVARCHAR (50) NOT NULL,
    [prt_client_id] NVARCHAR (32) NOT NULL,
    [wh_id]         NVARCHAR (32) NOT NULL,
    [rpkcls]        NVARCHAR (20) NOT NULL,
    [srtseq]        INT           NOT NULL,
    [moddte]        DATETIME      NULL,
    [mod_usr_id]    NVARCHAR (40) NULL,
    CONSTRAINT [prtrpk_pk] PRIMARY KEY CLUSTERED ([prtnum] ASC, [wh_id] ASC, [rpkcls] ASC, [prt_client_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The item repack class table is used to represent valid repack classes for items in the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtrpk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Also referred to as item number or SKU. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtrpk', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The client which owns the item number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtrpk', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtrpk', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The repack class of the item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtrpk', @level2type = N'COLUMN', @level2name = N'rpkcls';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Precedence - the order of precedence for the repack classes, when multiples are defined.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtrpk', @level2type = N'COLUMN', @level2name = N'srtseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date/time this record was last modified. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtrpk', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of user that performed last modification. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtrpk', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

