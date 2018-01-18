CREATE TABLE [dbo].[dda_mst] (
    [dda_id]           NVARCHAR (40)   NOT NULL,
    [cust_lvl]         INT             NOT NULL,
    [dda_typ]          NVARCHAR (1)    NOT NULL,
    [dda_usage]        NVARCHAR (1)    NOT NULL,
    [topflg]           INT             NULL,
    [dda_cmd]          NVARCHAR (2000) NOT NULL,
    [dda_qual]         NVARCHAR (512)  NULL,
    [dda_init_qual]    NVARCHAR (512)  NULL,
    [dda_frm]          NVARCHAR (200)  NULL,
    [dda_img]          NVARCHAR (100)  NULL,
    [init_cmd]         NVARCHAR (1800) NULL,
    [cache_init_cols]  INT             DEFAULT ((1)) NOT NULL,
    [rqdflg]           INT             DEFAULT ((0)) NULL,
    [grp_nam]          NVARCHAR (40)   NULL,
    [sum_flds]         NVARCHAR (100)  NULL,
    [excelflg]         INT             DEFAULT ((0)) NULL,
    [exceltmpl]        NVARCHAR (25)   NULL,
    [reference]        NVARCHAR (40)   NULL,
    [tnw_typ]          INT             NULL,
    [grid_pos]         INT             NULL,
    [grid_prop]        NVARCHAR (512)  NULL,
    [publish_data_flg] INT             DEFAULT ((0)) NULL,
    [prof_crit_mode]   INT             NULL,
    [auto_find]        INT             NULL,
    [xsl_file]         NVARCHAR (512)  NULL,
    CONSTRAINT [dda_mst_pk] PRIMARY KEY CLUSTERED ([dda_id] ASC, [cust_lvl] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [dda_mst_cachcolck] CHECK ([cache_init_cols]=(0) OR [cache_init_cols]=(1)),
    CONSTRAINT [dda_mst_excelflgck] CHECK ([excelflg]=(0) OR [excelflg]=(1)),
    CONSTRAINT [dda_mst_rqdflg_ck] CHECK ([rqdflg]=(0) OR [rqdflg]=(1)),
    CONSTRAINT [dda_mst_topflg_ck] CHECK ([topflg]=(0) OR [topflg]=(1)),
    CONSTRAINT [ddamst_pubdatflgck] CHECK ([publish_data_flg]=(0) OR [publish_data_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table holds the master data for DDA defintions ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_mst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The DDA identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_mst', @level2type = N'COLUMN', @level2name = N'dda_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows different customization levels for customer and project teams.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_mst', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of DDA being defined.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_mst', @level2type = N'COLUMN', @level2name = N'dda_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Where the DDA will run: F = GUI Frameowrk, W = Web and B = Both.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_mst', @level2type = N'COLUMN', @level2name = N'dda_usage';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stermies if this DDA is a top level DdA for menuin:  Obsolete.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_mst', @level2type = N'COLUMN', @level2name = N'topflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The MOCA command to run.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_mst', @level2type = N'COLUMN', @level2name = N'dda_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A static qualifier to apply to the command.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_mst', @level2type = N'COLUMN', @level2name = N'dda_qual';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A static qualifier to apply to the command when the DDA is initialized.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_mst', @level2type = N'COLUMN', @level2name = N'dda_init_qual';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used by the web to indicate use a custom form instead of the standard DDA.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_mst', @level2type = N'COLUMN', @level2name = N'dda_frm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used by the web to display an image.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_mst', @level2type = N'COLUMN', @level2name = N'dda_img';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Special command to use at initialization.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_mst', @level2type = N'COLUMN', @level2name = N'init_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Set to cache the columns returned by the initialization command. For the majority of cases this should be enabled and is by default.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_mst', @level2type = N'COLUMN', @level2name = N'cache_init_cols';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_mst', @level2type = N'COLUMN', @level2name = N'rqdflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_mst', @level2type = N'COLUMN', @level2name = N'grp_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'List of display fields to get the sum for per row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_mst', @level2type = N'COLUMN', @level2name = N'sum_flds';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Web Only: Flag to indicate Excel templates used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_mst', @level2type = N'COLUMN', @level2name = N'excelflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Web Only: The excel template to use.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_mst', @level2type = N'COLUMN', @level2name = N'exceltmpl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User defined reference field.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_mst', @level2type = N'COLUMN', @level2name = N'reference';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Target New Window type for action processing. 0 = no window, 1 = Modeless, 2 = Modeless w/Refresh, 3 = Modal, 4 = Modal w/Refresh.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_mst', @level2type = N'COLUMN', @level2name = N'tnw_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Where to place the grid.  0 = top, 1 = bottom.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_mst', @level2type = N'COLUMN', @level2name = N'grid_pos';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Set editable grid properties.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_mst', @level2type = N'COLUMN', @level2name = N'grid_prop';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag to determine if publish data should be used for the DDA command.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_mst', @level2type = N'COLUMN', @level2name = N'publish_data_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Use of MCS Query Control.  0 = Profile & Criteria, 1 = Criteria Only, 2 = Don''t use.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_mst', @level2type = N'COLUMN', @level2name = N'prof_crit_mode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Auto Find Setting.  0 = None, 1 = Always, 2 = Form Flow Only.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_mst', @level2type = N'COLUMN', @level2name = N'auto_find';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies name of xsl file to use for XSLT transformation in XML typ DDA', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_mst', @level2type = N'COLUMN', @level2name = N'xsl_file';

