CREATE TABLE [dbo].[cstrpk] (
    [client_id]  NVARCHAR (32) NOT NULL,
    [cstnum]     NVARCHAR (20) NOT NULL,
    [rpkcls]     NVARCHAR (20) NOT NULL,
    [moddte]     DATETIME      NULL,
    [mod_usr_id] NVARCHAR (40) NULL,
    CONSTRAINT [cstrpk_pk] PRIMARY KEY CLUSTERED ([cstnum] ASC, [rpkcls] ASC, [client_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The customer repack class table is used to represent valid repack classes for specified company in the system. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstrpk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client Id ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstrpk', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customer Number ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstrpk', @level2type = N'COLUMN', @level2name = N'cstnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Repack Class ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstrpk', @level2type = N'COLUMN', @level2name = N'rpkcls';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Modification Date ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstrpk', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified by Last User ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstrpk', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

