CREATE TABLE [dbo].[pol_fld] (
    [pol_id]      NVARCHAR (50) NOT NULL,
    [pol_fld_nam] NVARCHAR (6)  NOT NULL,
    [fld_als]     NVARCHAR (40) NULL,
    [fld_typ]     NVARCHAR (40) NULL,
    [tt_mls_id]   NVARCHAR (40) NULL,
    [srt_seq]     INT           DEFAULT ((0)) NOT NULL,
    [grp_nam]     NVARCHAR (40) NULL,
    CONSTRAINT [pol_fld_pk] PRIMARY KEY CLUSTERED ([pol_id] ASC, [pol_fld_nam] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table list the fields that the system uses from a policy configuration.  It provides aliases for the policy data table fields and links them to tool tip text.  It also provides a command for listing the possible entries for each field.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pol_fld';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique key.  Name of the most detailed policy ''configuration''.  Foreign key to the pol_inf table', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pol_fld', @level2type = N'COLUMN', @level2name = N'pol_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique key.  This field will be one of the following: RTSTR1, RTSTR2, RTNUM1, RTNUM2, RTFLT1, RTFLT2', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pol_fld', @level2type = N'COLUMN', @level2name = N'pol_fld_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows meaningful naming of a policy field.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pol_fld', @level2type = N'COLUMN', @level2name = N'fld_als';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines the type of field this value uses for maintenance.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pol_fld', @level2type = N'COLUMN', @level2name = N'fld_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This points to an MLS entry giving tooltip text for this field', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pol_fld', @level2type = N'COLUMN', @level2name = N'tt_mls_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Determines the display order in Policy Maintenance.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pol_fld', @level2type = N'COLUMN', @level2name = N'srt_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pol_fld', @level2type = N'COLUMN', @level2name = N'grp_nam';

