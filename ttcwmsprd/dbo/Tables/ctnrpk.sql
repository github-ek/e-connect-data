CREATE TABLE [dbo].[ctnrpk] (
    [ctncod]     NVARCHAR (4)  NOT NULL,
    [rpkcls]     NVARCHAR (20) NOT NULL,
    [wh_id]      NVARCHAR (32) NOT NULL,
    [moddte]     DATETIME      NULL,
    [mod_usr_id] NVARCHAR (40) NULL,
    CONSTRAINT [ctnrpk_pk] PRIMARY KEY CLUSTERED ([ctncod] ASC, [rpkcls] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The carton repack class table is used to represent valid repack classes for cartons in the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctnrpk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The code for the carton being used. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctnrpk', @level2type = N'COLUMN', @level2name = N'ctncod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The repack class of the carton.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctnrpk', @level2type = N'COLUMN', @level2name = N'rpkcls';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctnrpk', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date/time this record was last modified. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctnrpk', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of user that performed last modification. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctnrpk', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

