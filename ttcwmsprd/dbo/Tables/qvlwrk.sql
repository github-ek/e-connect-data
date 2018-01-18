CREATE TABLE [dbo].[qvlwrk] (
    [wh_id]         NVARCHAR (32)   NOT NULL,
    [stoloc]        NVARCHAR (20)   NOT NULL,
    [prtnum]        NVARCHAR (50)   NULL,
    [prt_client_id] NVARCHAR (32)   NULL,
    [untqty]        INT             NOT NULL,
    [pndqvl]        NUMERIC (19, 4) NULL,
    [asset_typ]     NVARCHAR (30)   NULL,
    [rowid]         INT             IDENTITY (1, 1) NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [qvlwrk_idx1]
    ON [dbo].[qvlwrk]([stoloc] ASC, [prtnum] ASC, [untqty] ASC, [wh_id] ASC, [prt_client_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [qvlwrk_idx2]
    ON [dbo].[qvlwrk]([stoloc] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [qvlwrk_idx3]
    ON [dbo].[qvlwrk]([asset_typ] ASC) WITH (FILLFACTOR = 90);


GO
CREATE UNIQUE NONCLUSTERED INDEX [qvlwrk_rowid]
    ON [dbo].[qvlwrk]([rowid] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The pending QVL work table is used to represent outstanding commits against a location pndqvl value.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'qvlwrk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'qvlwrk', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Storage location which received a bump in pndqvl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'qvlwrk', @level2type = N'COLUMN', @level2name = N'stoloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item number for which the bump was given.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'qvlwrk', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client ID which owns the item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'qvlwrk', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unit quantity which composed the original storage request.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'qvlwrk', @level2type = N'COLUMN', @level2name = N'untqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The amount by which the pndqvl was incremented.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'qvlwrk', @level2type = N'COLUMN', @level2name = N'pndqvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Type - Asset Type of the source inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'qvlwrk', @level2type = N'COLUMN', @level2name = N'asset_typ';

