CREATE TABLE [dbo].[profile_mst] (
    [appl_id]          NVARCHAR (20) NOT NULL,
    [frm_id]           NVARCHAR (40) NOT NULL,
    [prf_nam]          NVARCHAR (40) NOT NULL,
    [dis_edit_flg]     INT           DEFAULT ((0)) NULL,
    [prf_default]      INT           DEFAULT ((0)) NULL,
    [default_criteria] NVARCHAR (40) NULL,
    [opt_nam]          NVARCHAR (50) NULL,
    [usr_id]           NVARCHAR (40) NULL,
    [grp_nam]          NVARCHAR (40) NULL,
    CONSTRAINT [profile_mst_pk] PRIMARY KEY CLUSTERED ([appl_id] ASC, [frm_id] ASC, [prf_nam] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [prfmst_disedtflgck] CHECK ([dis_edit_flg]=(0) OR [dis_edit_flg]=(1)),
    CONSTRAINT [prfmst_prfdefck] CHECK ([prf_default]=(0) OR [prf_default]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains the definition data and settings 
    for a given profile. Note opt_nam and usr_id cannot both be assigned', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'profile_mst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Associates this record to a specific application.  A value of LES applies to all applications.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'profile_mst', @level2type = N'COLUMN', @level2name = N'appl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The ID of the form that the definition belongs to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'profile_mst', @level2type = N'COLUMN', @level2name = N'frm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the profile', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'profile_mst', @level2type = N'COLUMN', @level2name = N'prf_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Disable editing of the profile and it''s criteria', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'profile_mst', @level2type = N'COLUMN', @level2name = N'dis_edit_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines if the profile is the default for the form', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'profile_mst', @level2type = N'COLUMN', @level2name = N'prf_default';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies the default criteria for this profile.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'profile_mst', @level2type = N'COLUMN', @level2name = N'default_criteria';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The option that defines which users / groups can view the profile', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'profile_mst', @level2type = N'COLUMN', @level2name = N'opt_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user who owns the profile', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'profile_mst', @level2type = N'COLUMN', @level2name = N'usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'profile_mst', @level2type = N'COLUMN', @level2name = N'grp_nam';

