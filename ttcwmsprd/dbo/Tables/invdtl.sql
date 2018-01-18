CREATE TABLE [dbo].[invdtl] (
    [dtlnum]            NVARCHAR (30)   NOT NULL,
    [subnum]            NVARCHAR (30)   NOT NULL,
    [phdflg]            INT             NULL,
    [prtnum]            NVARCHAR (50)   NOT NULL,
    [prt_client_id]     NVARCHAR (32)   DEFAULT (N'----') NOT NULL,
    [orgcod]            NVARCHAR (25)   DEFAULT (N'----') NOT NULL,
    [revlvl]            NVARCHAR (25)   DEFAULT (N'----') NOT NULL,
    [lotnum]            NVARCHAR (25)   DEFAULT (N'----') NOT NULL,
    [sup_lotnum]        NVARCHAR (25)   NULL,
    [invsts]            NVARCHAR (4)    NOT NULL,
    [supnum]            NVARCHAR (32)   NULL,
    [cnsg_flg]          INT             NULL,
    [age_pflnam]        NVARCHAR (30)   NULL,
    [fifdte]            DATETIME        NOT NULL,
    [mandte]            DATETIME        NULL,
    [expire_dte]        DATETIME        NULL,
    [untqty]            INT             NOT NULL,
    [untcas]            INT             NOT NULL,
    [untpak]            INT             NOT NULL,
    [ftpcod]            NVARCHAR (30)   NULL,
    [rcvkey]            NVARCHAR (15)   NULL,
    [ship_line_id]      NVARCHAR (10)   NULL,
    [wrkref]            NVARCHAR (12)   NULL,
    [wrkref_dtl]        NVARCHAR (15)   NULL,
    [adddte]            DATETIME        DEFAULT (getdate()) NULL,
    [rcvdte]            DATETIME        NULL,
    [lstmov]            DATETIME        NULL,
    [lstdte]            DATETIME        NULL,
    [lstcod]            NVARCHAR (20)   NULL,
    [lst_usr_id]        NVARCHAR (40)   NULL,
    [cmpkey]            NVARCHAR (20)   NULL,
    [alcflg]            INT             DEFAULT ((1)) NULL,
    [catch_qty]         NUMERIC (19, 4) NULL,
    [lst_arecod]        NVARCHAR (10)   NULL,
    [bill_through_dte]  DATETIME        NULL,
    [condcod]           NVARCHAR (1)    NULL,
    [distro_id]         NVARCHAR (35)   NULL,
    [distro_flg]        INT             DEFAULT ((0)) NOT NULL,
    [hld_flg]           INT             DEFAULT ((0)) NOT NULL,
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
    [rttn_id]           NVARCHAR (10)   NULL,
    [cstms_bond_flg]    INT             DEFAULT ((0)) NOT NULL,
    [dty_stmp_flg]      INT             DEFAULT ((0)) NOT NULL,
    [u_version]         INT             NULL,
    [ins_dt]            DATETIME        NULL,
    [last_upd_dt]       DATETIME        NULL,
    [ins_user_id]       NVARCHAR (40)   NULL,
    [last_upd_user_id]  NVARCHAR (40)   NULL,
    [asnflg]            INT             DEFAULT ((0)) NULL,
    CONSTRAINT [invdtl_pk] PRIMARY KEY CLUSTERED ([dtlnum] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [invdtl_alcflg_ck] CHECK ([alcflg]=(0) OR [alcflg]=(1)),
    CONSTRAINT [invdtl_asnflg_ck] CHECK ([asnflg]=(0) OR [asnflg]=(1)),
    CONSTRAINT [invdtl_c_b_flgck] CHECK ([cstms_bond_flg]=(0) OR [cstms_bond_flg]=(1)),
    CONSTRAINT [invdtl_cnsg_flg_ck] CHECK ([cnsg_flg]=(0) OR [cnsg_flg]=(1)),
    CONSTRAINT [invdtl_disflg_ck] CHECK ([distro_flg]=(0) OR [distro_flg]=(1)),
    CONSTRAINT [invdtl_exdtystp_ck] CHECK ([dty_stmp_flg]=(0) OR [dty_stmp_flg]=(1)),
    CONSTRAINT [invdtl_hldflg_ck] CHECK ([hld_flg]=(0) OR [hld_flg]=(1)),
    CONSTRAINT [invdtl_phdflg_ck] CHECK ([phdflg]=(0) OR [phdflg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [invdtl_wrkref_dtl]
    ON [dbo].[invdtl]([wrkref_dtl] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [invdtl_idx1]
    ON [dbo].[invdtl]([subnum] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [invdtl_idx2]
    ON [dbo].[invdtl]([ship_line_id] ASC, [subnum] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [invdtl_idx3]
    ON [dbo].[invdtl]([rcvkey] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [invdtl_idx4]
    ON [dbo].[invdtl]([subnum] ASC, [prt_client_id] ASC, [prtnum] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [invdtl_idx5]
    ON [dbo].[invdtl]([subnum] ASC, [dtlnum] ASC, [prtnum] ASC, [prt_client_id] ASC, [lotnum] ASC, [orgcod] ASC, [revlvl] ASC, [invsts] ASC, [untcas] ASC, [untpak] ASC, [untqty] ASC, [ftpcod] ASC, [phdflg] ASC, [wrkref] ASC, [rcvkey] ASC, [ship_line_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [invdtl_idx6]
    ON [dbo].[invdtl]([prtnum] ASC, [prt_client_id] ASC, [lotnum] ASC, [orgcod] ASC, [revlvl] ASC, [invsts] ASC, [untcas] ASC, [untpak] ASC, [untqty] ASC, [ftpcod] ASC, [phdflg] ASC, [wrkref] ASC, [rcvkey] ASC, [ship_line_id] ASC, [fifdte] ASC, [mandte] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [invdtl_idx7]
    ON [dbo].[invdtl]([ship_line_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [invdtl_wrkref]
    ON [dbo].[invdtl]([wrkref] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [invdtl_cmpkey]
    ON [dbo].[invdtl]([cmpkey] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [invdtl_prtnum]
    ON [dbo].[invdtl]([prtnum] ASC, [prt_client_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [prt_sts_clientid]
    ON [dbo].[invdtl]([prtnum] ASC, [invsts] ASC, [prt_client_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [invdtl_distro_flg]
    ON [dbo].[invdtl]([distro_flg] ASC, [distro_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The invdtl table is used to represent inv in the system.  If the facility tracked serialized pieces, then the detail number (dtlnum) would be set to whatever labeling was on the serialized piece.  Otherwise, it is an gen. num.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifies which inventory sub (invsub) record this detail is attached to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'subnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag is set to 1 in the event that this invdtl maps to a physical piece.  In that case, the dtlnum represents the labeled piece.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'phdflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item number of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client ownership for item number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Origin Code of the inventory tracked by this detail. If this item is not origin code tracked, then this field will take on a default value of ''----''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'orgcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Revision level of the inventory tracked by this detail.  If this item is not revision level tracked, then this field will take on a default value of ''----''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'revlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lot number of the inventory tracked by this detail.  If this item is not lot number tracked, then this field will take on a default value of ''----''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lot number supplied by the supplier for tracking purposes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'sup_lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory status of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'invsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Supplier Number of the Inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'supnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Consigned Flag: The status indicates ownership of the inventory (1=ownership is with the supplier, 0=ownership is not with supplier)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'cnsg_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Aging profile for this inventory.  This only applies to items that are date controlled.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'age_pflnam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date to be used for FIFO calculations with this inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'fifdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date this product was manufactured.  It is calculated by calling the command ''get manufacturing date''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'mandte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date this product will expire.  This is only used for date controlled product and is calculated based on the product''s aging profile.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'expire_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The amount of inventory (in stock keeping units) this detail tracks.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'untqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The number of units in a case of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'untcas';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The number of units in an inner pack carton of the inventory tracked by this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'untpak';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The footprint code of the inventory tracked by this invdtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'ftpcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this detail was received, then the receive key will be filled in indicating which rcvlin this detail was received against.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'rcvkey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this detail was picked for a shipment, then the ship_line_id field will be filled in mapping it to the particular shipment line which this detail satisfied.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'ship_line_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this detail was picked for a shipment or a work order, the wrkref field will be filled in which provides a mapping into the pckwrk_hdr/pckwrk_dtl tables for the pick which this detail satisfied.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'wrkref';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pick Work Detail ID - The unique identifier of the pick work detail record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'wrkref_dtl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date this detail was added to the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'adddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This indicates the date and time that the detail was received.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'rcvdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last date/time detail was moved.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'lstmov';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last date/time activity occurred for this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'lstdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last activity code on this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'lstcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last user which performed an activity on this detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'lst_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this detail was produced as a result of production, this field will be filled in to provide a mapping in to the cmphdr table which will indicate which work order this detail was produced against.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'cmpkey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allow Allocation Flag.  Is this detail allowed for use in allocation?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'alcflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Catch Quantity', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'catch_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Area Code. Displays the last area code of the inventory. Moves to the RF device will NOT be updated with the rdt device as the last area code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'lst_arecod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Refers to the ending date of the anniversary storage period.  This is usually one day less than the sum of the received date and the billing period length.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'bill_through_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The condition code of inventory returned to the warehouse.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'condcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Distribution Identifer - the distribution inventory reserved for', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'distro_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if the inventory is candidate for distribution.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'distro_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag indicates that the inventory is put on hold if it has a value of 1 .', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'hld_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 1.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 2.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 3.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 4.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 5.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 6.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str6';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 7.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str7';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 8.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str8';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 9.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str9';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 10.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str10';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 11.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str11';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 12.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str12';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 13.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str13';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 14.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str14';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 15.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str15';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 16.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str16';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 17.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str17';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 18.This field can be enabled to track and use custom text data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_str18';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 1.This field can be enabled to track and use custom number data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_int1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 2.This field can be enabled to track and use custom number data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_int2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 3.This field can be enabled to track and use custom number data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_int3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 4.This field can be enabled to track and use custom number data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_int4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 5.This field can be enabled to track and use custom number data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_int5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 1.This field can be enabled to track and use custom decimal data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_flt1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 2.This field can be enabled to track and use custom decimal data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_flt2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 3.This field can be enabled to track and use custom decimal data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_flt3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Date 1.This field can be enabled to track and use custom date data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_dte1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Date 2.This field can be enabled to track and use custom date data during standard inventory-related operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'inv_attr_dte2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customs Consignment ID uniquely identify a consignment of bonded inventory on a per receipt basis.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'cstms_cnsgnmnt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Rotation ID used for tracking bonded inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'rttn_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag used to indicate whether or not the inventory is bonded. ''1'' means under bond and ''0'' means not under bond.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'cstms_bond_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag used to indicate whether or not the inventory has a duty stamp applied. ''1'' means yes and ''0'' means no.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'dty_stmp_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag is set to 1 when inventory is downloaded from the HOST as an ASN', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl', @level2type = N'COLUMN', @level2name = N'asnflg';

