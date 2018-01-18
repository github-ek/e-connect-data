CREATE TABLE [dbo].[locnam] (
    [scmnam]           NVARCHAR (20)  NOT NULL,
    [seqnum]           INT            NOT NULL,
    [colnam]           NVARCHAR (100) NULL,
    [strcon]           NVARCHAR (20)  NULL,
    [strpos]           INT            NULL,
    [strlen]           INT            NULL,
    [rngmsk]           NVARCHAR (20)  NULL,
    [u_version]        INT            NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [locnam_pk] PRIMARY KEY CLUSTERED ([scmnam] ASC, [seqnum] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Location naming scheme table is the table that defines the location naming scheme .', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locnam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The scheme name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locnam', @level2type = N'COLUMN', @level2name = N'scmnam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locnam', @level2type = N'COLUMN', @level2name = N'seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Column name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locnam', @level2type = N'COLUMN', @level2name = N'colnam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Constant string', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locnam', @level2type = N'COLUMN', @level2name = N'strcon';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The position of the string', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locnam', @level2type = N'COLUMN', @level2name = N'strpos';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The length of the string', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locnam', @level2type = N'COLUMN', @level2name = N'strlen';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The range of mask', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locnam', @level2type = N'COLUMN', @level2name = N'rngmsk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locnam', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locnam', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locnam', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locnam', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locnam', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

