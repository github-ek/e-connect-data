CREATE TABLE [dbo].[cntsch] (
    [cnt_id]        NVARCHAR (32) NOT NULL,
    [wh_id]         NVARCHAR (32) NOT NULL,
    [seqnum]        INT           NOT NULL,
    [prtnum]        NVARCHAR (50) NULL,
    [prt_client_id] NVARCHAR (32) NULL,
    [stoloc]        NVARCHAR (20) NULL,
    [schdte]        DATETIME      NULL,
    [reqtyp]        NVARCHAR (1)  NULL,
    CONSTRAINT [cntsch_pk] PRIMARY KEY CLUSTERED ([seqnum] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Count ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cntsch', @level2type = N'COLUMN', @level2name = N'cnt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cntsch', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cntsch', @level2type = N'COLUMN', @level2name = N'seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cntsch', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Client ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cntsch', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Storage Location', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cntsch', @level2type = N'COLUMN', @level2name = N'stoloc';

