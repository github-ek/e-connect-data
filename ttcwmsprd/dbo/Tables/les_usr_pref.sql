CREATE TABLE [dbo].[les_usr_pref] (
    [usr_id]   NVARCHAR (40) NOT NULL,
    [pref_id]  NVARCHAR (40) NOT NULL,
    [pref_val] NVARCHAR (20) NULL,
    [grp_nam]  NVARCHAR (40) NULL,
    CONSTRAINT [les_usr_pref_pk] PRIMARY KEY CLUSTERED ([usr_id] ASC, [pref_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table holds user preference data for the MCS framework.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_pref';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_pref', @level2type = N'COLUMN', @level2name = N'usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_pref', @level2type = N'COLUMN', @level2name = N'pref_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the value for the preference defined by pref_id.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_pref', @level2type = N'COLUMN', @level2name = N'pref_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_pref', @level2type = N'COLUMN', @level2name = N'grp_nam';

