CREATE TABLE [dbo].[mtfmsg_delv] (
    [msg_id]     NVARCHAR (40) NOT NULL,
    [devcod]     NVARCHAR (20) NOT NULL,
    [wh_id]      NVARCHAR (32) NOT NULL,
    [rcvflg]     INT           NULL,
    [rcvdte]     DATETIME      NULL,
    [expdte]     DATETIME      NULL,
    [mod_usr_id] NVARCHAR (40) NOT NULL,
    [moddte]     DATETIME      NOT NULL,
    [ins_usr_id] NVARCHAR (40) NOT NULL,
    [insdte]     DATETIME      NOT NULL,
    CONSTRAINT [mtfmsg_delv_pk] PRIMARY KEY CLUSTERED ([msg_id] ASC, [devcod] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [mtfmsgdlv_rflgidx]
    ON [dbo].[mtfmsg_delv]([rcvflg] ASC, [devcod] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table stores message deliveries for MTF devices.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mtfmsg_delv';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier for the message.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mtfmsg_delv', @level2type = N'COLUMN', @level2name = N'msg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The device code mesasge should be sent to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mtfmsg_delv', @level2type = N'COLUMN', @level2name = N'devcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - The warehouse assigned for specific messages.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mtfmsg_delv', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If message was received.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mtfmsg_delv', @level2type = N'COLUMN', @level2name = N'rcvflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'When message was received.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mtfmsg_delv', @level2type = N'COLUMN', @level2name = N'rcvdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'When message should expire.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mtfmsg_delv', @level2type = N'COLUMN', @level2name = N'expdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user that last changed this message devlivery.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mtfmsg_delv', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last time this message delivery was modified.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mtfmsg_delv', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user that inserted this message devlivery.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mtfmsg_delv', @level2type = N'COLUMN', @level2name = N'ins_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The time this message delivery was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mtfmsg_delv', @level2type = N'COLUMN', @level2name = N'insdte';

