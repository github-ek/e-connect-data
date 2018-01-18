CREATE TABLE [dbo].[web_var] (
    [ses_id]   NVARCHAR (32)  NOT NULL,
    [query_id] NVARCHAR (10)  NOT NULL,
    [val_key]  NVARCHAR (50)  NOT NULL,
    [val_type] NVARCHAR (2)   NOT NULL,
    [val]      NVARCHAR (MAX) NULL,
    [ctrl_dt]  DATETIME       NOT NULL,
    CONSTRAINT [web_var_pk] PRIMARY KEY CLUSTERED ([ses_id] ASC, [query_id] ASC, [val_key] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Holds query information for the web.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'web_var';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Web client session Id (not MOCA session key).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'web_var', @level2type = N'COLUMN', @level2name = N'ses_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Query identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'web_var', @level2type = N'COLUMN', @level2name = N'query_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for the session variable.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'web_var', @level2type = N'COLUMN', @level2name = N'val_key';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Data type for the session variable.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'web_var', @level2type = N'COLUMN', @level2name = N'val_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Session variable value.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'web_var', @level2type = N'COLUMN', @level2name = N'val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date and time of the last time the session was accessed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'web_var', @level2type = N'COLUMN', @level2name = N'ctrl_dt';

