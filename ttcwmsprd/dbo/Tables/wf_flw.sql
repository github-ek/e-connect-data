CREATE TABLE [dbo].[wf_flw] (
    [appl_id]        NVARCHAR (20) NOT NULL,
    [cust_lvl]       INT           NOT NULL,
    [frm_id]         NVARCHAR (40) NOT NULL,
    [nxt_frm_id]     NVARCHAR (40) NULL,
    [prv_frm_id]     NVARCHAR (40) NULL,
    [home_frm_id]    NVARCHAR (40) NULL,
    [frm_id_cmd]     NVARCHAR (60) NULL,
    [static_frm_flg] INT           NOT NULL,
    [grp_nam]        NVARCHAR (40) NULL,
    CONSTRAINT [wf_flw_pk] PRIMARY KEY CLUSTERED ([appl_id] ASC, [frm_id] ASC, [cust_lvl] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains configuration data for work flow between screens of applications.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wf_flw';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  This defines what application this flow entry belongs in.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wf_flw', @level2type = N'COLUMN', @level2name = N'appl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows different customization levels for customer and project teams.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wf_flw', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the form that this flow record applies to.  All flow defined in this record is FROM this form.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wf_flw', @level2type = N'COLUMN', @level2name = N'frm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the next form in the flow.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wf_flw', @level2type = N'COLUMN', @level2name = N'nxt_frm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the previous form in the flow.  When a ''''BACK'''' is performed, the application goes to this form.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wf_flw', @level2type = N'COLUMN', @level2name = N'prv_frm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the form the application goes to if a ''''HOME'''' is performed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wf_flw', @level2type = N'COLUMN', @level2name = N'home_frm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is a MOCA component that is executed to determine a dynamic work flow.  This command should publish prv_frm_id, nxt_frm_id and home_frm_id fields.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wf_flw', @level2type = N'COLUMN', @level2name = N'frm_id_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this flag is set, the form (control) is held in memory while moving between forms in an application.  This means that all data and internal variables of the form stay intact.  If this flag is not set, the form is unloaded when it is left.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wf_flw', @level2type = N'COLUMN', @level2name = N'static_frm_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wf_flw', @level2type = N'COLUMN', @level2name = N'grp_nam';

