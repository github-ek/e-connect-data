CREATE TABLE [dbo].[wh_rpt_config] (
    [wh_id]            NVARCHAR (32)  NOT NULL,
    [rpt_id]           NVARCHAR (30)  NOT NULL,
    [def_printer]      NVARCHAR (200) NULL,
    [dig_sig_req_flg]  INT            NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [wh_rpt_config_pk] PRIMARY KEY CLUSTERED ([wh_id] ASC, [rpt_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [whrpt_digsigflg_ck] CHECK ([dig_sig_req_flg]=(0) OR [dig_sig_req_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is used to maintain Default Report Changes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_rpt_config';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse Identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_rpt_config', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Report Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_rpt_config', @level2type = N'COLUMN', @level2name = N'rpt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default Printer', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_rpt_config', @level2type = N'COLUMN', @level2name = N'def_printer';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag determines if the report is configured to capture digital signature. This flag will override the rpt_config setup.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_rpt_config', @level2type = N'COLUMN', @level2name = N'dig_sig_req_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inserted Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_rpt_config', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Updated Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_rpt_config', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inserted User Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_rpt_config', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Updated User Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_rpt_config', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

