CREATE TABLE [dbo].[sl_es_sap_stk_sts] (
    [es_hst_stk_sts]  NVARCHAR (25) NOT NULL,
    [es_hst_adj_typ]  NVARCHAR (25) NOT NULL,
    [external_sys_id] NVARCHAR (30) DEFAULT (N'----') NOT NULL,
    [client_id]       NVARCHAR (32) DEFAULT (N'----') NOT NULL,
    [es_hst_mov_typ]  NVARCHAR (25) NOT NULL,
    CONSTRAINT [sl_essapstkstspk] PRIMARY KEY CLUSTERED ([es_hst_stk_sts] ASC, [es_hst_adj_typ] ASC, [external_sys_id] ASC, [client_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines stock bucket of E2e system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_stk_sts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stock bucket', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_stk_sts', @level2type = N'COLUMN', @level2name = N'es_hst_stk_sts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Adjustment type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_stk_sts', @level2type = N'COLUMN', @level2name = N'es_hst_adj_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'External system name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_stk_sts', @level2type = N'COLUMN', @level2name = N'external_sys_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_stk_sts', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Movement type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_stk_sts', @level2type = N'COLUMN', @level2name = N'es_hst_mov_typ';

