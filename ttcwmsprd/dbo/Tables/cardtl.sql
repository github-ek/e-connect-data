CREATE TABLE [dbo].[cardtl] (
    [carcod]             NVARCHAR (10)   NOT NULL,
    [srvlvl]             NVARCHAR (10)   NOT NULL,
    [srvlvl_nam]         NVARCHAR (50)   NULL,
    [cartyp]             NVARCHAR (10)   NOT NULL,
    [unt_ins_val]        NUMERIC (19, 4) NULL,
    [rel_val]            NUMERIC (19, 4) NULL,
    [rel_val_unt_typ]    NVARCHAR (30)   NULL,
    [sddflg]             INT             NULL,
    [intl_flg]           INT             NULL,
    [fluid_load_flg]     INT             DEFAULT ((0)) NULL,
    [bundle_flg]         INT             NULL,
    [booking_rqd_flg]    INT             NULL,
    [mod_usr_id]         NVARCHAR (40)   NULL,
    [moddte]             DATETIME        NULL,
    [shp_stg_ovrd_flg]   INT             DEFAULT ((1)) NOT NULL,
    [single_pkg_shp_flg] INT             DEFAULT ((0)) NOT NULL,
    [max_wgt]            NUMERIC (19, 4) NULL,
    [max_vol]            NUMERIC (19, 4) NULL,
    [max_val]            NUMERIC (19, 4) NULL,
    [crncy_code]         NVARCHAR (4)    NULL,
    CONSTRAINT [cardtl_pk] PRIMARY KEY CLUSTERED ([carcod] ASC, [srvlvl] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [cardtl_bk_rqd_ck] CHECK ([booking_rqd_flg]=(0) OR [booking_rqd_flg]=(1)),
    CONSTRAINT [cardtl_bundle_ck] CHECK ([bundle_flg]=(0) OR [bundle_flg]=(1)),
    CONSTRAINT [cardtl_fldldg_ck] CHECK ([fluid_load_flg]=(0) OR [fluid_load_flg]=(1)),
    CONSTRAINT [cardtl_intl_flg_ck] CHECK ([intl_flg]=(0) OR [intl_flg]=(1)),
    CONSTRAINT [cardtl_sddflg_ck] CHECK ([sddflg]=(0) OR [sddflg]=(1)),
    CONSTRAINT [cardtl_single_pkg_shp_flg_chk] CHECK ([single_pkg_shp_flg]=(0) OR [single_pkg_shp_flg]=(1)),
    CONSTRAINT [cardtl_sovrdflg_ck] CHECK ([shp_stg_ovrd_flg]=(0) OR [shp_stg_ovrd_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The carrier detail is the table that defines the service levels carriers.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cardtl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carrier Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cardtl', @level2type = N'COLUMN', @level2name = N'carcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Level', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cardtl', @level2type = N'COLUMN', @level2name = N'srvlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Level Name - Descriptive name for service level.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cardtl', @level2type = N'COLUMN', @level2name = N'srvlvl_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carrier Type (T) Truck Load, (L) Less-than-Truckload (S) Small-Package.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cardtl', @level2type = N'COLUMN', @level2name = N'cartyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TM only) The insurable value of each release value unit.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cardtl', @level2type = N'COLUMN', @level2name = N'unt_ins_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TM only) The value for a release value basis, this value can be in any currencies.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cardtl', @level2type = N'COLUMN', @level2name = N'rel_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TM only) The unit basis for the release value.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cardtl', @level2type = N'COLUMN', @level2name = N'rel_val_unt_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether this carrier supports Saturday Delivery.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cardtl', @level2type = N'COLUMN', @level2name = N'sddflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether this carrier and this service level support international shipping.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cardtl', @level2type = N'COLUMN', @level2name = N'intl_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether fluid loading is allowed at Carrier level', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cardtl', @level2type = N'COLUMN', @level2name = N'fluid_load_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allow Bundling - Indicate if the carrier service level supports manifesting a load bundled of multiple cases.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cardtl', @level2type = N'COLUMN', @level2name = N'bundle_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicator that carrier moves created against the service level will require a booking before tendering', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cardtl', @level2type = N'COLUMN', @level2name = N'booking_rqd_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this flag is enabled, location override during deposit to ship staging locations is permitted for the carrier at the service level.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cardtl', @level2type = N'COLUMN', @level2name = N'shp_stg_ovrd_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether this carrier and service level does not use MPS, forcing Parcel to use single package shipments.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cardtl', @level2type = N'COLUMN', @level2name = N'single_pkg_shp_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum weight for carrier''s cartons', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cardtl', @level2type = N'COLUMN', @level2name = N'max_wgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum volume for carrier''s cartons', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cardtl', @level2type = N'COLUMN', @level2name = N'max_vol';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum cost for carrier''s cartons', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cardtl', @level2type = N'COLUMN', @level2name = N'max_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Currency Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cardtl', @level2type = N'COLUMN', @level2name = N'crncy_code';

