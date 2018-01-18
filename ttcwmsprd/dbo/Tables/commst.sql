CREATE TABLE [dbo].[commst] (
    [comcod] NVARCHAR (32) NOT NULL,
    [ltlcls] NVARCHAR (8)  NULL,
    [stccod] NVARCHAR (32) NULL,
    CONSTRAINT [commst_pk] PRIMARY KEY CLUSTERED ([comcod] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Commodity code master defines categories used to group similar items.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'commst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Commodity identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'commst', @level2type = N'COLUMN', @level2name = N'comcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'LTL Freight class identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'commst', @level2type = N'COLUMN', @level2name = N'ltlcls';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Standard Transportation Commodity Code - used for rail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'commst', @level2type = N'COLUMN', @level2name = N'stccod';

