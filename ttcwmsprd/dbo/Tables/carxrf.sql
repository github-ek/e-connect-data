CREATE TABLE [dbo].[carxrf] (
    [carcod]           NVARCHAR (10) NOT NULL,
    [srvlvl]           NVARCHAR (10) NOT NULL,
    [dstnam]           NVARCHAR (30) NOT NULL,
    [dstcar]           NVARCHAR (30) NULL,
    [dstlvl]           NVARCHAR (40) NULL,
    [tax_id]           NVARCHAR (20) NULL,
    [meter_num]        NVARCHAR (20) NULL,
    [prcl_pkgtyp]      NVARCHAR (2)  NULL,
    [ground_flg]       INT           NULL,
    [spr_adr_id]       NVARCHAR (20) NULL,
    [cod_adr_id]       NVARCHAR (20) NULL,
    [serv_prnt_lblflg] INT           NULL,
    [traknm_type]      NVARCHAR (10) NULL,
    [service_type]     NVARCHAR (20) NULL,
    [srv_title]        NVARCHAR (30) NULL,
    [srv_icon]         NVARCHAR (3)  NULL,
    [par_carcod]       NVARCHAR (10) NULL,
    CONSTRAINT [carxrf_pk] PRIMARY KEY CLUSTERED ([carcod] ASC, [srvlvl] ASC, [dstnam] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [carxrf_groundflgck] CHECK ([ground_flg]=(0) OR [ground_flg]=(1)),
    CONSTRAINT [carxrf_s_p_l_flgck] CHECK ([serv_prnt_lblflg]=(0) OR [serv_prnt_lblflg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carrier cross reference table', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carxrf';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carrier Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carxrf', @level2type = N'COLUMN', @level2name = N'carcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Level', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carxrf', @level2type = N'COLUMN', @level2name = N'srvlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Destination Name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carxrf', @level2type = N'COLUMN', @level2name = N'dstnam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Destination Carrier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carxrf', @level2type = N'COLUMN', @level2name = N'dstcar';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Destination Level', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carxrf', @level2type = N'COLUMN', @level2name = N'dstlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tax ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carxrf', @level2type = N'COLUMN', @level2name = N'tax_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Meter Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carxrf', @level2type = N'COLUMN', @level2name = N'meter_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Parcel Package Type - used when manifesting packages to UPS', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carxrf', @level2type = N'COLUMN', @level2name = N'prcl_pkgtyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ground Flag', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carxrf', @level2type = N'COLUMN', @level2name = N'ground_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shipper Address Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carxrf', @level2type = N'COLUMN', @level2name = N'spr_adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'COD Address Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carxrf', @level2type = N'COLUMN', @level2name = N'cod_adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Server Prints Label Flag', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carxrf', @level2type = N'COLUMN', @level2name = N'serv_prnt_lblflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tracking Number Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carxrf', @level2type = N'COLUMN', @level2name = N'traknm_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carxrf', @level2type = N'COLUMN', @level2name = N'service_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Title - the service title that is printed on the UPS shipping label', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carxrf', @level2type = N'COLUMN', @level2name = N'srv_title';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Icon - the service icon that is printed on the UPS shipping label ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carxrf', @level2type = N'COLUMN', @level2name = N'srv_icon';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Parcel Carrier Code - This code indicates which account to bill to when the consignee has multiple accounts', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carxrf', @level2type = N'COLUMN', @level2name = N'par_carcod';

