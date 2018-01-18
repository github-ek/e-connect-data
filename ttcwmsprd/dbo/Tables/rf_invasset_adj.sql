CREATE TABLE [dbo].[rf_invasset_adj] (
    [devcod]           NVARCHAR (20) NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [lodnum]           NVARCHAR (30) NULL,
    [asset_num]        NVARCHAR (30) NULL,
    [asset_typ]        NVARCHAR (30) NULL,
    [asset_stat]       NVARCHAR (15) NULL,
    [client_id]        NVARCHAR (32) NULL,
    [src_adr_id]       NVARCHAR (20) NULL,
    [adr_id]           NVARCHAR (20) NULL,
    [idnqty]           INT           NOT NULL,
    [asset_id]         NVARCHAR (30) NULL,
    [asset_tag]        NVARCHAR (40) NULL,
    [ser_num]          NVARCHAR (40) NULL,
    [man_id]           NVARCHAR (20) NULL,
    [model]            NVARCHAR (20) NULL,
    [purch_dte]        DATETIME      NULL,
    [warranty_dte]     DATETIME      NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    [rowid]            INT           IDENTITY (1, 1) NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [rf_invastadj_rowid]
    ON [dbo].[rf_invasset_adj]([rowid] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [rf_invassetcmp_idx]
    ON [dbo].[rf_invasset_adj]([devcod] ASC, [wh_id] ASC, [lodnum] ASC, [asset_num] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Temporarily holds information of non-empty serialized/non-serialized assets associated with inventory in which Identify/Adjustment operations need and once completed, processed entries are removed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_invasset_adj';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Device Code - The unique identifier for the device.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_invasset_adj', @level2type = N'COLUMN', @level2name = N'devcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_invasset_adj', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_invasset_adj', @level2type = N'COLUMN', @level2name = N'lodnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Type - Identifies the asset type for the subloads.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_invasset_adj', @level2type = N'COLUMN', @level2name = N'asset_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Status - Used for reporting purpose. Typical possible values are ACT (active) and INACT (inactive).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_invasset_adj', @level2type = N'COLUMN', @level2name = N'asset_stat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique asset client identifier .', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_invasset_adj', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Source Address ID - This is the address ID which maps to the warehouse that is concerned about tracking the serialized asset.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_invasset_adj', @level2type = N'COLUMN', @level2name = N'src_adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Address ID of the current asset''s location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_invasset_adj', @level2type = N'COLUMN', @level2name = N'adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Id - An unique identifier for the asset.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_invasset_adj', @level2type = N'COLUMN', @level2name = N'asset_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Tag - Typicallly a unique RFID identifier but can also be used as a Barcode unique identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_invasset_adj', @level2type = N'COLUMN', @level2name = N'asset_tag';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Serial Number - Serial number of the asset.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_invasset_adj', @level2type = N'COLUMN', @level2name = N'ser_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Manufacturer ID - Identifies the asset manufacturer.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_invasset_adj', @level2type = N'COLUMN', @level2name = N'man_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Model Number - Identifies the model numbers for the asset.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_invasset_adj', @level2type = N'COLUMN', @level2name = N'model';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date and time at which an asset was purchased.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_invasset_adj', @level2type = N'COLUMN', @level2name = N'purch_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date and time at which the warranty for an asset expires.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_invasset_adj', @level2type = N'COLUMN', @level2name = N'warranty_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_invasset_adj', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_invasset_adj', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_invasset_adj', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_invasset_adj', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

