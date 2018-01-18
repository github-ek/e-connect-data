CREATE TABLE [dbo].[question_mst] (
    [question_id]       INT            NOT NULL,
    [question_set]      NVARCHAR (30)  NOT NULL,
    [message]           NVARCHAR (500) NULL,
    [class_name]        NVARCHAR (100) NULL,
    [resp_path_aff_act] NVARCHAR (100) NULL,
    [resp_path_neg_act] NVARCHAR (100) NULL,
    [ins_dt]            DATETIME       NULL,
    [last_upd_dt]       DATETIME       NULL,
    [ins_user_id]       NVARCHAR (40)  NULL,
    [last_upd_user_id]  NVARCHAR (40)  NULL,
    CONSTRAINT [question_mst_pk] PRIMARY KEY CLUSTERED ([question_id] ASC, [question_set] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The question_mst table is used for setting the questions for while settting up the different path', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'question_mst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Question ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'question_mst', @level2type = N'COLUMN', @level2name = N'question_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The path where questions will be set', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'question_mst', @level2type = N'COLUMN', @level2name = N'question_set';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The message of questions', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'question_mst', @level2type = N'COLUMN', @level2name = N'message';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Class name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'question_mst', @level2type = N'COLUMN', @level2name = N'class_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Response path affirmative action', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'question_mst', @level2type = N'COLUMN', @level2name = N'resp_path_aff_act';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Response path negative action', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'question_mst', @level2type = N'COLUMN', @level2name = N'resp_path_neg_act';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'question_mst', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'question_mst', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'question_mst', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'question_mst', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

