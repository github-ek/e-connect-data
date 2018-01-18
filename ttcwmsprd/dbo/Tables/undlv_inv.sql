CREATE TABLE [dbo].[undlv_inv] (
    [undlv_invnum]     NVARCHAR (20) NOT NULL,
    [trlr_id]          NVARCHAR (20) NOT NULL,
    [dtlnum]           NVARCHAR (30) NOT NULL,
    [prtnum]           NVARCHAR (50) NOT NULL,
    [prt_client_id]    NVARCHAR (32) NOT NULL,
    [undlv_qty]        INT           NOT NULL,
    [to_invsts]        NVARCHAR (4)  NOT NULL,
    [undlv_reacod]     NVARCHAR (20) NOT NULL,
    [unld_prc_flg]     INT           NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [undlv_inv_pk] PRIMARY KEY CLUSTERED ([undlv_invnum] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The undlv_inv table is a temporary place for identifying undelivered inventory before it is unloaded. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'undlv_inv';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier for each piece of undelivered inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'undlv_inv', @level2type = N'COLUMN', @level2name = N'undlv_invnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Trailer ID - Associates this piece of undelivered inventory with the delivery trailer it came from.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'undlv_inv', @level2type = N'COLUMN', @level2name = N'trlr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Detail Number - the specific piece of inventory that was undelivered.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'undlv_inv', @level2type = N'COLUMN', @level2name = N'dtlnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'undlv_inv', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Client ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'undlv_inv', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Undelivered Reason Code - The reason this inventory was not delivered.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'undlv_inv', @level2type = N'COLUMN', @level2name = N'undlv_reacod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unload Processed Flag - Indicates if the unload logic has been run on this undlv_inv record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'undlv_inv', @level2type = N'COLUMN', @level2name = N'unld_prc_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert Date.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'undlv_inv', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Update Date.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'undlv_inv', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert User ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'undlv_inv', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Update User ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'undlv_inv', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

