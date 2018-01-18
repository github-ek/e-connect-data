CREATE TABLE [dbo].[sl_es_sap_wmmbid01] (
    [sl_es_sap_wmmbid01_seq] NUMERIC (12)  NOT NULL,
    [evt_id]                 NVARCHAR (30) NOT NULL,
    [es_sap_matnr]           NVARCHAR (30) NOT NULL,
    [es_sap_lgort]           NVARCHAR (30) NOT NULL,
    [es_sap_charg]           NVARCHAR (30) NOT NULL,
    [es_sap_umlgo]           NVARCHAR (30) NOT NULL,
    [es_sap_bwart]           NVARCHAR (30) NOT NULL,
    [es_sap_insmk]           NVARCHAR (30) NOT NULL,
    [es_sap_grund]           NVARCHAR (30) NOT NULL,
    [es_sap_ebeln]           NVARCHAR (30) NOT NULL,
    [es_sap_ebelp]           NVARCHAR (30) NOT NULL,
    [es_sap_kostl]           NVARCHAR (30) NOT NULL,
    [es_sap_tcode]           NVARCHAR (30) NOT NULL,
    [es_sap_erfmg]           NUMERIC (10)  NOT NULL,
    CONSTRAINT [sl_essapwmmbid01pk] PRIMARY KEY CLUSTERED ([sl_es_sap_wmmbid01_seq] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [sl_essapwmmbid01uk]
    ON [dbo].[sl_es_sap_wmmbid01]([evt_id] ASC, [es_sap_matnr] ASC, [es_sap_lgort] ASC, [es_sap_charg] ASC, [es_sap_umlgo] ASC, [es_sap_bwart] ASC, [es_sap_insmk] ASC, [es_sap_grund] ASC, [es_sap_ebeln] ASC, [es_sap_ebelp] ASC, [es_sap_kostl] ASC, [es_sap_tcode] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains SAP ''Goods Movements''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_wmmbid01';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ES SAP WMMBIDO1 sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_wmmbid01', @level2type = N'COLUMN', @level2name = N'sl_es_sap_wmmbid01_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Event name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_wmmbid01', @level2type = N'COLUMN', @level2name = N'evt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Material number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_wmmbid01', @level2type = N'COLUMN', @level2name = N'es_sap_matnr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Storage location', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_wmmbid01', @level2type = N'COLUMN', @level2name = N'es_sap_lgort';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Batch number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_wmmbid01', @level2type = N'COLUMN', @level2name = N'es_sap_charg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Storage location (deliver/ship)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_wmmbid01', @level2type = N'COLUMN', @level2name = N'es_sap_umlgo';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Movement types', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_wmmbid01', @level2type = N'COLUMN', @level2name = N'es_sap_bwart';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Storage types', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_wmmbid01', @level2type = N'COLUMN', @level2name = N'es_sap_insmk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Reason for movement', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_wmmbid01', @level2type = N'COLUMN', @level2name = N'es_sap_grund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Purchase order number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_wmmbid01', @level2type = N'COLUMN', @level2name = N'es_sap_ebeln';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Purchase order line item', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_wmmbid01', @level2type = N'COLUMN', @level2name = N'es_sap_ebelp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Cost center', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_wmmbid01', @level2type = N'COLUMN', @level2name = N'es_sap_kostl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'TCode', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_wmmbid01', @level2type = N'COLUMN', @level2name = N'es_sap_tcode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Quantity in unit of entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_wmmbid01', @level2type = N'COLUMN', @level2name = N'es_sap_erfmg';

