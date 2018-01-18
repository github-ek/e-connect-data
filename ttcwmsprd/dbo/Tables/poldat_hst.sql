CREATE TABLE [dbo].[poldat_hst] (
    [polcod]     NVARCHAR (50)   NULL,
    [polvar]     NVARCHAR (50)   NULL,
    [polval]     NVARCHAR (50)   NULL,
    [wh_id]      NVARCHAR (32)   DEFAULT (N'----') NOT NULL,
    [srtseq]     INT             NULL,
    [trndte]     DATETIME        NULL,
    [acttyp]     NVARCHAR (4)    NULL,
    [old_rtstr1] NVARCHAR (150)  NULL,
    [new_rtstr1] NVARCHAR (150)  NULL,
    [old_rtstr2] NVARCHAR (150)  NULL,
    [new_rtstr2] NVARCHAR (150)  NULL,
    [old_rtnum1] INT             NULL,
    [new_rtnum1] INT             NULL,
    [old_rtnum2] INT             NULL,
    [new_rtnum2] INT             NULL,
    [old_rtflt1] NUMERIC (19, 4) NULL,
    [new_rtflt1] NUMERIC (19, 4) NULL,
    [old_rtflt2] NUMERIC (19, 4) NULL,
    [new_rtflt2] NUMERIC (19, 4) NULL,
    [cmnt]       NVARCHAR (2000) NULL,
    [moddte]     DATETIME        NULL,
    [mod_usr_id] NVARCHAR (40)   NULL
);


GO
CREATE NONCLUSTERED INDEX [poldat_hst_polcod]
    ON [dbo].[poldat_hst]([polcod] ASC, [polvar] ASC, [polval] ASC, [wh_id] ASC, [srtseq] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table provides a history of the modifications made to the policies (poldat table). ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'poldat_hst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the foreign key to the policy data table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'poldat_hst', @level2type = N'COLUMN', @level2name = N'polcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the foreign key to the policy data table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'poldat_hst', @level2type = N'COLUMN', @level2name = N'polvar';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the foreign key to the policy data table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'poldat_hst', @level2type = N'COLUMN', @level2name = N'polval';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'poldat_hst', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the foreign key to the policy data table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'poldat_hst', @level2type = N'COLUMN', @level2name = N'srtseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Time and date of the change.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'poldat_hst', @level2type = N'COLUMN', @level2name = N'trndte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Type of change made to the record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'poldat_hst', @level2type = N'COLUMN', @level2name = N'acttyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Previous value for return string 1.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'poldat_hst', @level2type = N'COLUMN', @level2name = N'old_rtstr1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Previous value for return string 2.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'poldat_hst', @level2type = N'COLUMN', @level2name = N'old_rtstr2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Previous value for return number 1.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'poldat_hst', @level2type = N'COLUMN', @level2name = N'old_rtnum1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Previous value for return number 2.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'poldat_hst', @level2type = N'COLUMN', @level2name = N'old_rtnum2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Previous value for return float 1.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'poldat_hst', @level2type = N'COLUMN', @level2name = N'old_rtflt1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Previous value for return float 2.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'poldat_hst', @level2type = N'COLUMN', @level2name = N'old_rtflt2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Comment describing the change.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'poldat_hst', @level2type = N'COLUMN', @level2name = N'cmnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date this policy was last modified.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'poldat_hst', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User id of the user last modifying this policy.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'poldat_hst', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

