CREATE TABLE [dbo].[sl_async_evt_arg_data] (
    [async_evt_que_seq] NUMERIC (12)   NOT NULL,
    [evt_id]            NVARCHAR (30)  NOT NULL,
    [evt_arg_id]        NVARCHAR (30)  NOT NULL,
    [evt_arg_val]       NVARCHAR (200) NULL,
    CONSTRAINT [sl_asyncevtargdtpk] PRIMARY KEY CLUSTERED ([async_evt_que_seq] ASC, [evt_id] ASC, [evt_arg_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_ncevtargdtfkque] FOREIGN KEY ([async_evt_que_seq]) REFERENCES [dbo].[sl_async_evt_que] ([async_evt_que_seq]) ON DELETE CASCADE
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines asynchronous event queue argument.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_async_evt_arg_data';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The asychronous event queue sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_async_evt_arg_data', @level2type = N'COLUMN', @level2name = N'async_evt_que_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The event name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_async_evt_arg_data', @level2type = N'COLUMN', @level2name = N'evt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The event argument', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_async_evt_arg_data', @level2type = N'COLUMN', @level2name = N'evt_arg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The argument value', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_async_evt_arg_data', @level2type = N'COLUMN', @level2name = N'evt_arg_val';

