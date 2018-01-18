CREATE TABLE [dbo].[invhld] (
    [hldpfx]           NVARCHAR (32) NOT NULL,
    [hldnum]           NVARCHAR (10) NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [dtlnum]           NVARCHAR (30) NOT NULL,
    [reacod]           NVARCHAR (20) NULL,
    [hlddte]           DATETIME      NOT NULL,
    [hld_usr_id]       NVARCHAR (40) NOT NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [invhld_pk] PRIMARY KEY CLUSTERED ([hldpfx] ASC, [hldnum] ASC, [wh_id] ASC, [dtlnum] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [invhld_idx1]
    ON [dbo].[invhld]([dtlnum] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The inventory on hold table ties the hold master table to the inventory detail table.  This table defines what the the individual holds are for each piece of inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invhld';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hold Prefix.  Denotes the origin of a hold.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invhld', @level2type = N'COLUMN', @level2name = N'hldpfx';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hold Number.  A unique user defined or system generated code which uniquely identifies each individual hold master.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invhld', @level2type = N'COLUMN', @level2name = N'hldnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID. Warehouse that owns the hold.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invhld', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Detail Number.  This is the piece of inventory that has this hold.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invhld', @level2type = N'COLUMN', @level2name = N'dtlnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Reason Code.  Reason why this hold was applied to this piece of inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invhld', @level2type = N'COLUMN', @level2name = N'reacod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hold Date.  When was the hold placed?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invhld', @level2type = N'COLUMN', @level2name = N'hlddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hold User ID.  Who placed this hold?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invhld', @level2type = N'COLUMN', @level2name = N'hld_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invhld', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invhld', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invhld', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invhld', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invhld', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

