CREATE TABLE [dbo].[cstms_cnsgnmnt] (
    [cstms_cnsgnmnt_id] NVARCHAR (18)  NOT NULL,
    [wh_id]             NVARCHAR (32)  NOT NULL,
    [client_id]         NVARCHAR (32)  NULL,
    [cstms_rcpt_typ]    NVARCHAR (2)   NULL,
    [orgntr]            NVARCHAR (25)  NULL,
    [orgntr_ref]        NVARCHAR (30)  NULL,
    [cstms_cwc]         NVARCHAR (3)   NULL,
    [cstms_ucr]         NVARCHAR (20)  NULL,
    [cstms_stat]        NVARCHAR (1)   NULL,
    [nottxt]            NVARCHAR (240) NULL,
    [entrydte]          DATETIME       NULL,
    [supnum]            NVARCHAR (32)  NULL,
    [ins_dt]            DATETIME       NULL,
    [last_upd_dt]       DATETIME       NULL,
    [ins_user_id]       NVARCHAR (40)  NULL,
    [last_upd_user_id]  NVARCHAR (40)  NULL,
    CONSTRAINT [cstms_cnsgnmnt_pk] PRIMARY KEY CLUSTERED ([wh_id] ASC, [cstms_cnsgnmnt_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Represents customs consignment.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstms_cnsgnmnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customs Consignment ID - Customs Consignment ID uniquely identify a consignment of bonded inventory on a per receipt basis.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstms_cnsgnmnt', @level2type = N'COLUMN', @level2name = N'cstms_cnsgnmnt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - Warehouse ID for the customs consignment.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstms_cnsgnmnt', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client ID - Client to whom the consignment belongs.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstms_cnsgnmnt', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customs Receipt Type - The customs receipt type that is on the customs paperwork for the receipt.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstms_cnsgnmnt', @level2type = N'COLUMN', @level2name = N'cstms_rcpt_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Originator - Where the consignment came from.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstms_cnsgnmnt', @level2type = N'COLUMN', @level2name = N'orgntr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Originator Reference - Originator Reference.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstms_cnsgnmnt', @level2type = N'COLUMN', @level2name = N'orgntr_ref';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customs country whence consigned - The country where the consignment originated from.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstms_cnsgnmnt', @level2type = N'COLUMN', @level2name = N'cstms_cwc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customs unique consignment reference - Unique Consignment Reference for customs purposes only for customs receipt type of From Importation.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstms_cnsgnmnt', @level2type = N'COLUMN', @level2name = N'cstms_ucr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customs Status - Customs Status can have the values Pending, Released and Complete. If the customs status is pending receivers and supervisors are not able to complete the receipt to send to duty management.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstms_cnsgnmnt', @level2type = N'COLUMN', @level2name = N'cstms_stat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Note Text - Notes about the customs consignment.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstms_cnsgnmnt', @level2type = N'COLUMN', @level2name = N'nottxt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customs entry date - The date and time the receipt entered customs.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstms_cnsgnmnt', @level2type = N'COLUMN', @level2name = N'entrydte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Supplier - Supplier of the consignment.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstms_cnsgnmnt', @level2type = N'COLUMN', @level2name = N'supnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstms_cnsgnmnt', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstms_cnsgnmnt', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstms_cnsgnmnt', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstms_cnsgnmnt', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

