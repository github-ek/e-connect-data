CREATE TABLE [dbo].[arcdtl] (
    [arc_nam]       NVARCHAR (30)   NOT NULL,
    [seqnum]        INT             NOT NULL,
    [srtseq]        INT             NULL,
    [arc_table]     NVARCHAR (30)   NOT NULL,
    [list_cmd]      NVARCHAR (3000) NOT NULL,
    [post_arc_cmd]  NVARCHAR (3000) NULL,
    [action_on_dup] NVARCHAR (1)    NULL,
    CONSTRAINT [arcdtl_pk] PRIMARY KEY CLUSTERED ([arc_nam] ASC, [seqnum] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Contains the archive information for the driving table of an archive', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arcdtl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of the archive set', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arcdtl', @level2type = N'COLUMN', @level2name = N'arc_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the key so we can have multiples', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arcdtl', @level2type = N'COLUMN', @level2name = N'seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the sequence the details are processed in', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arcdtl', @level2type = N'COLUMN', @level2name = N'srtseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'List command that will determine the rows that should be archived', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arcdtl', @level2type = N'COLUMN', @level2name = N'list_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Component to be processed after each driving table processing cycle has completed', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arcdtl', @level2type = N'COLUMN', @level2name = N'post_arc_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Action to take on duplicate row error during insert', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arcdtl', @level2type = N'COLUMN', @level2name = N'action_on_dup';

