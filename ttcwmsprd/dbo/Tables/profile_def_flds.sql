CREATE TABLE [dbo].[profile_def_flds] (
    [appl_id]     NVARCHAR (20) NOT NULL,
    [frm_id]      NVARCHAR (40) NOT NULL,
    [fld_rqd_flg] INT           DEFAULT ((0)) NULL,
    [var_nam]     NVARCHAR (40) NOT NULL,
    [srtseq]      INT           DEFAULT ((0)) NULL,
    [grp_nam]     NVARCHAR (40) NULL,
    CONSTRAINT [prf_def_flds_pk] PRIMARY KEY CLUSTERED ([appl_id] ASC, [frm_id] ASC, [var_nam] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [prfdeffld_rqdflgck] CHECK ([fld_rqd_flg]=(0) OR [fld_rqd_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains field configuration data for a profile definition.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'profile_def_flds';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Associates this record to a specific application.  A value of LES applies to all applications.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'profile_def_flds', @level2type = N'COLUMN', @level2name = N'appl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The ID of the form that the definition belongs to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'profile_def_flds', @level2type = N'COLUMN', @level2name = N'frm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Is the field required', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'profile_def_flds', @level2type = N'COLUMN', @level2name = N'fld_rqd_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Variable that is being added', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'profile_def_flds', @level2type = N'COLUMN', @level2name = N'var_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The sort sequence of REQUIRED fields that determines the load order', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'profile_def_flds', @level2type = N'COLUMN', @level2name = N'srtseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'profile_def_flds', @level2type = N'COLUMN', @level2name = N'grp_nam';

