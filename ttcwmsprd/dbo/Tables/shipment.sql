CREATE TABLE [dbo].[shipment] (
    [ship_id]           NVARCHAR (30)   NOT NULL,
    [wh_id]             NVARCHAR (32)   NULL,
    [host_client_id]    NVARCHAR (32)   NULL,
    [host_ext_id]       NVARCHAR (40)   NULL,
    [shpsts]            NVARCHAR (1)    NULL,
    [stop_id]           NVARCHAR (10)   NULL,
    [rt_adr_id]         NVARCHAR (20)   NOT NULL,
    [cargrp]            NVARCHAR (10)   NULL,
    [carcod]            NVARCHAR (10)   NULL,
    [srvlvl]            NVARCHAR (10)   NULL,
    [sddflg]            INT             NULL,
    [doc_num]           NVARCHAR (20)   NULL,
    [track_num]         NVARCHAR (20)   NULL,
    [mst_waybill]       NVARCHAR (60)   NULL,
    [frtchg]            NVARCHAR (1)    NULL,
    [frtcod]            NVARCHAR (6)    NULL,
    [frtrte]            NUMERIC (19, 4) NULL,
    [adddte]            DATETIME        NOT NULL,
    [alcdte]            DATETIME        NULL,
    [stgdte]            DATETIME        NULL,
    [loddte]            DATETIME        NULL,
    [entdte]            DATETIME        NOT NULL,
    [early_shpdte]      DATETIME        NULL,
    [late_shpdte]       DATETIME        NULL,
    [early_dlvdte]      DATETIME        NULL,
    [late_dlvdte]       DATETIME        NULL,
    [dstare]            NVARCHAR (10)   NULL,
    [dstloc]            NVARCHAR (20)   NULL,
    [rrlflg]            INT             NULL,
    [wave_set]          NVARCHAR (10)   NULL,
    [tms_group_id]      NVARCHAR (10)   NULL,
    [tms_move_id]       NVARCHAR (10)   NULL,
    [tms_move_plan_id]  NVARCHAR (16)   NULL,
    [lst_prtdte]        DATETIME        NULL,
    [super_ship_id]     NVARCHAR (30)   NULL,
    [super_ship_flg]    INT             DEFAULT ((0)) NULL,
    [in_transit_flg]    INT             DEFAULT ((0)) NULL,
    [pln_shpsts]        NVARCHAR (40)   NULL,
    [ses_grp_nam]       NVARCHAR (40)   NULL,
    [optm_base_cost]    NUMERIC (19, 4) NULL,
    [rate_serv_nam]     NVARCHAR (40)   NULL,
    [arcdte]            DATETIME        NULL,
    [arc_src]           NVARCHAR (30)   NULL,
    [lbl_prtdte]        DATETIME        NULL,
    [ses_tag]           NVARCHAR (40)   NULL,
    [price_sts]         NVARCHAR (40)   NULL,
    [src_sys]           NVARCHAR (40)   NULL,
    [par_ship_id]       NVARCHAR (30)   NULL,
    [hub_adr_id]        NVARCHAR (20)   NULL,
    [hub_arrdte]        DATETIME        NULL,
    [zs_line_haul_id]   NVARCHAR (10)   NULL,
    [hub_rate_serv_nam] NVARCHAR (40)   NULL,
    [tot_pkg_qty]       INT             NULL,
    [crncy_code]        NVARCHAR (4)    NULL,
    [aesitn]            NVARCHAR (40)   NULL,
    [aes_typ]           NVARCHAR (10)   NULL,
    [aes_acpt_dte]      DATETIME        NULL,
    [ftsrnum]           NVARCHAR (40)   NULL,
    [export_typ]        NVARCHAR (40)   NULL,
    [docind]            NVARCHAR (10)   NULL,
    [descgoods]         NVARCHAR (50)   NULL,
    [exprsntxt]         NVARCHAR (50)   NULL,
    [pack_code]         INT             NULL,
    [pln_cmpl_flg]      INT             DEFAULT ((0)) NOT NULL,
    [dispatch_code]     NVARCHAR (30)   NULL,
    [moddte]            DATETIME        NULL,
    [mod_usr_id]        NVARCHAR (40)   NULL,
    [book_num]          NVARCHAR (12)   NULL,
    CONSTRAINT [shipment_pk] PRIMARY KEY CLUSTERED ([ship_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [shipment_rrlflg_ck] CHECK ([rrlflg]=(0) OR [rrlflg]=(1)),
    CONSTRAINT [shipment_sddflg_ck] CHECK ([sddflg]=(0) OR [sddflg]=(1)),
    CONSTRAINT [shp_in_trn_flg_ck] CHECK ([in_transit_flg]=(0) OR [in_transit_flg]=(1)),
    CONSTRAINT [shp_plncmpl_ck] CHECK ([pln_cmpl_flg]=(0) OR [pln_cmpl_flg]=(1)),
    CONSTRAINT [shp_sup_shp_flg_ck] CHECK ([super_ship_flg]=(0) OR [super_ship_flg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [shipment_idx1]
    ON [dbo].[shipment]([shpsts] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [shipment_idx2]
    ON [dbo].[shipment]([host_ext_id] ASC, [host_client_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [shipment_idx3]
    ON [dbo].[shipment]([zs_line_haul_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [shipment_idx4]
    ON [dbo].[shipment]([rt_adr_id] ASC, [shpsts] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [shipment_alcdte]
    ON [dbo].[shipment]([alcdte] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [shipment_stgdte]
    ON [dbo].[shipment]([stgdte] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [shipment_stop]
    ON [dbo].[shipment]([stop_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines the shipments in the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shipment Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'ship_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Host Client Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'host_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Host External Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'host_ext_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ship Status', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'shpsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stop Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'stop_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Route-to Address Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'rt_adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carrier Group', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'cargrp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carrier Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'carcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Level', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'srvlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Saturday Delivery Flag', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'sddflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Document Number - The document number for any paperwork (bill of lading)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'doc_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tracking Number - The tracking number for any paperwork', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'track_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Master waybill number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'mst_waybill';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Freight Charge', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'frtchg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Freight Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'frtcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Freight Rate', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'frtrte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allocation Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'alcdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Staged Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'stgdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Loaded Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'loddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date Entered', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'entdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Early Ship Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'early_shpdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Late Ship Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'late_shpdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Early Delivery Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'early_dlvdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Late Delivery Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'late_dlvdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Destination Area', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'dstare';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Destination Location', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'dstloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Release Remaining Lines Flag', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'rrlflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Wave Set', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'wave_set';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'TMS Group Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'tms_group_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'TMS Carrier Move ID for LTL shipments actuals transaction to planned carrier move within TMS', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'tms_move_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'TMS Move Plan ID for LTL shipments actuals transaction to planned carrier move within TMS', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'tms_move_plan_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Super Shipment Id - If this shipment was planned into a super shipment, this is the super shipment identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'super_ship_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'In Transit Flag.  Specifies if the shipment is currently enroute to a customer.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'in_transit_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Planning Status of this shipment (only for use by TM.)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'pln_shpsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to indicate the application group that owns this shipment (only for use by TM.)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'ses_grp_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The basis cost to ship this shipment regardless.  It could would be lesser of the standard TL and LTL service.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'optm_base_cost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Rating service name of the optimization basis cost.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'rate_serv_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Archive Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'arcdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Archive Source', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'arc_src';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Label Print date. It is used in processing super shipment to see if the labels for the child shipment have been printed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'lbl_prtdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to a shipment within an application group, so that a new session does not need to be made to run the group multiple times (only for use by TM.)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'ses_tag';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This indicates the price status for the shipment.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'price_sts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to identify the source system of the shipment', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'src_sys';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Original shipment Id for cloned shipment', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'par_ship_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'FK (tm_adrmst) Hub Address. Only used for TM', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'hub_adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date that arrives at hub. Only used for TM', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'hub_arrdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to indicate which carrier move this shipment belongs to. Only used for TM', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'zs_line_haul_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'FK (tm_rate_serv) The rating service name used for this shipment provided by hub. Only used for TM', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'hub_rate_serv_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(PARCEL related) Total number of packages', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'tot_pkg_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Currency Code for the Currency fields in the table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'crncy_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'AES Internal Transaction Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'aesitn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'AES Type - Typically can be one of PRE(Pre Shipment) or POST(Post Shipment) or DOWN(AES server is down).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'aes_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'AES Accepted Date - Used for AES Type of PRE where we give the date of AES Acceptance.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'aes_acpt_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign Trade Statistics Regulations Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'ftsrnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'International shipment documentation option required for manifesting international packages using some transnational carriers. The valid values are provided by the Parcel system for each carrier. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'export_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(PARCEL) Document indicator - specifies if the shipment is a letter, document or non-document shipment.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'docind';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(PARCEL) Description of Goods', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'descgoods';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(PARCEL) Reason for Export', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'exprsntxt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The BTO Packing Code determines how a BTO order should be picked and packed into containers.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'pack_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag is set to true when no additional lines are going to be added to the shipment. However, it does not prevent lines from being added to the shipment.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'pln_cmpl_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The code represent the item commodities that are contained in the shipment.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'dispatch_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date Last Modified', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Modified By', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Federal Express Freight Booking Number, typically used when shipping large packages over 150 pounds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment', @level2type = N'COLUMN', @level2name = N'book_num';

