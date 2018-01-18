CREATE TABLE [dbo].[comp_ver] (
    [base_prog_id]  NVARCHAR (256) NOT NULL,
    [comp_maj_ver]  INT            NOT NULL,
    [comp_min_ver]  INT            NOT NULL,
    [comp_bld_ver]  INT            NOT NULL,
    [comp_rev_ver]  INT            NOT NULL,
    [comp_file_nam] NVARCHAR (256) NOT NULL,
    [comp_prog_id]  NVARCHAR (256) NOT NULL,
    [comp_typ]      NVARCHAR (1)   NOT NULL,
    [comp_file_ext] NVARCHAR (3)   NOT NULL,
    [comp_need_fw]  INT            NULL,
    [lic_key]       NVARCHAR (100) NULL,
    [grp_nam]       NVARCHAR (40)  NOT NULL,
    CONSTRAINT [comp_ver_pk] PRIMARY KEY CLUSTERED ([base_prog_id] ASC, [comp_maj_ver] ASC, [comp_min_ver] ASC, [comp_bld_ver] ASC, [comp_rev_ver] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains the expected version information for all DigitaLogistix components.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'comp_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part 1 of the primary key.  The program id of the component minus the version. This is the link to the wf_frm table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'comp_ver', @level2type = N'COLUMN', @level2name = N'base_prog_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part 2 of the primary key.  The major version number.  Data is stored for all versions of each component for fallback capability', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'comp_ver', @level2type = N'COLUMN', @level2name = N'comp_maj_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part 3 of the primary key.  The minor version number.  Data is stored for all versions of each component for fallback capability', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'comp_ver', @level2type = N'COLUMN', @level2name = N'comp_min_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part 4 of the primary key.  The build version number.  Currently not used - always zero', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'comp_ver', @level2type = N'COLUMN', @level2name = N'comp_bld_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part 5 of the primary key.  The revision number.  Data is stored for all versions of each component for fallback capability', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'comp_ver', @level2type = N'COLUMN', @level2name = N'comp_rev_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The filename of the component.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'comp_ver', @level2type = N'COLUMN', @level2name = N'comp_file_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This field is the internal program id of the component', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'comp_ver', @level2type = N'COLUMN', @level2name = N'comp_prog_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The component type.  Example types are D=ActiveX Library, F=Form.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'comp_ver', @level2type = N'COLUMN', @level2name = N'comp_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The file extension of the component.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'comp_ver', @level2type = N'COLUMN', @level2name = N'comp_file_ext';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Designates whether the defined component is dependent on the framework.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'comp_ver', @level2type = N'COLUMN', @level2name = N'comp_need_fw';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Run-time license key for the component.  This is used when a client side component has a license associated with it.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'comp_ver', @level2type = N'COLUMN', @level2name = N'lic_key';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'comp_ver', @level2type = N'COLUMN', @level2name = N'grp_nam';

