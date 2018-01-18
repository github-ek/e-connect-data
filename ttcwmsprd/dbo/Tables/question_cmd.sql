CREATE TABLE [dbo].[question_cmd] (
    [question_set]     NVARCHAR (30)   NOT NULL,
    [cmd_type]         NVARCHAR (2)    NOT NULL,
    [cmd]              NVARCHAR (2000) NOT NULL,
    [ins_dt]           DATETIME        NULL,
    [last_upd_dt]      DATETIME        NULL,
    [ins_user_id]      NVARCHAR (40)   NULL,
    [last_upd_user_id] NVARCHAR (40)   NULL,
    CONSTRAINT [question_cmd_pk] PRIMARY KEY CLUSTERED ([question_set] ASC, [cmd_type] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The question_cmd table is used for setting up commands which belong to different path', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'question_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The path where questions will be set', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'question_cmd', @level2type = N'COLUMN', @level2name = N'question_set';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Command type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'question_cmd', @level2type = N'COLUMN', @level2name = N'cmd_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Command', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'question_cmd', @level2type = N'COLUMN', @level2name = N'cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'question_cmd', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'question_cmd', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'question_cmd', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'question_cmd', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

