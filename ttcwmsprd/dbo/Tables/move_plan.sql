CREATE TABLE [dbo].[move_plan] (
    [move_plan_id]     NVARCHAR (16) NOT NULL,
    [move_typ]         NVARCHAR (40) NOT NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_dt]      DATETIME      NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [move_plan_pk] PRIMARY KEY CLUSTERED ([move_plan_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique identifier for this record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'move_plan', @level2type = N'COLUMN', @level2name = N'move_plan_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This determines the type of the move.  Tour,LTL or OTHER', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'move_plan', @level2type = N'COLUMN', @level2name = N'move_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'move_plan', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'move_plan', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'move_plan', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'move_plan', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'move_plan', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

