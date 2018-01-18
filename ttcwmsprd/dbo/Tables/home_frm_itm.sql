CREATE TABLE [dbo].[home_frm_itm] (
    [frm_id]       NVARCHAR (40)   NOT NULL,
    [var_nam]      NVARCHAR (40)   NOT NULL,
    [cust_lvl]     INT             NOT NULL,
    [ena_flg]      INT             NOT NULL,
    [ttip_mls_id]  NVARCHAR (40)   NULL,
    [opt_nam]      NVARCHAR (50)   NULL,
    [exec_parm]    NVARCHAR (2000) NULL,
    [col_pos]      INT             NOT NULL,
    [row_pos]      INT             NOT NULL,
    [startup_mode] INT             DEFAULT ((1)) NOT NULL,
    [text_pos]     INT             DEFAULT ((1)) NOT NULL,
    [img_id]       NVARCHAR (512)  NULL,
    [grp_nam]      NVARCHAR (40)   NULL,
    CONSTRAINT [home_frm_itm_pk] PRIMARY KEY CLUSTERED ([frm_id] ASC, [var_nam] ASC, [cust_lvl] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [home_frm_itm_efck] CHECK ([ena_flg]=(0) OR [ena_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table lists configurations and layout for menu items in home form operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'home_frm_itm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The form ID that the menu gets loaded', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'home_frm_itm', @level2type = N'COLUMN', @level2name = N'frm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The local variable name of the item', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'home_frm_itm', @level2type = N'COLUMN', @level2name = N'var_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The customization level of the item', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'home_frm_itm', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if the item is enabled', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'home_frm_itm', @level2type = N'COLUMN', @level2name = N'ena_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An optional tool tip mls id override', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'home_frm_itm', @level2type = N'COLUMN', @level2name = N'ttip_mls_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The linked menu option that gets executed', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'home_frm_itm', @level2type = N'COLUMN', @level2name = N'opt_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The parameters to pass to the form', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'home_frm_itm', @level2type = N'COLUMN', @level2name = N'exec_parm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The column that the item is located in', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'home_frm_itm', @level2type = N'COLUMN', @level2name = N'col_pos';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The row that the item is located in', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'home_frm_itm', @level2type = N'COLUMN', @level2name = N'row_pos';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The start mode of the form (0 = modal, 1 = modeless, 2 = application)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'home_frm_itm', @level2type = N'COLUMN', @level2name = N'startup_mode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The position of the text relative to the image', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'home_frm_itm', @level2type = N'COLUMN', @level2name = N'text_pos';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The override image ID of the menu item', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'home_frm_itm', @level2type = N'COLUMN', @level2name = N'img_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The group name the data belongs to', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'home_frm_itm', @level2type = N'COLUMN', @level2name = N'grp_nam';

