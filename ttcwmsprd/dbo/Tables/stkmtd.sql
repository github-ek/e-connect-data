CREATE TABLE [dbo].[stkmtd] (
    [stkmtd]           NVARCHAR (20) NOT NULL,
    [stklvl]           INT           NOT NULL,
    [redval]           INT           NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [stkmtd_pk] PRIMARY KEY CLUSTERED ([stkmtd] ASC, [stklvl] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stack method for pallet capacity calculation', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'stkmtd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stack Method', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'stkmtd', @level2type = N'COLUMN', @level2name = N'stkmtd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stack Level', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'stkmtd', @level2type = N'COLUMN', @level2name = N'stklvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Reduction Value', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'stkmtd', @level2type = N'COLUMN', @level2name = N'redval';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'stkmtd', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'stkmtd', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'stkmtd', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'stkmtd', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

