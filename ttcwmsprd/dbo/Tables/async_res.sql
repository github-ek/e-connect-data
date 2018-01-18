CREATE TABLE [dbo].[async_res] (
    [async_res_id]     INT            NOT NULL,
    [client_id]        NVARCHAR (32)  NOT NULL,
    [wh_id]            NVARCHAR (32)  NOT NULL,
    [async_sts]        NVARCHAR (30)  NOT NULL,
    [async_typ]        NVARCHAR (40)  NOT NULL,
    [progress]         INT            NULL,
    [credte]           DATETIME       NOT NULL,
    [cmpdte]           DATETIME       NULL,
    [errcod]           NVARCHAR (16)  NULL,
    [errmsg]           NVARCHAR (256) NULL,
    [res_id]           NVARCHAR (60)  NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [async_res_pk] PRIMARY KEY CLUSTERED ([async_res_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asynchronous Resource is used to store and track the state of Moca commands executed asynchronously', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'async_res';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Table PK.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'async_res', @level2type = N'COLUMN', @level2name = N'async_res_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client ID - Client that owns the asynchronous operation.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'async_res', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID of warehouse that owns the asynchronous operation.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'async_res', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Status indicating the state of the asynchronous moca command execution (e.g. INPROGRESS, COMPLETE, FAILURE).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'async_res', @level2type = N'COLUMN', @level2name = N'async_sts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Categorizes asynchronous executions into types so they can be logically grouped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'async_res', @level2type = N'COLUMN', @level2name = N'async_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Integer representation of progress ranging from 0-100%.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'async_res', @level2type = N'COLUMN', @level2name = N'progress';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the asynchronous moca command was submitted to the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'async_res', @level2type = N'COLUMN', @level2name = N'credte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the asynchronous moca command completed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'async_res', @level2type = N'COLUMN', @level2name = N'cmpdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Moca error code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'async_res', @level2type = N'COLUMN', @level2name = N'errcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Error message. Populated if the asynchronous operation failed.  Provides the details of how or why.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'async_res', @level2type = N'COLUMN', @level2name = N'errmsg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifier provided by the asynchronous moca command that can be used to obtain the results of the operation. (optional)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'async_res', @level2type = N'COLUMN', @level2name = N'res_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'async_res', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'async_res', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'async_res', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'async_res', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

