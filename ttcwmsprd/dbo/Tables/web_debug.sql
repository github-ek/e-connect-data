CREATE TABLE [dbo].[web_debug] (
    [log_key]     NVARCHAR (32)   NOT NULL,
    [ses_id]      NVARCHAR (32)   NOT NULL,
    [log_type]    NVARCHAR (4)    NOT NULL,
    [log_message] NVARCHAR (4000) NOT NULL,
    [log_file]    NVARCHAR (255)  NULL,
    [log_line]    NVARCHAR (10)   NULL,
    [ctrl_dt]     DATETIME        NULL,
    CONSTRAINT [web_debug_pk] PRIMARY KEY CLUSTERED ([log_key] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Holds client debugging information for web sessions.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'web_debug';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence number that represents the key.  It should be sequential, in general.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'web_debug', @level2type = N'COLUMN', @level2name = N'log_key';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Web client session Id (not MOCA session key).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'web_debug', @level2type = N'COLUMN', @level2name = N'ses_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Type of message logged.  ERR and TRC are two types initially.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'web_debug', @level2type = N'COLUMN', @level2name = N'log_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The actual message logged, limited to 4000 characters.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'web_debug', @level2type = N'COLUMN', @level2name = N'log_message';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The source file from which the message was logged.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'web_debug', @level2type = N'COLUMN', @level2name = N'log_file';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The line number in the source file from which the message was logged.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'web_debug', @level2type = N'COLUMN', @level2name = N'log_line';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date and time of the logged message.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'web_debug', @level2type = N'COLUMN', @level2name = N'ctrl_dt';

