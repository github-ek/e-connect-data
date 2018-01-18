CREATE TABLE [dbo].[les_dyn_cfg] (
    [dyn_cfg_id]  NVARCHAR (50)  NOT NULL,
    [appl_id]     NVARCHAR (20)  NOT NULL,
    [frm_id]      NVARCHAR (40)  NOT NULL,
    [addon_id]    NVARCHAR (512) NOT NULL,
    [cust_lvl]    INT            NOT NULL,
    [inp_mod]     NVARCHAR (1)   NULL,
    [var_nam_lst] NVARCHAR (200) NULL,
    [les_cmd_id]  NVARCHAR (50)  NOT NULL,
    [moddte]      DATETIME       NULL,
    [mod_usr_id]  NVARCHAR (40)  NULL,
    [grp_nam]     NVARCHAR (40)  NULL,
    CONSTRAINT [les_dyn_cfg_pk] PRIMARY KEY CLUSTERED ([dyn_cfg_id] ASC, [appl_id] ASC, [frm_id] ASC, [addon_id] ASC, [cust_lvl] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [lesdyncfg_inpmodck] CHECK ([inp_mod]=N'I' OR [inp_mod]=N'N' OR [inp_mod]=N'E' OR [inp_mod]=N'D' OR [inp_mod]=N'C' OR [inp_mod]=N'A')
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains data that allows configuration of client-side variables.  This table deals specifically with the dynamic configuration of client fields when focus moves from a control or values change.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_dyn_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  This field represents the the identifier for this dynamic configuration rule.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_dyn_cfg', @level2type = N'COLUMN', @level2name = N'dyn_cfg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Associates this record to a specific application.  A value of LES applies to all applications.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_dyn_cfg', @level2type = N'COLUMN', @level2name = N'appl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Associates this record to a specific form.  A value of LES applies it to all forms.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_dyn_cfg', @level2type = N'COLUMN', @level2name = N'frm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  This associates the record to a specific add on identifier.  A value of LES applies to all add-ons', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_dyn_cfg', @level2type = N'COLUMN', @level2name = N'addon_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows different customization levels for customer and project teams.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_dyn_cfg', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows the configuration to be customized to execute during various client input modes:  A - Always, C - Criteria, D = Disabled, E = Edit, N = New, I = Input (both Edit and New).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_dyn_cfg', @level2type = N'COLUMN', @level2name = N'inp_mod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A comma-delimited list of variable names that cause this dynamic configuration to be evaluated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_dyn_cfg', @level2type = N'COLUMN', @level2name = N'var_nam_lst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifier that links this configuration to an LES commmand (les_cmd table).  This represents the command that will be executed by this rule to determine how the configuration will be changed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_dyn_cfg', @level2type = N'COLUMN', @level2name = N'les_cmd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_dyn_cfg', @level2type = N'COLUMN', @level2name = N'grp_nam';

