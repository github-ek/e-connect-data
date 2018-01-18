CREATE TABLE [dbo].[mtfmsg] (
    [msg_id]     NVARCHAR (40)  NOT NULL,
    [msgtyp]     INT            NOT NULL,
    [msg]        NVARCHAR (200) NULL,
    [mod_usr_id] NVARCHAR (40)  NOT NULL,
    [moddte]     DATETIME       NOT NULL,
    CONSTRAINT [mtfmsg_pk] PRIMARY KEY CLUSTERED ([msg_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table stores message for MTF devices.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mtfmsg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier for the message.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mtfmsg', @level2type = N'COLUMN', @level2name = N'msg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of message (i.e. shutdown, message).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mtfmsg', @level2type = N'COLUMN', @level2name = N'msgtyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The message.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mtfmsg', @level2type = N'COLUMN', @level2name = N'msg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user that last changed this this message.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mtfmsg', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last time this message was modified.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mtfmsg', @level2type = N'COLUMN', @level2name = N'moddte';

