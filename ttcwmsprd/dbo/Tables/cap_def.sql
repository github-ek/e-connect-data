CREATE TABLE [dbo].[cap_def] (
    [cap_cod]          NVARCHAR (40) NOT NULL,
    [cap_tbl]          NVARCHAR (30) NOT NULL,
    [cap_col]          NVARCHAR (30) NOT NULL,
    [cap_typ]          NVARCHAR (5)  NOT NULL,
    [cap_color]        NVARCHAR (20) NOT NULL,
    [cap_seq]          INT           NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [cap_def_pk] PRIMARY KEY CLUSTERED ([cap_cod] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Dock Capacity Definition.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cap_def';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'capacity code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cap_def', @level2type = N'COLUMN', @level2name = N'cap_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'table name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cap_def', @level2type = N'COLUMN', @level2name = N'cap_tbl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'column name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cap_def', @level2type = N'COLUMN', @level2name = N'cap_col';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'capacity type (either sum or count).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cap_def', @level2type = N'COLUMN', @level2name = N'cap_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'color of capacity in dock scheduler.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cap_def', @level2type = N'COLUMN', @level2name = N'cap_color';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'sequence of capacity in dock scheduler.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cap_def', @level2type = N'COLUMN', @level2name = N'cap_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the session was created.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cap_def', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the session was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cap_def', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of the user who created the session.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cap_def', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of the user who last updated the session.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cap_def', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

