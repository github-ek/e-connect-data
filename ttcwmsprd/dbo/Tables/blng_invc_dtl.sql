CREATE TABLE [dbo].[blng_invc_dtl] (
    [blng_invc_num]  NVARCHAR (20)   NOT NULL,
    [blng_invc_dtl]  INT             NOT NULL,
    [blng_tran]      NVARCHAR (20)   NULL,
    [blng_dtl_stat]  NVARCHAR (8)    NULL,
    [client_id]      NVARCHAR (32)   NULL,
    [bldg_id]        NVARCHAR (10)   NULL,
    [blng_prd_id]    NVARCHAR (20)   NULL,
    [blng_chrg_typ]  NVARCHAR (1)    NULL,
    [blng_serv_typ]  NVARCHAR (20)   NULL,
    [prtnum]         NVARCHAR (50)   NULL,
    [prt_client_id]  NVARCHAR (32)   NULL,
    [blng_invc_date] DATETIME        NULL,
    [blng_invc_stat] NVARCHAR (8)    NULL,
    [blng_invc_typ]  NVARCHAR (2)    NULL,
    [revlvl]         NVARCHAR (25)   NULL,
    [lotnum]         NVARCHAR (25)   NULL,
    [sup_lotnum]     NVARCHAR (25)   NULL,
    [orgcod]         NVARCHAR (25)   NULL,
    [inv_attr_str1]  NVARCHAR (100)  NULL,
    [inv_attr_str2]  NVARCHAR (100)  NULL,
    [inv_attr_str3]  NVARCHAR (100)  NULL,
    [inv_attr_str4]  NVARCHAR (100)  NULL,
    [inv_attr_str5]  NVARCHAR (100)  NULL,
    [inv_attr_str6]  NVARCHAR (100)  NULL,
    [inv_attr_str7]  NVARCHAR (100)  NULL,
    [inv_attr_str8]  NVARCHAR (100)  NULL,
    [inv_attr_str9]  NVARCHAR (100)  NULL,
    [inv_attr_str10] NVARCHAR (100)  NULL,
    [inv_attr_str11] NVARCHAR (100)  NULL,
    [inv_attr_str12] NVARCHAR (100)  NULL,
    [inv_attr_str13] NVARCHAR (100)  NULL,
    [inv_attr_str14] NVARCHAR (100)  NULL,
    [inv_attr_str15] NVARCHAR (100)  NULL,
    [inv_attr_str16] NVARCHAR (100)  NULL,
    [inv_attr_str17] NVARCHAR (100)  NULL,
    [inv_attr_str18] NVARCHAR (100)  NULL,
    [inv_attr_int1]  INT             NULL,
    [inv_attr_int2]  INT             NULL,
    [inv_attr_int3]  INT             NULL,
    [inv_attr_int4]  INT             NULL,
    [inv_attr_int5]  INT             NULL,
    [inv_attr_flt1]  NUMERIC (19, 4) NULL,
    [inv_attr_flt2]  NUMERIC (19, 4) NULL,
    [inv_attr_flt3]  NUMERIC (19, 4) NULL,
    [inv_attr_dte1]  DATETIME        NULL,
    [inv_attr_dte2]  DATETIME        NULL,
    [untcas]         INT             NULL,
    [untpak]         INT             NULL,
    [untpal]         INT             NULL,
    [untwgt]         NUMERIC (19, 4) NULL,
    [blng_uom_cod]   NVARCHAR (4)    NULL,
    [blng_qty]       NUMERIC (19, 4) NULL,
    [blng_rate]      NUMERIC (19, 4) NULL,
    [subtotal]       NUMERIC (19, 4) NULL,
    [blng_invc_line] NVARCHAR (4)    NULL,
    [usr_id]         NVARCHAR (40)   NULL,
    [num_blng_chrg]  INT             NULL,
    [sto_blng_typ]   NVARCHAR (4)    NULL,
    [total_qty]      NUMERIC (19, 4) NULL,
    [trknum]         NVARCHAR (20)   NULL,
    [invnum]         NVARCHAR (35)   NULL,
    [invlin]         NVARCHAR (10)   NULL,
    [invsln]         NVARCHAR (10)   NULL,
    [supnum]         NVARCHAR (32)   NULL,
    [ship_id]        NVARCHAR (30)   NULL,
    [ship_line_id]   NVARCHAR (10)   NULL,
    [ordnum]         NVARCHAR (35)   NULL,
    [ordlin]         NVARCHAR (10)   NULL,
    [ordsln]         NVARCHAR (10)   NULL,
    [btcust]         NVARCHAR (20)   NULL,
    [stop_id]        NVARCHAR (10)   NULL,
    [stoloc]         NVARCHAR (20)   NULL,
    [lodnum]         NVARCHAR (30)   NULL,
    [prtfam]         NVARCHAR (10)   NULL,
    [chrg_key]       NVARCHAR (20)   NULL,
    [cmnt]           NVARCHAR (4000) NULL,
    [moddte]         DATETIME        NULL,
    [mod_usr_id]     NVARCHAR (40)   NULL,
    [wkonum]         NVARCHAR (20)   NULL,
    [wkorev]         NVARCHAR (10)   NULL,
    [crncy_code]     NVARCHAR (4)    NULL,
    CONSTRAINT [blng_invc_dtl_pk] PRIMARY KEY CLUSTERED ([blng_invc_num] ASC, [blng_invc_dtl] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [blng_invc_dtl_idx1]
    ON [dbo].[blng_invc_dtl]([blng_chrg_typ] ASC, [blng_serv_typ] ASC, [prtnum] ASC, [blng_invc_date] ASC, [prt_client_id] ASC, [client_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [blng_invc_dtl_idx2]
    ON [dbo].[blng_invc_dtl]([ordnum] ASC, [ordlin] ASC, [ordsln] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [blng_invc_dtl_idx3]
    ON [dbo].[blng_invc_dtl]([trknum] ASC, [invnum] ASC, [invlin] ASC, [invsln] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [blng_invc_dtl_idx4]
    ON [dbo].[blng_invc_dtl]([blng_prd_id] ASC, [blng_chrg_typ] ASC, [blng_serv_typ] ASC, [prtnum] ASC, [revlvl] ASC, [lotnum] ASC, [orgcod] ASC, [blng_uom_cod] ASC, [untcas] ASC, [untpal] ASC, [prt_client_id] ASC, [client_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The billing invoice detail defines the details for an invoice from the blng_invc table', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Billing Invoice Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'blng_invc_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Billing Invoice Detail', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'blng_invc_dtl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Billing Transaction', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'blng_tran';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Billing Detail Status', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'blng_dtl_stat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Building Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'bldg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Billing Period Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'blng_prd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Invoice Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'blng_chrg_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Billing Service Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'blng_serv_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Client Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Billing Invoice Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'blng_invc_date';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Billing Invoice Status', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'blng_invc_stat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Billing Invoice Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'blng_invc_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Revision Level', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'revlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lot Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lot number supplied by the supplier for tracking purposes. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'sup_lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Origin Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'orgcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 1', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 2', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 3', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 4', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 5', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 6', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str6';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 7', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str7';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 8', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str8';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 9', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str9';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 10', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str10';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 11', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str11';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 12', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str12';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 13', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str13';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 14', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str14';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 15', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str15';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 16', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str16';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 17', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str17';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 18', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str18';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 1', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'inv_attr_int1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 2', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'inv_attr_int2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 3', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'inv_attr_int3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 4', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'inv_attr_int4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 5', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'inv_attr_int5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 1', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'inv_attr_flt1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 2', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'inv_attr_flt2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 3', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'inv_attr_flt3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Date 1', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'inv_attr_dte1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Date 2', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'inv_attr_dte2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Units per Case', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'untcas';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Units per Pack', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'untpak';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Units per Pallet', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'untpal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unit Weight', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'untwgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Billing Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'blng_uom_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Billing Quantity', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'blng_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Billing Rate', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'blng_rate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sub-Total', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'subtotal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Billing Invoice Line', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'blng_invc_line';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Number of Billing Charges', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'num_blng_chrg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Storage Billing Method', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'sto_blng_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Total Quantity', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'total_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Master Receipt ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'trknum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Invoice Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'invnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Invoice Line', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'invlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Invoice Sub-Line', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'invsln';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Supplier Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'supnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shipment Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'ship_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shipment Line Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'ship_line_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'ordnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Line', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'ordlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Sub-line', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'ordsln';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Bill-To Customer', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'btcust';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stop Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'stop_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Storage Location', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'stoloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'lodnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Family', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'prtfam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client charge schedule key', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'chrg_key';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Comment', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'cmnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date Last Modified', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Modified By', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Work Order Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'wkonum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Work Order Revision', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'wkorev';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Currency Code for the Currency fields in the table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc_dtl', @level2type = N'COLUMN', @level2name = N'crncy_code';

