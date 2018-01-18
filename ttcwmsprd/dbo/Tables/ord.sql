CREATE TABLE [dbo].[ord] (
    [client_id]         NVARCHAR (32)   NOT NULL,
    [ordnum]            NVARCHAR (35)   NOT NULL,
    [wh_id]             NVARCHAR (32)   NOT NULL,
    [btcust]            NVARCHAR (20)   NULL,
    [stcust]            NVARCHAR (20)   NULL,
    [rtcust]            NVARCHAR (20)   NULL,
    [brcust]            NVARCHAR (20)   NULL,
    [bt_adr_id]         NVARCHAR (20)   NULL,
    [st_adr_id]         NVARCHAR (20)   NULL,
    [rt_adr_id]         NVARCHAR (20)   NULL,
    [br_adr_id]         NVARCHAR (20)   NULL,
    [ordtyp]            NVARCHAR (4)    NOT NULL,
    [entdte]            DATETIME        NOT NULL,
    [adddte]            DATETIME        NULL,
    [cpotyp]            NVARCHAR (20)   NULL,
    [cponum]            NVARCHAR (30)   NULL,
    [cpodte]            DATETIME        NULL,
    [srv_type]          NVARCHAR (2)    NULL,
    [paytrm]            NVARCHAR (30)   NULL,
    [carflg]            INT             NULL,
    [shipby]            NVARCHAR (10)   NULL,
    [rrlflg]            INT             NULL,
    [wave_flg]          INT             DEFAULT ((0)) NULL,
    [requir_tms_flg]    INT             NULL,
    [rmanum]            NVARCHAR (30)   NULL,
    [super_ord_flg]     INT             DEFAULT ((0)) NULL,
    [super_ordnum]      NVARCHAR (35)   NULL,
    [ord_frtrte]        NUMERIC (19, 4) NULL,
    [bco_flg]           INT             NULL,
    [sig_req_flg]       INT             NULL,
    [bill_freight_flg]  INT             NULL,
    [customs_clr_flg]   INT             NULL,
    [cod_ind_type]      INT             NULL,
    [cod_payment_type]  NVARCHAR (20)   NULL,
    [payment_type]      NVARCHAR (30)   NULL,
    [sfcust]            NVARCHAR (20)   NULL,
    [sf_adr_id]         NVARCHAR (20)   NULL,
    [csr_nam]           NVARCHAR (256)  NULL,
    [csr_phnnum]        NVARCHAR (40)   NULL,
    [csr_email_adr]     NVARCHAR (40)   NULL,
    [bus_grp]           NVARCHAR (40)   NULL,
    [host_appt_num]     NVARCHAR (40)   NULL,
    [dlv_contact]       NVARCHAR (256)  NULL,
    [ord_dir]           NVARCHAR (40)   NULL,
    [frt_allow]         NUMERIC (19, 4) NULL,
    [ord_spl_cod]       NVARCHAR (40)   NULL,
    [template_flg]      INT             NULL,
    [template_ref]      NVARCHAR (100)  NULL,
    [crncy_code]        NVARCHAR (4)    NULL,
    [bto_seqnum]        NVARCHAR (20)   NULL,
    [slot]              NVARCHAR (10)   NULL,
    [moddte]            DATETIME        NULL,
    [mod_usr_id]        NVARCHAR (40)   NULL,
    [exp_adr_id]        NVARCHAR (20)   NULL,
    [exp_cust]          NVARCHAR (20)   NULL,
    [imp_adr_id]        NVARCHAR (20)   NULL,
    [imp_cust]          NVARCHAR (20)   NULL,
    [rtetransflg]       INT             DEFAULT ((0)) NULL,
    [relpartiescod]     NVARCHAR (40)   NULL,
    [contract_nam]      NVARCHAR (40)   NULL,
    [duty_payment_type] NVARCHAR (40)   NULL,
    [duty_payment_acct] NVARCHAR (40)   NULL,
    [ret_adr_id]        NVARCHAR (20)   NULL,
    [ret_cust]          NVARCHAR (20)   NULL,
    [deptno]            NVARCHAR (10)   NULL,
    [dest_num]          NVARCHAR (10)   NULL,
    [rush_flg]          INT             DEFAULT ((0)) NOT NULL,
    [cstms_dtycust]     NVARCHAR (20)   NULL,
    [excise_dtycust]    NVARCHAR (20)   NULL,
    [cstms_ord_stat]    NVARCHAR (20)   NULL,
    [cstms_stat_notes]  NVARCHAR (80)   NULL,
    [cstms_ordtyp]      NVARCHAR (2)    NULL,
    [cstms_addl_info]   NVARCHAR (400)  NULL,
    CONSTRAINT [ord_pk] PRIMARY KEY CLUSTERED ([ordnum] ASC, [wh_id] ASC, [client_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [ord_bco_flg_ck] CHECK ([bco_flg]=(0) OR [bco_flg]=(1)),
    CONSTRAINT [ord_bill_frgtflgck] CHECK ([bill_freight_flg]=(0) OR [bill_freight_flg]=(1)),
    CONSTRAINT [ord_carflg_ck] CHECK ([carflg]=(0) OR [carflg]=(1)),
    CONSTRAINT [ord_cstclrflg_ck] CHECK ([customs_clr_flg]=(0) OR [customs_clr_flg]=(1)),
    CONSTRAINT [ord_reqtmsflgck] CHECK ([requir_tms_flg]=(0) OR [requir_tms_flg]=(1)),
    CONSTRAINT [ord_rrlflg_ck] CHECK ([rrlflg]=(0) OR [rrlflg]=(1)),
    CONSTRAINT [ord_rtetransflg_ck] CHECK ([rtetransflg]=(0) OR [rtetransflg]=(1)),
    CONSTRAINT [ord_rush_flg_ck] CHECK ([rush_flg]=(0) OR [rush_flg]=(1)),
    CONSTRAINT [ord_sig_req_flg_ck] CHECK ([sig_req_flg]=(0) OR [sig_req_flg]=(1)),
    CONSTRAINT [ord_superordflgck] CHECK ([super_ord_flg]=(0) OR [super_ord_flg]=(1)),
    CONSTRAINT [ord_tpl_ck] CHECK ([template_flg]=(0) OR [template_flg]=(1)),
    CONSTRAINT [ord_wave_flg_ck] CHECK ([wave_flg]=(0) OR [wave_flg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [ord_wh_id]
    ON [dbo].[ord]([wh_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [ord_rt_adr_id]
    ON [dbo].[ord]([rt_adr_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [ord_shipby]
    ON [dbo].[ord]([shipby] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [ord_wave_flg]
    ON [dbo].[ord]([wave_flg] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Represents order header.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client ID - The client code that owns this order.  In a non-3PL system, this value defaults to ''----''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Number - A number which identifies the order to the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'ordnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - the warehouse in which the order is to be fulfilled. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Bill-To Customer - The customer to which the billing information should be sent for this order.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'btcust';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ship-To Customer - The customer to which this order will be ultimately be shipped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'stcust';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Route-To Customer - The customer to which this order will be shipped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'rtcust';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Broker Customer - The Broker customer to which this order will be shipped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'brcust';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Bill-To Address ID - The address id of the Bill-To Customer.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'bt_adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ship-To Address ID - The address id of the Ship-To Customer.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'st_adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Route-To Address ID - The address id of the Route-To Customer.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'rt_adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Broker Address ID - The address id of the Broker.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'br_adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Type.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'ordtyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Entered Date - The date this order was entered into the host system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'entdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Added Date - The date this order was added into the Discrete system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'adddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customer PO Type - Type of order sent from the customer. Typically this is the host system''s order type.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'cpotyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customer PO Number - Identifier for this order on the host system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'cponum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customer PO Date - Date/time when this order was added to the host system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'cpodte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Type - This field indicates the delivery Service Type for the parcel.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'srv_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Payment Terms - Conditions under which payment for the order will be received.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'paytrm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Change Carrier Flag - If true, users will be allowed to change the carrier for this order.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'carflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Create Shipment By - Method used to allocate multiple orders.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'shipby';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Release Remaining Lines Flag - If false, and order contains both crossdock and non-crossdock lines, after allocation the system will not release the work to pick non-crossdocked lines until some of the cross docked inv has been received.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'rrlflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Waveable Flag - If true, this order will be considered for inclusion in wave operations/processing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'wave_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Required to be sent to TMS?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'requir_tms_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Return Materials Authorization number.  This number could be downloaded from the host and used to identify a return when it comes back to the warehouse.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'rmanum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Super Order Flag - If true, this order is a super order.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'super_ord_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Super Order Number - The order number assigned to the super order.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'super_ordnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Freight Rate - This field is used to determine the COD amount for COD orders.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'ord_frtrte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Bill Consignee Flag - This field tells the parcel manifesting system the cosignee is to be billed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'bco_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Signature Requiredi - This field tells the parcel manifesting system a signature is required upon delivery of the shipment.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'sig_req_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Bill Freight - when this flag is set freight charges will be added to the COD amount.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'bill_freight_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customs Clearance Flag - when this flag is set, parcel will be sent directly to Customs for Clearance.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'customs_clr_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'COD Indicator Type - this field determines how COD is to be paid.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'cod_ind_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'COD Payment Type - This field tells the parcel manifesting system the COD payment type for the package.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'cod_payment_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Payment Type - This field tells the parcel manifesting system the payment type for the package.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'payment_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ship from customer number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'sfcust';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Address id the order is being shipped from.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'sf_adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of the Customer Service representative associated with the order, if any.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'csr_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Phone number of the Customer Service representative.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'csr_phnnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Email address of the Customer Service representative.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'csr_email_adr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A user-definable tag-field that can be sued to indicate the Business Group associated of the order.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'bus_grp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A user-definable field that can be used to indicate the appt number associated with the order. Some consignees provide this number when appts are made. Not used in core processing. Displayable in the order and shipment browsers.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'host_appt_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A user-definable field that can be used to indicate the delivery contact associated with the order. Not used in core processing. Displayable in the order and shipment browsers.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'dlv_contact';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Direction: It indicates if the order is inbound or outbound.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'ord_dir';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Freight Allowance: It is the dollar amount that the buyer determines is allocated by the vendor for moving freight. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'frt_allow';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This defines the order split behavior, whether it be to ALLOW, NO SPLIT, or null', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'ord_spl_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used by TM: indicates Order is a template', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'template_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used by TM: Id of the template the order was generated with', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'template_ref';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Currency Code for the Currency fields in the table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'crncy_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'BTO Sequence: It represents the sequence that the line will be picked as determined by the Build to Order system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'bto_seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'BTO Slot.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'slot';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date/time this record was last modified.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of user that performed last modification.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(PARCEL) Exporter Address ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'exp_adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(PARCEL) Exporter Customer Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'exp_cust';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(PARCEL) Importer Address ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'imp_adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(PARCEL) Importer Customer Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'imp_cust';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(PARCEL) Routed Transaction indicator - specifies whether a foreign shipper authorizes a US agent to facilate export of items from the US', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'rtetransflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(PARCEL) Related Parties Code - specifies whether the shipper and recipient are related', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'relpartiescod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Contract associated to the order. Only used with TM.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'contract_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(PARCEL) Identifies which party is responsible for the payment of duties and taxes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'duty_payment_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(PARCEL) Account number to be used when billing the recipient or a third party for duties and taxes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'duty_payment_acct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(PARCEL) Return Address ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'ret_adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(PARCEL) Return Customer Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'ret_cust';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Department Number. Customers department number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'deptno';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Destination Number. Customers destination number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'dest_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Rush Flag - This flag specifies the order is ''Rush'' or not. If Rush Flag = true, the order is ''Rush''. otherwise, the order is ''Normal''. This field can be used for all orders.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'rush_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customs Duty Customer. This field contains the customs tax site, which is the customers customs duty tax approval number, so their customs deferrment account can be charged.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'cstms_dtycust';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Excise Duty Customer. This field contains the customs tax site, which is the customers customs duty tax approval number, so their excise deferrment account can be charged.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'excise_dtycust';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customs Order Status. This field contains the status of the processing of the order in Duty Management: Success or Failure.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'cstms_ord_stat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customs Status Notes. This field contains the internal instructions from Duty Managment indicating why it failed processing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'cstms_stat_notes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customs Order Type. The customs order type used for allocation.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'cstms_ordtyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customs Additional Information. This field contains the external instructions from Duty Managment indicating why it failed processing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord', @level2type = N'COLUMN', @level2name = N'cstms_addl_info';

