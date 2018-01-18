CREATE TABLE [dbo].[devcls_function_dtl] (
    [devcls]           NVARCHAR (1)  NOT NULL,
    [dev_function]     INT           NOT NULL,
    [oprcod]           NVARCHAR (9)  NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [devcls_function_dtl_pk] PRIMARY KEY CLUSTERED ([devcls] ASC, [dev_function] ASC, [oprcod] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The devcls_function table contains directed work operation codes that are valid for a specific device class function.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'devcls_function_dtl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Device Class.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'devcls_function_dtl', @level2type = N'COLUMN', @level2name = N'devcls';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The function supported by the device class.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'devcls_function_dtl', @level2type = N'COLUMN', @level2name = N'dev_function';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Operation Code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'devcls_function_dtl', @level2type = N'COLUMN', @level2name = N'oprcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'devcls_function_dtl', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'devcls_function_dtl', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'devcls_function_dtl', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'devcls_function_dtl', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'devcls_function_dtl', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

