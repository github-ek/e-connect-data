CREATE TABLE [dbo].[deferred_exec] (
    [exec_id]      NVARCHAR (20)    NOT NULL,
    [exec_typ]     NVARCHAR (4)     NOT NULL,
    [deferred_cmd] NVARCHAR (2000)  NOT NULL,
    [deferred_dte] DATETIME         NULL,
    [adddte]       DATETIME         NULL,
    [exec_sts]     INT              NULL,
    [exec_dte]     DATETIME         NULL,
    [exec_rows]    INT              NULL,
    [exec_kv1]     NVARCHAR (100)   NULL,
    [exec_kv2]     NVARCHAR (100)   NULL,
    [exec_kv3]     NVARCHAR (100)   NULL,
    [moddte]       DATETIME         NULL,
    [mod_usr_id]   NVARCHAR (40)    NULL,
    [rowid]        UNIQUEIDENTIFIER DEFAULT (newid()) ROWGUIDCOL NULL,
    CONSTRAINT [deferred_exec_pk] PRIMARY KEY CLUSTERED ([exec_id] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [dfrd_exec_exec_typ]
    ON [dbo].[deferred_exec]([exec_typ] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [dfrd_exec_exec_kv]
    ON [dbo].[deferred_exec]([exec_kv1] ASC, [exec_kv2] ASC, [exec_kv3] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [dfrd_exec_exec_sts]
    ON [dbo].[deferred_exec]([exec_sts] ASC) WITH (FILLFACTOR = 90);


GO
CREATE UNIQUE NONCLUSTERED INDEX [dfrd_exec_rowid]
    ON [dbo].[deferred_exec]([rowid] ASC) WITH (FILLFACTOR = 90);

