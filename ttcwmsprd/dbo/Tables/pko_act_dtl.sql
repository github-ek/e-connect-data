CREATE TABLE [dbo].[pko_act_dtl] (
    [pko_act_dtl_id]   NVARCHAR (12)   NOT NULL,
    [pko_act_id]       NVARCHAR (12)   NOT NULL,
    [pko_errtyp]       NVARCHAR (20)   NOT NULL,
    [pko_errmsg]       NVARCHAR (2000) NULL,
    [scan_dt]          DATETIME        NOT NULL,
    [ins_dt]           DATETIME        NULL,
    [last_upd_dt]      DATETIME        NULL,
    [ins_user_id]      NVARCHAR (40)   NULL,
    [last_upd_user_id] NVARCHAR (40)   NULL,
    CONSTRAINT [pko_act_dtl_pk] PRIMARY KEY CLUSTERED ([pko_act_dtl_id] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [pko_act_dtl_idx]
    ON [dbo].[pko_act_dtl]([pko_act_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table will save the activity data detail for the Packout Station Operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act_dtl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence that uniquely identifies a packout activity detail record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act_dtl', @level2type = N'COLUMN', @level2name = N'pko_act_dtl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence that uniquely identifies a packout activity record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act_dtl', @level2type = N'COLUMN', @level2name = N'pko_act_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Error type of error for this item, if there was one.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act_dtl', @level2type = N'COLUMN', @level2name = N'pko_errtyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Error Message thrown if a system-detected error was found for this item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act_dtl', @level2type = N'COLUMN', @level2name = N'pko_errmsg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date when the scan was completed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act_dtl', @level2type = N'COLUMN', @level2name = N'scan_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act_dtl', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act_dtl', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act_dtl', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_act_dtl', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

