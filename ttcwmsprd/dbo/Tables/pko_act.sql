CREATE TABLE [dbo].[pko_act] (
    [pko_act_id]       NVARCHAR (12)   NOT NULL,
    [wh_id]            NVARCHAR (32)   NOT NULL,
    [devcod]           NVARCHAR (20)   NOT NULL,
    [pko_errtyp]       NVARCHAR (20)   NOT NULL,
    [pko_errmsg]       NVARCHAR (2000) NULL,
    [reacod]           NVARCHAR (20)   NULL,
    [ctnnum]           NVARCHAR (30)   NULL,
    [invtid]           NVARCHAR (30)   NOT NULL,
    [init_scan_typ]    NVARCHAR (40)   NOT NULL,
    [ship_id]          NVARCHAR (30)   NOT NULL,
    [ship_ctnnum]      NVARCHAR (30)   NULL,
    [aud_typ]          NVARCHAR (20)   NOT NULL,
    [ins_dt]           DATETIME        NULL,
    [last_upd_dt]      DATETIME        NULL,
    [ins_user_id]      NVARCHAR (40)   NULL,
    [last_upd_user_id] NVARCHAR (40)   NULL,
    CONSTRAINT [pko_act_pk] PRIMARY KEY CLUSTERED ([pko_act_id] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [pko_act_ctnnum]
    ON [dbo].[pko_act]([ctnnum] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pko_act_invtid]
    ON [dbo].[pko_act]([invtid] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table will save the activity data for the Packout Station Operations. This will be a header table with one row per carton processed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence that uniquely identifies a packout activity record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act', @level2type = N'COLUMN', @level2name = N'pko_act_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The code for the device that performed the packout process', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act', @level2type = N'COLUMN', @level2name = N'devcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The error type for this packout process', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act', @level2type = N'COLUMN', @level2name = N'pko_errtyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The message for the error that caused this process to fail, if any', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act', @level2type = N'COLUMN', @level2name = N'pko_errmsg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User-selected reason code of the error, if one was chosen', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act', @level2type = N'COLUMN', @level2name = N'reacod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carton Number, if any was created', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act', @level2type = N'COLUMN', @level2name = N'ctnnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A stoloc, lodnum or subnum scanned to initiate Packout', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act', @level2type = N'COLUMN', @level2name = N'invtid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of identifier scanned to initiate packout (LOCATION, LOAD, SUB-LOAD)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act', @level2type = N'COLUMN', @level2name = N'init_scan_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier of the shipment to which the inventory processed during this packout process was destined', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act', @level2type = N'COLUMN', @level2name = N'ship_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shipping Carton Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act', @level2type = N'COLUMN', @level2name = N'ship_ctnnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to distinguish between Pack Station Audits and Outbound Inventory Audits.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act', @level2type = N'COLUMN', @level2name = N'aud_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

