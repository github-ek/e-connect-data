CREATE TABLE [dbo].[insmst] (
    [inskey]           NVARCHAR (30) NOT NULL,
    [opt_nam]          NVARCHAR (50) NULL,
    [oprcod]           NVARCHAR (9)  NULL,
    [chkflg]           INT           NOT NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [insmst_pk] PRIMARY KEY CLUSTERED ([inskey] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'insmst', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'insmst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Instruction key of the instruction to be performed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'insmst', @level2type = N'COLUMN', @level2name = N'inskey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Operation Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'insmst', @level2type = N'COLUMN', @level2name = N'oprcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check Flag', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'insmst', @level2type = N'COLUMN', @level2name = N'chkflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'insmst', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'insmst', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'insmst', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'insmst', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'insmst', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

