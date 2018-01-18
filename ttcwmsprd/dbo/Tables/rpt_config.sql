CREATE TABLE [dbo].[rpt_config] (
    [rpt_id]          NVARCHAR (30)  NOT NULL,
    [prod_id]         NVARCHAR (10)  NULL,
    [rpt_layout_file] NVARCHAR (200) NOT NULL,
    [def_printer]     NVARCHAR (200) NULL,
    [rpt_typ]         NVARCHAR (4)   NOT NULL,
    [keep_days]       INT            NULL,
    [ena_ems_flg]     INT            NULL,
    [dig_sig_req_flg] INT            NULL,
    [ems_evt_nam]     NVARCHAR (30)  NULL,
    [func_area]       NVARCHAR (20)  NULL,
    [grp_nam]         NVARCHAR (40)  NULL,
    CONSTRAINT [rpt_config_pk] PRIMARY KEY CLUSTERED ([rpt_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [rpt_digsigflg_ck] CHECK ([dig_sig_req_flg]=(0) OR [dig_sig_req_flg]=(1)),
    CONSTRAINT [rptcfg_enaemsflgck] CHECK ([ena_ems_flg]=(0) OR [ena_ems_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is used to maintain Report Changes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpt_config';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Report ID - The report identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpt_config', @level2type = N'COLUMN', @level2name = N'rpt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Product ID -  The product identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpt_config', @level2type = N'COLUMN', @level2name = N'prod_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Report Layout File ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpt_config', @level2type = N'COLUMN', @level2name = N'rpt_layout_file';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default Printer -Holds the default printer for this particular Report.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpt_config', @level2type = N'COLUMN', @level2name = N'def_printer';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Report Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpt_config', @level2type = N'COLUMN', @level2name = N'rpt_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Number of days to Archive', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpt_config', @level2type = N'COLUMN', @level2name = N'keep_days';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Enable EMS', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpt_config', @level2type = N'COLUMN', @level2name = N'ena_ems_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag determines if the report is configured for digital signature capture. We need this flag to support the scenario where users can have the signature details configured for a report and can turn off this feature using this flag.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpt_config', @level2type = N'COLUMN', @level2name = N'dig_sig_req_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ems_evt_nam', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpt_config', @level2type = N'COLUMN', @level2name = N'ems_evt_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Functional Area', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpt_config', @level2type = N'COLUMN', @level2name = N'func_area';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Group Name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpt_config', @level2type = N'COLUMN', @level2name = N'grp_nam';

