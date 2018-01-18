CREATE TABLE [dbo].[carpak] (
    [carcod]           NVARCHAR (10) NOT NULL,
    [srvlvl]           NVARCHAR (10) NOT NULL,
    [paktyp]           NVARCHAR (3)  NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [carpak_pk] PRIMARY KEY CLUSTERED ([carcod] ASC, [srvlvl] ASC, [paktyp] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines package types allowed by carriers.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carpak';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carrier Code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carpak', @level2type = N'COLUMN', @level2name = N'carcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Level.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carpak', @level2type = N'COLUMN', @level2name = N'srvlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Packaging Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carpak', @level2type = N'COLUMN', @level2name = N'paktyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carpak', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carpak', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carpak', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carpak', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

