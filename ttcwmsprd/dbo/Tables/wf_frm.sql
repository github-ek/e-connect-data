CREATE TABLE [dbo].[wf_frm] (
    [frm_id]           NVARCHAR (40)  NOT NULL,
    [cust_lvl]         INT            NOT NULL,
    [descr_id]         NVARCHAR (40)  NULL,
    [frm_progid]       NVARCHAR (256) NOT NULL,
    [dda_id]           NVARCHAR (40)  NULL,
    [tb_config_frm_id] NVARCHAR (40)  NULL,
    [frm_cache_flg]    INT            DEFAULT ((0)) NOT NULL,
    [grp_nam]          NVARCHAR (40)  NULL,
    CONSTRAINT [wf_frm_pk] PRIMARY KEY CLUSTERED ([frm_id] ASC, [cust_lvl] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains the configuration data for a single form in the flow.  A form can be a member of multiple applications by being linked via the wf_flw table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wf_frm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wf_frm', @level2type = N'COLUMN', @level2name = N'frm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows different customization levels for customer and project teams.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wf_frm', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the mls_id of an MLS Catalog entry that is the description of the form.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wf_frm', @level2type = N'COLUMN', @level2name = N'descr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the programmatic id of the Active X control that contains this form.  All forms are contained in Active X controls and are created using a CreateObject call.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wf_frm', @level2type = N'COLUMN', @level2name = N'frm_progid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the Data Driven Application Identifier.  This is only used if the form is a DDA form.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wf_frm', @level2type = N'COLUMN', @level2name = N'dda_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is used as an alias for this frm_id to load the tb_config.  This allows us to create some standard tb_configs that can be used by many different forms.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wf_frm', @level2type = N'COLUMN', @level2name = N'tb_config_frm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag is used to indicate whether or not this form should be cached when exiting the form. If the form is cached, subsequent load times will be faster. The default value is false.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wf_frm', @level2type = N'COLUMN', @level2name = N'frm_cache_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wf_frm', @level2type = N'COLUMN', @level2name = N'grp_nam';

