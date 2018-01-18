CREATE TABLE [dbo].[ctxt_mnu_itm] (
    [appl_id]        NVARCHAR (20)   NOT NULL,
    [frm_id]         NVARCHAR (40)   NOT NULL,
    [addon_id]       NVARCHAR (512)  NOT NULL,
    [var_nam]        NVARCHAR (40)   NOT NULL,
    [ctxt_itm_nam]   NVARCHAR (50)   NOT NULL,
    [cust_lvl]       INT             NOT NULL,
    [mnu_seq]        INT             NOT NULL,
    [enable_formula] NVARCHAR (2000) NULL,
    [sel_rule]       NVARCHAR (1)    NULL,
    [btn_key]        NVARCHAR (20)   NULL,
    [grp_nam]        NVARCHAR (40)   NULL,
    CONSTRAINT [ctxt_mnu_itm_pk] PRIMARY KEY CLUSTERED ([appl_id] ASC, [frm_id] ASC, [addon_id] ASC, [var_nam] ASC, [ctxt_itm_nam] ASC, [cust_lvl] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table hold the configuration for context menus for Search Results. It is linked to search fields, and to button keys that indicate what actions are executed upon running', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctxt_mnu_itm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The application ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctxt_mnu_itm', @level2type = N'COLUMN', @level2name = N'appl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The ID of the Form.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctxt_mnu_itm', @level2type = N'COLUMN', @level2name = N'frm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The addon ID of the Form.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctxt_mnu_itm', @level2type = N'COLUMN', @level2name = N'addon_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The var name of the displayed search column', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctxt_mnu_itm', @level2type = N'COLUMN', @level2name = N'var_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The context menu item name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctxt_mnu_itm', @level2type = N'COLUMN', @level2name = N'ctxt_itm_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The customization level', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctxt_mnu_itm', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The sequence of the menu item', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctxt_mnu_itm', @level2type = N'COLUMN', @level2name = N'mnu_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The expression used to evaluate if the menu item should be enabled - see documentation', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctxt_mnu_itm', @level2type = N'COLUMN', @level2name = N'enable_formula';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The selection rule for the context item', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctxt_mnu_itm', @level2type = N'COLUMN', @level2name = N'sel_rule';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The key of the button that contains the action that should be executed', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctxt_mnu_itm', @level2type = N'COLUMN', @level2name = N'btn_key';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Group Name for the Data.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctxt_mnu_itm', @level2type = N'COLUMN', @level2name = N'grp_nam';

