CREATE TABLE [dbo].[adrmst] (
    [adr_id]             NVARCHAR (20)  NOT NULL,
    [client_id]          NVARCHAR (32)  NULL,
    [host_ext_id]        NVARCHAR (40)  NULL,
    [adrnam]             NVARCHAR (40)  NOT NULL,
    [adrtyp]             NVARCHAR (4)   NULL,
    [adrln1]             NVARCHAR (40)  NULL,
    [adrln2]             NVARCHAR (40)  NULL,
    [adrln3]             NVARCHAR (40)  NULL,
    [adrcty]             NVARCHAR (70)  NULL,
    [adrstc]             NVARCHAR (40)  NULL,
    [adrpsz]             NVARCHAR (20)  NULL,
    [ctry_name]          NVARCHAR (60)  NULL,
    [rgncod]             NVARCHAR (40)  NULL,
    [phnnum]             NVARCHAR (20)  NULL,
    [faxnum]             NVARCHAR (20)  NULL,
    [attn_name]          NVARCHAR (40)  NULL,
    [attn_tel]           NVARCHAR (20)  NULL,
    [cont_name]          NVARCHAR (40)  NULL,
    [cont_tel]           NVARCHAR (20)  NULL,
    [cont_title]         NVARCHAR (20)  NULL,
    [rsaflg]             INT            NULL,
    [temp_flg]           INT            NULL,
    [po_box_flg]         INT            NULL,
    [last_name]          NVARCHAR (30)  NULL,
    [first_name]         NVARCHAR (30)  NULL,
    [honorific]          NVARCHAR (20)  NULL,
    [usr_dsp]            NVARCHAR (110) NULL,
    [adr_district]       NVARCHAR (30)  NULL,
    [web_adr]            NVARCHAR (200) NULL,
    [email_adr]          NVARCHAR (100) NULL,
    [pagnum]             NVARCHAR (20)  NULL,
    [locale_id]          NVARCHAR (20)  NULL,
    [pool_flg]           INT            DEFAULT ((0)) NULL,
    [pool_rate_serv_nam] NVARCHAR (40)  NULL,
    [ship_phnnum]        NVARCHAR (20)  NULL,
    [ship_faxnum]        NVARCHAR (20)  NULL,
    [ship_web_adr]       NVARCHAR (200) NULL,
    [ship_email_adr]     NVARCHAR (100) NULL,
    [ship_cont_name]     NVARCHAR (40)  NULL,
    [ship_cont_title]    NVARCHAR (20)  NULL,
    [ship_cont_tel]      NVARCHAR (20)  NULL,
    [ship_attn_name]     NVARCHAR (40)  NULL,
    [ship_attn_phnnum]   NVARCHAR (20)  NULL,
    [tim_zon_cd]         NVARCHAR (255) NULL,
    [rqst_state_cod]     NVARCHAR (20)  NULL,
    [grp_nam]            NVARCHAR (40)  NULL,
    [latitude]           NVARCHAR (40)  NULL,
    [longitude]          NVARCHAR (40)  NULL,
    [gln]                NVARCHAR (40)  NULL,
    [cstms_site_typ]     NVARCHAR (8)   NULL,
    [cstms_tx_site]      NVARCHAR (20)  NULL,
    CONSTRAINT [adrmst_ad_id_pk] PRIMARY KEY CLUSTERED ([adr_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [adrmst_poboxflg_ck] CHECK ([po_box_flg]=(0) OR [po_box_flg]=(1)),
    CONSTRAINT [adrmst_pool_flg_ck] CHECK ([pool_flg]=(0) OR [pool_flg]=(1)),
    CONSTRAINT [adrmst_rsaflg_ck] CHECK ([rsaflg]=(0) OR [rsaflg]=(1)),
    CONSTRAINT [adrmst_temp_flg_ck] CHECK ([temp_flg]=(0) OR [temp_flg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [adrmst_idx1]
    ON [dbo].[adrmst]([host_ext_id] ASC, [client_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains all address information.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  This defines what addresss this flow entry belongs in.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the client this address applies to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This field is used if this address has an unique identifer on the external host', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'host_ext_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the name of the address location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'adrnam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This identifies the address type.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'adrtyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Line 1 of the street address.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'adrln1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Line 2 of the street address.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'adrln2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Line 3 of the street address.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'adrln3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the city to which this address applies.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'adrcty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the state to which this address applies.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'adrstc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the zip-code to which this address applies.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'adrpsz';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Country Name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'ctry_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Region Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'rgncod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Phone number of the address corresponding to its receiving operations/inbound freight.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'phnnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Fax number of the address corresponding to its receiving operations/inbound freight.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'faxnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name that should be used in the mail sent to this address corresponding to its receiving operations/inbound freight.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'attn_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Phone number of the person to whom mail is sent at this address corresponding to its receiving operations/inbound freight.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'attn_tel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of the Contact person at this address corresponding to its receiving operations/inbound freight.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'cont_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Phone number of the contact person at this address corresponding to its receiving operations/inbound freight.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'cont_tel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Title of the contact person at this address corresponding to its receiving operations/inbound freight.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'cont_title';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Is this a residential address?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'rsaflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Is this a temporary address?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'temp_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Is this address a p.o. box?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'po_box_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Individual''s last name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'last_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Individual''s first name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'first_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Mr, Mrs., etc.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'honorific';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A formatted field containing the user id, first and last names for display, used only with USR type addresses.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'usr_dsp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'District to which address applies.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'adr_district';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Web Site of the address corresponding to its receiving operations/inbound freight.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'web_adr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Email address of this location corresponding to its receiving operations/inbound freight.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'email_adr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pager number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'pagnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique indentifier.  This allows different descriptions for differet locales.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'locale_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Does this location represent a pool point?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'pool_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Only valid if this address is a pool point (i.e. pool_flg == 1): The pool rating service which defines the service and geography.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'pool_rate_serv_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Phone number of the address corresponding to its shipping operations/outbound freight.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'ship_phnnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Fax number of the address corresponding to its shipping operations/outbound freight.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'ship_faxnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Web Site of the address corresponding to its shipping operations/outbound freight.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'ship_web_adr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Email address of this location corresponding to its shipping operations/outbound freight.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'ship_email_adr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of the Contact person at this address corresponding to its shipping operations/outbound freight.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'ship_cont_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Title of the contact person at this address corresponding to its shipping operations/outbound freight.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'ship_cont_title';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Phone number of the contact person at this address corresponding to its shipping operations/outbound freight.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'ship_cont_tel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name that should be used in the mail sent to this address corresponding to its shipping operations/outbound freight.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'ship_attn_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Phone number of the person to whom mail is sent at this address corresponding to its shipping operations/outbound freight.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'ship_attn_phnnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Time zone code (May not be unique around the world e.g. CT can be Central Time zone in North America or in Australia but its offset from GMT is different).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'tim_zon_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicator to show if the Facility has been accepted. Possible values (''Requested'', ''Accepted'', ''Rejected'').', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'rqst_state_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'grp_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Latitude updated by host system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'latitude';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Longitude updated by host system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'longitude';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Global Location Number - This number will represent each address uniquely throughout following GS1 standards.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'gln';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customs Site Type - Indicates whether or not the warehouse is bonded and if bonded the type of bonded warehouse. Values are ''customs'', ''customs and excise''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'cstms_site_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customs Tax Site - This field holds the customs tax approval number assigned by HMRC to a bonded warehouse.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'adrmst', @level2type = N'COLUMN', @level2name = N'cstms_tx_site';

