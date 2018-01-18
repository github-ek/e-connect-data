CREATE TABLE [dbo].[criteria_mst] (
    [appl_id] NVARCHAR (20)  NOT NULL,
    [frm_id]  NVARCHAR (40)  NOT NULL,
    [prf_nam] NVARCHAR (40)  NOT NULL,
    [crt_nam] NVARCHAR (40)  NOT NULL,
    [var_nam] NVARCHAR (40)  NOT NULL,
    [value]   NVARCHAR (500) NULL,
    [grp_nam] NVARCHAR (40)  NULL,
    CONSTRAINT [criteria_mst_pk] PRIMARY KEY CLUSTERED ([appl_id] ASC, [frm_id] ASC, [prf_nam] ASC, [crt_nam] ASC, [var_nam] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains the definition data and settings 
    for a given criteria for a given profile.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'criteria_mst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Associates this record to a specific application.  A value of LES applies to all applications.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'criteria_mst', @level2type = N'COLUMN', @level2name = N'appl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The ID of the form that the definition belongs to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'criteria_mst', @level2type = N'COLUMN', @level2name = N'frm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the profile', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'criteria_mst', @level2type = N'COLUMN', @level2name = N'prf_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the criteria', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'criteria_mst', @level2type = N'COLUMN', @level2name = N'crt_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The variable teh criteria data is defined for', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'criteria_mst', @level2type = N'COLUMN', @level2name = N'var_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The value to be used for the criteria for this variable', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'criteria_mst', @level2type = N'COLUMN', @level2name = N'value';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'criteria_mst', @level2type = N'COLUMN', @level2name = N'grp_nam';

