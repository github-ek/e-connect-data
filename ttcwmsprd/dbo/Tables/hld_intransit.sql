CREATE TABLE [dbo].[hld_intransit] (
    [hldpfx]     NVARCHAR (32) NOT NULL,
    [hldnum]     NVARCHAR (10) NOT NULL,
    [wh_id]      NVARCHAR (32) NOT NULL,
    [dtlnum]     NVARCHAR (30) NOT NULL,
    [reacod]     NVARCHAR (20) NULL,
    [hlddte]     DATETIME      NOT NULL,
    [hld_usr_id] NVARCHAR (40) NOT NULL,
    CONSTRAINT [hld_intransit_pk] PRIMARY KEY CLUSTERED ([hldpfx] ASC, [hldnum] ASC, [wh_id] ASC, [dtlnum] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The intransit hold table ties the hold master table to the intransit inventory table.  This table defines what the the individual holds are for each piece of intransit inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hld_intransit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hold Prefix.  Denotes the origin of a hold.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hld_intransit', @level2type = N'COLUMN', @level2name = N'hldpfx';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hold Number.  A unique user defined or system generated code which uniquely identifies each individual hold master.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hld_intransit', @level2type = N'COLUMN', @level2name = N'hldnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID. Warehouse that owns the hold.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hld_intransit', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Detail Number.  This is the piece of inventory that has this hold.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hld_intransit', @level2type = N'COLUMN', @level2name = N'dtlnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Reason Code.  Reason why this hold was applied to this piece of inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hld_intransit', @level2type = N'COLUMN', @level2name = N'reacod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hold Date.  When was the hold placed?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hld_intransit', @level2type = N'COLUMN', @level2name = N'hlddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hold User ID.  Who placed this hold?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hld_intransit', @level2type = N'COLUMN', @level2name = N'hld_usr_id';

