CREATE TABLE [dbo].[wh_cstmst] (
    [cstnum]           NVARCHAR (20) NOT NULL,
    [client_id]        NVARCHAR (32) NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [prcpri]           INT           NOT NULL,
    [rtcust]           NVARCHAR (20) NULL,
    [btcust]           NVARCHAR (20) NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [wh_cstmst_pk] PRIMARY KEY CLUSTERED ([wh_id] ASC, [cstnum] ASC, [client_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines the store attributes', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_cstmst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ship-To Customer - The customer to which this order will be ultimately be shipped', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_cstmst', @level2type = N'COLUMN', @level2name = N'cstnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client Id - The client for which this distribution is to be allocated/processed', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_cstmst', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse Identifier - Warehouse this store is configured for', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_cstmst', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Processing Priority - Default processing priority assigned to a distro. This value may be over-ridden for individual distros. Acceptable values range from 1 - highest priority to 9- lowest priority', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_cstmst', @level2type = N'COLUMN', @level2name = N'prcpri';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Route-to Customer - Hub facility store''s product may be sent before being distributed to the store. This value is defaulted on the distro and may be be modified or over-ridden for individual distros', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_cstmst', @level2type = N'COLUMN', @level2name = N'rtcust';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Bill-to Customer - the customer or facility that may be billed. This value is defaulted on the distro and may be be modified or over-ridden for individual distros', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_cstmst', @level2type = N'COLUMN', @level2name = N'btcust';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_cstmst', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_cstmst', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_cstmst', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_cstmst', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

