CREATE TABLE [dbo].[archdr] (
    [arc_nam]       NVARCHAR (30)   NOT NULL,
    [arc_table]     NVARCHAR (30)   NOT NULL,
    [list_cmd]      NVARCHAR (3000) NOT NULL,
    [max_rows]      INT             NULL,
    [sts_fil]       NVARCHAR (100)  NULL,
    [purge_flg]     INT             NULL,
    [post_arc_cmd]  NVARCHAR (3000) NULL,
    [action_on_dup] NVARCHAR (1)    NULL,
    CONSTRAINT [archdr_pk] PRIMARY KEY CLUSTERED ([arc_nam] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Contains the archive information for the driving table of an archive', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'archdr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of the archive set', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'archdr', @level2type = N'COLUMN', @level2name = N'arc_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'List command that will determine the rows that should be archived', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'archdr', @level2type = N'COLUMN', @level2name = N'list_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The maximum number of rows to process between commit statements', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'archdr', @level2type = N'COLUMN', @level2name = N'max_rows';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This name of the status file.  If defined, will contain summary info about the archive', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'archdr', @level2type = N'COLUMN', @level2name = N'sts_fil';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Should production data be purged immediately upon being archived', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'archdr', @level2type = N'COLUMN', @level2name = N'purge_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Component to be processed after each driving table processing cycle has completed', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'archdr', @level2type = N'COLUMN', @level2name = N'post_arc_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Action to take on duplicate row error during insert', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'archdr', @level2type = N'COLUMN', @level2name = N'action_on_dup';

