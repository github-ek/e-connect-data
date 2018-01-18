CREATE TABLE [dbo].[profile_def] (
    [appl_id] NVARCHAR (20)   NOT NULL,
    [frm_id]  NVARCHAR (40)   NOT NULL,
    [prf_cmd] NVARCHAR (2000) NULL,
    [grp_nam] NVARCHAR (40)   NULL,
    CONSTRAINT [profile_def_pk] PRIMARY KEY CLUSTERED ([appl_id] ASC, [frm_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains the configuration data for a profile definition.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'profile_def';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Associates this record to a specific application.  A value of LES applies to all applications.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'profile_def', @level2type = N'COLUMN', @level2name = N'appl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The ID of the form that the definition belongs to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'profile_def', @level2type = N'COLUMN', @level2name = N'frm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The MOCA Command to get the field list from', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'profile_def', @level2type = N'COLUMN', @level2name = N'prf_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'profile_def', @level2type = N'COLUMN', @level2name = N'grp_nam';

