CREATE TABLE [dbo].[distro] (
    [distro_id]             NVARCHAR (35) NOT NULL,
    [wh_id]                 NVARCHAR (32) NOT NULL,
    [client_id]             NVARCHAR (32) NOT NULL,
    [source_distro_id]      NVARCHAR (35) NULL,
    [source_wh]             NVARCHAR (32) NULL,
    [source_wh_host_ext_id] NVARCHAR (40) NULL,
    [prtnum]                NVARCHAR (50) NOT NULL,
    [prt_client_id]         NVARCHAR (32) NOT NULL,
    [invsts_prg]            NVARCHAR (4)  NOT NULL,
    [lotnum]                NVARCHAR (25) NULL,
    [orgcod]                NVARCHAR (25) NULL,
    [distro_typ]            NVARCHAR (40) NULL,
    [ordtyp]                NVARCHAR (4)  NOT NULL,
    [revlvl]                NVARCHAR (25) NULL,
    [dept_cod]              NVARCHAR (5)  NULL,
    [promo_cod]             NVARCHAR (5)  NULL,
    [prcpri]                INT           NOT NULL,
    [untqty]                INT           NOT NULL,
    [appqty]                INT           NOT NULL,
    [rtcust]                NVARCHAR (20) NOT NULL,
    [rt_adr_id]             NVARCHAR (20) NOT NULL,
    [btcust]                NVARCHAR (20) NOT NULL,
    [bt_adr_id]             NVARCHAR (20) NOT NULL,
    [stcust]                NVARCHAR (20) NOT NULL,
    [st_adr_id]             NVARCHAR (20) NOT NULL,
    [early_shpdte]          DATETIME      NULL,
    [late_shpdte]           DATETIME      NULL,
    [early_dlvdte]          DATETIME      NULL,
    [late_dlvdte]           DATETIME      NULL,
    [close_usr_id]          NVARCHAR (40) NULL,
    [close_dte]             DATETIME      NULL,
    [trknum]                NVARCHAR (20) NULL,
    [invnum]                NVARCHAR (35) NOT NULL,
    [supnum]                NVARCHAR (32) NOT NULL,
    [invlin]                NVARCHAR (10) NOT NULL,
    [invsln]                NVARCHAR (10) NOT NULL,
    [allow_ovrshpflg]       INT           DEFAULT ((1)) NULL,
    [sto_alc_flg]           INT           DEFAULT ((0)) NULL,
    [ins_dt]                DATETIME      NULL,
    [last_upd_dt]           DATETIME      NULL,
    [ins_user_id]           NVARCHAR (40) NULL,
    [last_upd_user_id]      NVARCHAR (40) NULL,
    CONSTRAINT [distro_pk] PRIMARY KEY CLUSTERED ([distro_id] ASC, [wh_id] ASC, [client_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [dis_allow_ovr_ck] CHECK ([allow_ovrshpflg]=(0) OR [allow_ovrshpflg]=(1)),
    CONSTRAINT [dis_stoalcflg_ck] CHECK ([sto_alc_flg]=(0) OR [sto_alc_flg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [distro_idx2]
    ON [dbo].[distro]([revlvl] ASC, [orgcod] ASC, [lotnum] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [distro_idx1]
    ON [dbo].[distro]([trknum] ASC, [supnum] ASC, [invnum] ASC, [invlin] ASC, [invsln] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The distro table defines distribution attributes', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Distro Identifer', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'distro_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse Identifier - The warehouse from which this distribution is to be allocated/processed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client Id - The client for which this distribution is to be allocated/processed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Distribution Identifier - system-generated or user-entered unique identifier for this distribution record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'source_distro_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Source Warehouse - Source warehouse that created the distribution for merge and transit.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'source_wh';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Source Warehouse Host External Id - Source warehouse address''s name that created the distribution for merge and transit', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'source_wh_host_ext_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Client Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Status Progression', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'invsts_prg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lot Number - defaults to ''----'' if not specified.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Origin Code - defaults to ''----'' if not specified.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'orgcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Distribution Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'distro_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'ordtyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Revision Level - defaults to ''----'' if not specified.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'revlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Department Code - defaults to the department code value from the item master.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'dept_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Promotion Code - an attribute that may be assigned to this distribution for filtering and selection.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'promo_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Distribution Processing Priority - the priority used for selection and processing of this distro. This value is defaulted from the store information and may be modified.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'prcpri';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Quantity - Quantity of the distro that is expected to be shipped to this store.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'untqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Applied Quantity - quantity that has been received/and or picked for this distro.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'appqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Route-to Customer - the ''customer'' or Hub facility where the inventory for this distro will be sent before being distributed to the store. This value is defaulted from the store information and may be be modified.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'rtcust';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Route-to Address ID - Address of the Hub facility where the inventory for this distro will be sent before being distributed to the store. This value is defaulted from the store information and may be be modified.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'rt_adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Bill-to Customer - the customer or facility that may be billed for this distro''s inventory. This value is defaulted from the store information and may be be modified.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'btcust';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Bill-to Address ID - Address of the customer or facility that may be billed for this distro''s inventory. This value is defaulted on the distro and maybe be modified or over-ridden for individual distros.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'bt_adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ship-To Customer - The cstnum which is the store address.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'stcust';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ship-To Address ID - The address id of the Ship-To Customer.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'st_adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Early Shipment Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'early_shpdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Late Shipment Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'late_shpdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Early Delivery Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'early_dlvdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Late Delivery Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'late_dlvdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Closed User Id - the user that closed the distro.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'close_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Closed Date - Date and Time the distro was closed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'close_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Truck Number - The invoice''s truck number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'trknum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Invoice Number - The invoice number used for this distro.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'invnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Supplier Number - The supplier number used for this distro.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'supnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Invoice Line Number - The invoice line number used for this distro.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'invlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Invoice Subline Number - Only applies if the inventory activity is for a receipt.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'invsln';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates this distribution can ship more than planned.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'allow_ovrshpflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicate if distribution is allowed to allocate inventory from storage area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'sto_alc_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

