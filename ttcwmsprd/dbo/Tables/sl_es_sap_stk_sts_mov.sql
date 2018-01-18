CREATE TABLE [dbo].[sl_es_sap_stk_sts_mov] (
    [es_hst_frm_stk_sts] NVARCHAR (25) NOT NULL,
    [es_hst_to_stk_sts]  NVARCHAR (25) NOT NULL,
    [external_sys_id]    NVARCHAR (30) DEFAULT (N'----') NOT NULL,
    [client_id]          NVARCHAR (32) DEFAULT (N'----') NOT NULL,
    [es_hst_mov_typ]     NVARCHAR (25) NOT NULL,
    CONSTRAINT [sl_ssapstkstsmovpk] PRIMARY KEY CLUSTERED ([es_hst_frm_stk_sts] ASC, [es_hst_to_stk_sts] ASC, [external_sys_id] ASC, [client_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines stock bucket movement.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_stk_sts_mov';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'From stock bucket', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_stk_sts_mov', @level2type = N'COLUMN', @level2name = N'es_hst_frm_stk_sts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'To stock bucket', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_stk_sts_mov', @level2type = N'COLUMN', @level2name = N'es_hst_to_stk_sts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'External system name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_stk_sts_mov', @level2type = N'COLUMN', @level2name = N'external_sys_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_stk_sts_mov', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Movement type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_stk_sts_mov', @level2type = N'COLUMN', @level2name = N'es_hst_mov_typ';

