CREATE TABLE [dbo].[pltbld] (
    [stoloc]     NVARCHAR (20) NOT NULL,
    [wh_id]      NVARCHAR (32) NOT NULL,
    [palpos]     NVARCHAR (20) NOT NULL,
    [moddte]     DATETIME      NULL,
    [mod_usr_id] NVARCHAR (40) NULL,
    CONSTRAINT [pltbld_pk] PRIMARY KEY CLUSTERED ([stoloc] ASC, [palpos] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The pallet build table hold information about pallet building locations', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pltbld';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The location master location of the pallet building location', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pltbld', @level2type = N'COLUMN', @level2name = N'stoloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The warehouse ID of the warehouse in which pallet build location exists', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pltbld', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The position in the location a pallet can be built', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pltbld', @level2type = N'COLUMN', @level2name = N'palpos';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last modification date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pltbld', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last User who modified the record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pltbld', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

