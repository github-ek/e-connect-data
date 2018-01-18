CREATE TABLE [dbo].[manfst] (
    [crtnid]              NVARCHAR (30)   NOT NULL,
    [wh_id]               NVARCHAR (32)   NOT NULL,
    [mfsmsn]              NVARCHAR (10)   NULL,
    [ship_id]             NVARCHAR (30)   NULL,
    [client_id]           NVARCHAR (32)   NULL,
    [ordnum]              NVARCHAR (35)   NULL,
    [wrkref]              NVARCHAR (12)   NULL,
    [wrkref_dtl]          NVARCHAR (15)   NULL,
    [dtlnum]              NVARCHAR (30)   NULL,
    [subnum]              NVARCHAR (30)   NULL,
    [prtnum]              NVARCHAR (50)   NULL,
    [prt_client_id]       NVARCHAR (32)   NULL,
    [carcod]              NVARCHAR (10)   NULL,
    [srvlvl]              NVARCHAR (10)   NULL,
    [traknm]              NVARCHAR (60)   NULL,
    [artecd]              NVARCHAR (15)   NULL,
    [hubcod]              NVARCHAR (10)   NULL,
    [frtrte]              NUMERIC (19, 4) NULL,
    [weight]              NUMERIC (19, 4) NULL,
    [mansts]              NVARCHAR (1)    NULL,
    [mfstid]              NVARCHAR (20)   NULL,
    [mancls]              NVARCHAR (30)   NULL,
    [shpdte]              DATETIME        NULL,
    [mstdte]              DATETIME        NULL,
    [cfmdte]              DATETIME        NULL,
    [poddte]              DATETIME        NULL,
    [podnum]              NVARCHAR (30)   NULL,
    [astra_bar_code]      NVARCHAR (32)   NULL,
    [address_bar_code]    NVARCHAR (26)   NULL,
    [dim_weight_info_flg] INT             NULL,
    [delivery_day]        NVARCHAR (3)    NULL,
    [fdx_dlv]             NVARCHAR (7)    NULL,
    [base_frtrte]         NUMERIC (19, 4) NULL,
    [dstnam]              NVARCHAR (30)   NULL,
    [usrfld1]             NVARCHAR (250)  NULL,
    [usrfld2]             NVARCHAR (250)  NULL,
    [usrfld3]             NVARCHAR (250)  NULL,
    [usrfld4]             NVARCHAR (250)  NULL,
    [lodnum]              NVARCHAR (30)   NULL,
    [reslv_flg]           INT             DEFAULT ((0)) NOT NULL,
    CONSTRAINT [manfst_pk] PRIMARY KEY CLUSTERED ([crtnid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [mfst_dimwgtinflgck] CHECK ([dim_weight_info_flg]=(0) OR [dim_weight_info_flg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [manfst_wrkref_dtl]
    ON [dbo].[manfst]([wrkref_dtl] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [manfst_lodnum]
    ON [dbo].[manfst]([lodnum] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [manfst_subnum]
    ON [dbo].[manfst]([subnum] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [manfst_wrkref]
    ON [dbo].[manfst]([wrkref] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [manfst_ship_id]
    ON [dbo].[manfst]([ship_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [manfst_mfsmsn]
    ON [dbo].[manfst]([mfsmsn] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [manfst_mfstid]
    ON [dbo].[manfst]([mfstid] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [mfst_carcod_mfstid]
    ON [dbo].[manfst]([carcod] ASC, [mfstid] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [manfst_traknm]
    ON [dbo].[manfst]([traknm] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [manfst_wh_id]
    ON [dbo].[manfst]([wh_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The manfst table is used to store manifesting information', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Manifest Sequence Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'mfsmsn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shipment Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'ship_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'ordnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Work Reference', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'wrkref';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pick Work Detail ID - The unique identifier of the pick work detail record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'wrkref_dtl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Piece Identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'dtlnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Case Identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'subnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Client Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carrier Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'carcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Level', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'srvlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tracking Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'traknm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Airport Routing Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'artecd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hub Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'hubcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Freight Rate', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'frtrte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Freight Weight', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'weight';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Manifest Status', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'mansts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Manifest Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'mfstid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Parcel Sytstem Manifest Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'mancls';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shipped Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'shpdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Manifest Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'mstdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirmation Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'cfmdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Proof of Delivery Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'poddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Proof of Delivery Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'podnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Astra Bar Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'astra_bar_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Address Bar Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'address_bar_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Dimension Weight', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'dim_weight_info_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Delivery Day', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'delivery_day';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'FedEx Delivery Date (DDMmmyy)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'fdx_dlv';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Base Freight Rate', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'base_frtrte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Destination Name. This refers to the parcel manifesting system that the package is being manifested against.  This can be Tandata, Fascor or Fedex.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'dstnam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User Field 1. This houses the first user field returned from the manifesting system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'usrfld1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User Field 2. This houses the second user field returned from the manifesting system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'usrfld2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User Field 3. This houses the third user field returned from the manifesting system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'usrfld3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User Field 3. This houses the fourth user field returned from the manifesting system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'usrfld4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load Number. Indicate the load that was manifested. The load must be a bundled load.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'lodnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether this package''s shipment has been resolved.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'manfst', @level2type = N'COLUMN', @level2name = N'reslv_flg';

