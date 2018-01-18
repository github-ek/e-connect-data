CREATE TABLE [dbo].[ser_asset] (
    [asset_id]         NVARCHAR (30) NOT NULL,
    [asset_typ]        NVARCHAR (30) NOT NULL,
    [src_adr_id]       NVARCHAR (20) NOT NULL,
    [adr_id]           NVARCHAR (20) NOT NULL,
    [asset_tag]        NVARCHAR (40) NULL,
    [asset_stat]       NVARCHAR (15) DEFAULT (N'ACT') NOT NULL,
    [client_id]        NVARCHAR (32) NOT NULL,
    [warranty_dte]     DATETIME      NULL,
    [purch_dte]        DATETIME      NULL,
    [man_id]           NVARCHAR (20) NULL,
    [model]            NVARCHAR (20) NULL,
    [ser_num]          NVARCHAR (40) NULL,
    [roll_call_flg]    INT           DEFAULT ((0)) NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [ser_asset_pk] PRIMARY KEY CLUSTERED ([asset_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [serasset_roll_flg] CHECK ([roll_call_flg]=(0) OR [roll_call_flg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [serast_asset_tag]
    ON [dbo].[ser_asset]([asset_tag] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The serialized asset  is the table that is used to maintain the serialized assets.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_asset';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Id- A unique identifier for an asset.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_asset', @level2type = N'COLUMN', @level2name = N'asset_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Type - This field groups assets based on common traits such as the dimensions, weight, manufacture, etc.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_asset', @level2type = N'COLUMN', @level2name = N'asset_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Source Address ID - This is the address ID which maps to the warehouse that is concerned about tracking the serialized asset.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_asset', @level2type = N'COLUMN', @level2name = N'src_adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Address ID of the current asset''s location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_asset', @level2type = N'COLUMN', @level2name = N'adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Tag - Typicallly a unique RFID identifier but can also be used as a Barcode unique identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_asset', @level2type = N'COLUMN', @level2name = N'asset_tag';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Status - Used for reporting purpose. Typical possible values are ACT (active) and INACT (inactive).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_asset', @level2type = N'COLUMN', @level2name = N'asset_stat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique asset client identifier .', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_asset', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date and time at which the warranty for an asset expires .', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_asset', @level2type = N'COLUMN', @level2name = N'warranty_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date and time at which an asset was purchased.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_asset', @level2type = N'COLUMN', @level2name = N'purch_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Manufacture ID - Identifies where the asset is manufactured.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_asset', @level2type = N'COLUMN', @level2name = N'man_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Model Number - Identifies the model numbers for the asset.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_asset', @level2type = N'COLUMN', @level2name = N'model';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Serial Number - Serial number of the asset.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_asset', @level2type = N'COLUMN', @level2name = N'ser_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Roll Call Flag - This field is used when a roll call is started and it will indicate assets that haven''t been found yet.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_asset', @level2type = N'COLUMN', @level2name = N'roll_call_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_asset', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_asset', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_asset', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_asset', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

