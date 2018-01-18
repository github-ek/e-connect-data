CREATE TABLE [dbo].[car_ins] (
    [carcod]           NVARCHAR (10)   NOT NULL,
    [pol_num]          NVARCHAR (32)   NOT NULL,
    [provider_adr_id]  NVARCHAR (20)   NOT NULL,
    [max_coverage_amt] NUMERIC (19, 4) NULL,
    [ins_typ]          NVARCHAR (40)   NOT NULL,
    [shp_prov_cov_flg] INT             NOT NULL,
    [effdte]           DATETIME        NOT NULL,
    [expdte]           DATETIME        NULL,
    [u_version]        INT             NULL,
    [ins_dt]           DATETIME        NULL,
    [last_upd_dt]      DATETIME        NULL,
    [ins_user_id]      NVARCHAR (40)   NULL,
    [last_upd_user_id] NVARCHAR (40)   NULL,
    CONSTRAINT [car_ins_pk] PRIMARY KEY CLUSTERED ([carcod] ASC, [pol_num] ASC, [provider_adr_id] ASC, [ins_typ] ASC, [effdte] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [shp_prov_cov_flgck] CHECK ([shp_prov_cov_flg]=(0) OR [shp_prov_cov_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carrier''s Insurance policy information.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_ins';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(PK,FK,Required) Carrier Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_ins', @level2type = N'COLUMN', @level2name = N'carcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(PK,Required) policy number of insurance policy', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_ins', @level2type = N'COLUMN', @level2name = N'pol_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(PK,FK,Required) provider address info (foreign key to adrmst table)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_ins', @level2type = N'COLUMN', @level2name = N'provider_adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'maximum monetary amount of insurance coverage under this policy', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_ins', @level2type = N'COLUMN', @level2name = N'max_coverage_amt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(PK,Required) The Type of the insurance policy', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_ins', @level2type = N'COLUMN', @level2name = N'ins_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(Required) Shipper self Provided Insurance Coverage', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_ins', @level2type = N'COLUMN', @level2name = N'shp_prov_cov_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(PK,Required)Effective Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_ins', @level2type = N'COLUMN', @level2name = N'effdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'expiration date of coverage under this policy', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_ins', @level2type = N'COLUMN', @level2name = N'expdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'System generated user version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_ins', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the constraint was created.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_ins', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the constraint was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_ins', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of the user who created the contraint.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_ins', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of the user who last updated the constraint', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_ins', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

