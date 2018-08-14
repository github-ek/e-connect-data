CREATE TABLE [dbo].[sl_es_sap_loc_map] (
    [dlx_sys_id]      NVARCHAR (30) DEFAULT (N'----') NOT NULL,
    [es_dlx_hst_loc]  NVARCHAR (25) DEFAULT (N'----') NOT NULL,
    [es_wms_stk_sts]  NVARCHAR (25) NOT NULL,
    [external_sys_id] NVARCHAR (30) DEFAULT (N'----') NOT NULL,
    [client_id]       NVARCHAR (32) DEFAULT (N'----') NOT NULL,
    [es_hst_loc]      NVARCHAR (25) NOT NULL,
    [es_hst_stk_sts]  NVARCHAR (25) NOT NULL,
    CONSTRAINT [sl_essaplocmappk] PRIMARY KEY CLUSTERED ([dlx_sys_id] ASC, [es_dlx_hst_loc] ASC, [es_wms_stk_sts] ASC, [external_sys_id] ASC, [client_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'External host status', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_loc_map', @level2type = N'COLUMN', @level2name = N'es_hst_stk_sts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'External host location', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_loc_map', @level2type = N'COLUMN', @level2name = N'es_hst_loc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_loc_map', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'External system name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_loc_map', @level2type = N'COLUMN', @level2name = N'external_sys_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Host status', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_loc_map', @level2type = N'COLUMN', @level2name = N'es_wms_stk_sts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'E2e host location', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_loc_map', @level2type = N'COLUMN', @level2name = N'es_dlx_hst_loc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'E2e system name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_loc_map', @level2type = N'COLUMN', @level2name = N'dlx_sys_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines location map of E2e system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_loc_map';

