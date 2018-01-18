CREATE TABLE [dbo].[prgmst] (
    [invsts_prg] NVARCHAR (4) NOT NULL,
    [invsts]     NVARCHAR (4) NOT NULL,
    [srtseq]     INT          NOT NULL,
    [alcflg]     INT          NULL,
    [shpflg]     INT          NULL,
    CONSTRAINT [prgmst_pk] PRIMARY KEY CLUSTERED ([invsts_prg] ASC, [invsts] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [prgmst_alcflg_ck] CHECK ([alcflg]=(0) OR [alcflg]=(1)),
    CONSTRAINT [prgmst_shpflg_ck] CHECK ([shpflg]=(0) OR [shpflg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Inventory Status Progression table is used to define lists of valid inventory statuses to be used for allocation and shipping.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prgmst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Status Progression name. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prgmst', @level2type = N'COLUMN', @level2name = N'invsts_prg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Status. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prgmst', @level2type = N'COLUMN', @level2name = N'invsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sort Sequence. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prgmst', @level2type = N'COLUMN', @level2name = N'srtseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'To determine if the status is valid for allocation. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prgmst', @level2type = N'COLUMN', @level2name = N'alcflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'To determine if the status is valid for shipping. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prgmst', @level2type = N'COLUMN', @level2name = N'shpflg';

