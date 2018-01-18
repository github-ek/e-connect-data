CREATE TABLE [dbo].[pko_act_inv] (
    [pko_act_dtl_id]   NVARCHAR (12) NOT NULL,
    [dtlnum]           NVARCHAR (30) NOT NULL,
    [prtnum]           NVARCHAR (50) NOT NULL,
    [prt_client_id]    NVARCHAR (32) NOT NULL,
    [lotnum]           NVARCHAR (25) NOT NULL,
    [sup_lotnum]       NVARCHAR (25) NULL,
    [orgcod]           NVARCHAR (25) NOT NULL,
    [revlvl]           NVARCHAR (25) NOT NULL,
    [ship_line_id]     NVARCHAR (10) NOT NULL,
    [untqty]           INT           NOT NULL,
    [short_qty]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [pko_act_inv_pk] PRIMARY KEY CLUSTERED ([pko_act_dtl_id] ASC, [dtlnum] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'links a activity data detail row to the inventory identified by that detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act_inv';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence that uniquely identifies a packout activity detail record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act_inv', @level2type = N'COLUMN', @level2name = N'pko_act_dtl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Detail Number for the identified inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act_inv', @level2type = N'COLUMN', @level2name = N'dtlnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act_inv', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Client ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act_inv', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lot Number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act_inv', @level2type = N'COLUMN', @level2name = N'lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lot number supplied by the supplier for tracking purposes', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act_inv', @level2type = N'COLUMN', @level2name = N'sup_lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Origin Code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act_inv', @level2type = N'COLUMN', @level2name = N'orgcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Revision Level.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act_inv', @level2type = N'COLUMN', @level2name = N'revlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shipment Line ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act_inv', @level2type = N'COLUMN', @level2name = N'ship_line_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Quantity identified in eaches.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act_inv', @level2type = N'COLUMN', @level2name = N'untqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Difference between the quantity identified during packout and the expected quantity.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act_inv', @level2type = N'COLUMN', @level2name = N'short_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act_inv', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act_inv', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act_inv', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act_inv', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

