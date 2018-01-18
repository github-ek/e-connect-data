CREATE TABLE [dbo].[tb_config] (
    [appl_id]     NVARCHAR (20) NOT NULL,
    [frm_id]      NVARCHAR (40) NOT NULL,
    [btn_key]     NVARCHAR (20) NOT NULL,
    [par_btn_key] NVARCHAR (20) NOT NULL,
    [cust_lvl]    INT           NOT NULL,
    [btn_posn]    NUMERIC (2)   NOT NULL,
    [btn_ena_flg] INT           NOT NULL,
    [btn_vis_flg] INT           NOT NULL,
    [grp_nam]     NVARCHAR (40) NULL,
    CONSTRAINT [tb_config_pk] PRIMARY KEY CLUSTERED ([appl_id] ASC, [frm_id] ASC, [btn_key] ASC, [par_btn_key] ASC, [cust_lvl] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains configuration data for all MCSToolbar buttons.  This data ties a btn_config entry to a MCSToolbar by application and form.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tb_config';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Associates this record to a specific application. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tb_config', @level2type = N'COLUMN', @level2name = N'appl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Associates this record to a specific form.  A value of LES applies it to all forms.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tb_config', @level2type = N'COLUMN', @level2name = N'frm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Points to a btn_config entry.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tb_config', @level2type = N'COLUMN', @level2name = N'btn_key';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Parent button key is this button is in toolbar button menu.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tb_config', @level2type = N'COLUMN', @level2name = N'par_btn_key';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows different customization levels for customer and project teams.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tb_config', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order of button in Toolbar', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tb_config', @level2type = N'COLUMN', @level2name = N'btn_posn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This defines whether the button is enabled initially.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tb_config', @level2type = N'COLUMN', @level2name = N'btn_ena_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This defines whether the button is visible initially.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tb_config', @level2type = N'COLUMN', @level2name = N'btn_vis_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tb_config', @level2type = N'COLUMN', @level2name = N'grp_nam';

