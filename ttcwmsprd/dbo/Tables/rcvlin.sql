CREATE TABLE [dbo].[rcvlin] (
    [trknum]            NVARCHAR (20)   NOT NULL,
    [client_id]         NVARCHAR (32)   NOT NULL,
    [supnum]            NVARCHAR (32)   NOT NULL,
    [invnum]            NVARCHAR (35)   NOT NULL,
    [invlin]            NVARCHAR (10)   NOT NULL,
    [invsln]            NVARCHAR (10)   NOT NULL,
    [seqnum]            INT             NOT NULL,
    [wh_id]             NVARCHAR (32)   NOT NULL,
    [rcvkey]            NVARCHAR (15)   NOT NULL,
    [expqty]            INT             NOT NULL,
    [idnqty]            INT             DEFAULT ((0)) NOT NULL,
    [rcvqty]            INT             NOT NULL,
    [rptqty]            INT             NOT NULL,
    [exp_catch_qty]     NUMERIC (19, 4) NULL,
    [idn_catch_qty]     NUMERIC (19, 4) NULL,
    [rcv_catch_qty]     NUMERIC (19, 4) NULL,
    [prtnum]            NVARCHAR (50)   NOT NULL,
    [orgcod]            NVARCHAR (25)   NULL,
    [revlvl]            NVARCHAR (25)   NULL,
    [lotnum]            NVARCHAR (25)   NULL,
    [sup_lotnum]        NVARCHAR (25)   NULL,
    [rcvsts]            NVARCHAR (4)    NOT NULL,
    [frhsta]            NVARCHAR (30)   NULL,
    [tohsta]            NVARCHAR (30)   NULL,
    [hsttrn]            NVARCHAR (10)   NULL,
    [mandte]            DATETIME        NULL,
    [expire_dte]        DATETIME        NULL,
    [retcod]            NVARCHAR (4)    NULL,
    [edtflg]            INT             NULL,
    [blind_flg]         INT             NULL,
    [cnsg_flg]          INT             DEFAULT ((0)) NOT NULL,
    [ship_line_id]      NVARCHAR (10)   NULL,
    [distro_ovrflg]     INT             DEFAULT ((0)) NOT NULL,
    [inv_attr_str1]     NVARCHAR (100)  NULL,
    [inv_attr_str2]     NVARCHAR (100)  NULL,
    [inv_attr_str3]     NVARCHAR (100)  NULL,
    [inv_attr_str4]     NVARCHAR (100)  NULL,
    [inv_attr_str5]     NVARCHAR (100)  NULL,
    [inv_attr_str6]     NVARCHAR (100)  NULL,
    [inv_attr_str7]     NVARCHAR (100)  NULL,
    [inv_attr_str8]     NVARCHAR (100)  NULL,
    [inv_attr_str9]     NVARCHAR (100)  NULL,
    [inv_attr_str10]    NVARCHAR (100)  NULL,
    [inv_attr_str11]    NVARCHAR (100)  NULL,
    [inv_attr_str12]    NVARCHAR (100)  NULL,
    [inv_attr_str13]    NVARCHAR (100)  NULL,
    [inv_attr_str14]    NVARCHAR (100)  NULL,
    [inv_attr_str15]    NVARCHAR (100)  NULL,
    [inv_attr_str16]    NVARCHAR (100)  NULL,
    [inv_attr_str17]    NVARCHAR (100)  NULL,
    [inv_attr_str18]    NVARCHAR (100)  NULL,
    [inv_attr_int1]     INT             NULL,
    [inv_attr_int2]     INT             NULL,
    [inv_attr_int3]     INT             NULL,
    [inv_attr_int4]     INT             NULL,
    [inv_attr_int5]     INT             NULL,
    [inv_attr_flt1]     NUMERIC (19, 4) NULL,
    [inv_attr_flt2]     NUMERIC (19, 4) NULL,
    [inv_attr_flt3]     NUMERIC (19, 4) NULL,
    [inv_attr_dte1]     DATETIME        NULL,
    [inv_attr_dte2]     DATETIME        NULL,
    [cstms_cnsgnmnt_id] NVARCHAR (18)   NULL,
    [moddte]            DATETIME        NULL,
    [mod_usr_id]        NVARCHAR (40)   NULL,
    [prt_client_id]     NVARCHAR (32)   DEFAULT (N'----') NOT NULL,
    CONSTRAINT [rcvlin_pk] PRIMARY KEY CLUSTERED ([trknum] ASC, [supnum] ASC, [invnum] ASC, [invlin] ASC, [invsln] ASC, [seqnum] ASC, [wh_id] ASC, [client_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [rcvlin_blnd_flg_ck] CHECK ([blind_flg]=(0) OR [blind_flg]=(1)),
    CONSTRAINT [rcvlin_cnsg_flg_ck] CHECK ([cnsg_flg]=(0) OR [cnsg_flg]=(1)),
    CONSTRAINT [rcvlin_disovr_ck] CHECK ([distro_ovrflg]=(0) OR [distro_ovrflg]=(1)),
    CONSTRAINT [rcvlin_edtflg_ck] CHECK ([edtflg]=(0) OR [edtflg]=(1))
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [rcvlin_uk1]
    ON [dbo].[rcvlin]([rcvkey] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [rcvlin_invnumsupnm]
    ON [dbo].[rcvlin]([invnum] ASC, [supnum] ASC, [prtnum] ASC, [prt_client_id] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [rcvlin_prtnum]
    ON [dbo].[rcvlin]([prtnum] ASC, [prt_client_id] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The receive line table is used to represent receiving invoice lines which are associated to an active receive invoice on the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Truck Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'trknum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client ID associated with the invoice.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Supplier Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'supnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Invoice Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'invnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Invoice Line Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'invlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Invoice Subline Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'invsln';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to make unique rcvlin entries when identify duplicates the original line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - the warehouse in which the inventory is to be received.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to easily tie inventory detail records to rcvlin entries.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'rcvkey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Expected Quantity that will be identified to the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'expqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Quantity identified to the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'idnqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Actual quantity received in to the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'rcvqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Quantity reported to the host.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'rptqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Expected catch quantity.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'exp_catch_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Catch quantity identified to the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'idn_catch_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Catch quantity received in to the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'rcv_catch_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item number to be received.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Expected/actual origin code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'orgcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Expected/actual revision level.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'revlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Expected/actual lot number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lot number supplied by the supplier for tracking purposes. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'sup_lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default status for inventory identified against this line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'rcvsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Receive from host account.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'frhsta';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Receive to host account.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'tohsta';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Host transaction ID to play upon receipt.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'hsttrn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date this product was manufactured.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'mandte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date this product will expire.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'expire_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Return code to use upon receipt.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'retcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Edit Flag', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'edtflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Set if this line was created as a result of a blind receipt.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'blind_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Consignment Flag: The flag indicates immediate ownership transfer from supplier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'cnsg_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shipment Line ID - specifies the shipment line ID which this inventory was attached from the source site.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'ship_line_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if any inventory excess received from a distribution needs to be distributed forward.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'distro_ovrflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 1.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'inv_attr_str1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 2.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'inv_attr_str2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 3.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'inv_attr_str3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 4.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'inv_attr_str4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 5.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'inv_attr_str5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 6.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'inv_attr_str6';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 7.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'inv_attr_str7';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 8.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'inv_attr_str8';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 9.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'inv_attr_str9';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 10.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'inv_attr_str10';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 11.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'inv_attr_str11';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 12.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'inv_attr_str12';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 13.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'inv_attr_str13';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 14.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'inv_attr_str14';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 15.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'inv_attr_str15';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 16.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'inv_attr_str16';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 17.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'inv_attr_str17';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 18.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'inv_attr_str18';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 1.This field can be enabled to track and use custom number data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'inv_attr_int1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 2.This field can be enabled to track and use custom number data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'inv_attr_int2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 3.This field can be enabled to track and use custom number data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'inv_attr_int3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 4.This field can be enabled to track and use custom number data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'inv_attr_int4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 5.This field can be enabled to track and use custom number data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'inv_attr_int5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 1.This field can be enabled to track and use custom decimal data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'inv_attr_flt1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 2.This field can be enabled to track and use custom decimal data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'inv_attr_flt2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 3.This field can be enabled to track and use custom decimal data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'inv_attr_flt3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Date 1.This field can be enabled to track and use custom date data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'inv_attr_dte1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Date 2.This field can be enabled to track and use custom date data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'inv_attr_dte2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customs Consignment ID uniquely identify a consignment of bonded inventory on a per receipt basis.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'cstms_cnsgnmnt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Datetime Stamp of last change to row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of user that performed last modification.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client ID of the Item. In non-3PL systems, this will be set to a default of ''----''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvlin', @level2type = N'COLUMN', @level2name = N'prt_client_id';

