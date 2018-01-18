CREATE TABLE [dbo].[invdtl_pck] (
    [dtlnum]     NVARCHAR (30) NOT NULL,
    [wrkref]     NVARCHAR (12) NULL,
    [wrkref_dtl] NVARCHAR (15) NULL,
    [xdkref]     NVARCHAR (10) NULL,
    CONSTRAINT [invdtl_pck_pk] PRIMARY KEY CLUSTERED ([dtlnum] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The table is used to keep track of assigned inventory details for cross-dock references and pick work references.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl_pck';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Detail Number - the detail that assigned to a cross-dock reference or a pick work reference.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl_pck', @level2type = N'COLUMN', @level2name = N'dtlnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pick work reference', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl_pck', @level2type = N'COLUMN', @level2name = N'wrkref';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pick Work Detail ID - The unique identifier of the pick work detail record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl_pck', @level2type = N'COLUMN', @level2name = N'wrkref_dtl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Cross-Dock Reference', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invdtl_pck', @level2type = N'COLUMN', @level2name = N'xdkref';

