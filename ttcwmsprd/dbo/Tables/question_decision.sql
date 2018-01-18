CREATE TABLE [dbo].[question_decision] (
    [question_id]      INT           NOT NULL,
    [question_set]     NVARCHAR (30) NOT NULL,
    [resp_path]        INT           NOT NULL,
    [next_question]    INT           NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [question_decision_pk] PRIMARY KEY CLUSTERED ([question_id] ASC, [question_set] ASC, [next_question] ASC, [resp_path] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The question_decision table is used for setting up which is the next path after user set the decision for previous question', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'question_decision';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Question ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'question_decision', @level2type = N'COLUMN', @level2name = N'question_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The path where questions will be set', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'question_decision', @level2type = N'COLUMN', @level2name = N'question_set';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The response path ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'question_decision', @level2type = N'COLUMN', @level2name = N'resp_path';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The next question ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'question_decision', @level2type = N'COLUMN', @level2name = N'next_question';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'question_decision', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'question_decision', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'question_decision', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'question_decision', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

