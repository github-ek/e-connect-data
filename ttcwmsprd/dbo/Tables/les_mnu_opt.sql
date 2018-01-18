CREATE TABLE [dbo].[les_mnu_opt] (
    [opt_nam]     NVARCHAR (50)   NOT NULL,
    [opt_typ]     NVARCHAR (1)    NULL,
    [pmsn_mask]   INT             NOT NULL,
    [ena_flg]     INT             NULL,
    [exec_nam]    NVARCHAR (100)  NULL,
    [exec_parm]   NVARCHAR (2000) NULL,
    [btn_img_id]  NVARCHAR (512)  NULL,
    [ath_grp_nam] NVARCHAR (40)   NULL,
    [addon_id]    NVARCHAR (512)  NULL,
    [grp_nam]     NVARCHAR (40)   NULL,
    CONSTRAINT [les_mnu_opt_pk] PRIMARY KEY CLUSTERED ([opt_nam] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [lesmnuopt_enaflgck] CHECK ([ena_flg]=(0) OR [ena_flg]=(1)),
    CONSTRAINT [lesmnuopt_opttypck] CHECK ([opt_typ]=N'G' OR [opt_typ]=N'S' OR [opt_typ]=N'P' OR [opt_typ]=N'I' OR [opt_typ]=N'M' OR [opt_typ]=N'X' OR [opt_typ]=N'W' OR [opt_typ]=N'F' OR [opt_typ]=N'C' OR [opt_typ]=N'D' OR [opt_typ]=N'O' OR [opt_typ]=N'E' OR [opt_typ]=N'A')
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table lists all available options.  An option is the concept of an execution item.  The table name should NOT have ''''mnu'''' in it.  It is not limited to menu items.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_mnu_opt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_mnu_opt', @level2type = N'COLUMN', @level2name = N'opt_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies what type of excecution option this is.  Possible values: A=Application, E=Execute O=Operation D=Directed RF Operation C=? F=? W=Web Page', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_mnu_opt', @level2type = N'COLUMN', @level2name = N'opt_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_mnu_opt', @level2type = N'COLUMN', @level2name = N'pmsn_mask';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates that this option is enabled or disabled.  This overides all other sercurity permissions.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_mnu_opt', @level2type = N'COLUMN', @level2name = N'ena_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of the execution option.  How this value is used differs with the type of the option.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_mnu_opt', @level2type = N'COLUMN', @level2name = N'exec_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Parameters passed to the execution module.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_mnu_opt', @level2type = N'COLUMN', @level2name = N'exec_parm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Filename of the icon for this option when displayed in the framework menu or navigation bar.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_mnu_opt', @level2type = N'COLUMN', @level2name = N'btn_img_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This associates the application to a specific add on identifier.  A value of LES applies to all add-ons. If this applications addon id is not enabled on the system, it will not appear in any menus.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_mnu_opt', @level2type = N'COLUMN', @level2name = N'addon_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_mnu_opt', @level2type = N'COLUMN', @level2name = N'grp_nam';

