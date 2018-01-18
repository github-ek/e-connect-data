CREATE TABLE [dbo].[state_mst] (
    [ctry_name] NVARCHAR (60) NOT NULL,
    [adrstc]    NVARCHAR (40) NOT NULL,
    [grp_nam]   NVARCHAR (40) NULL,
    CONSTRAINT [state_mst_pk] PRIMARY KEY CLUSTERED ([ctry_name] ASC, [adrstc] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains all state information.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'state_mst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  This defines what country this state belongs to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'state_mst', @level2type = N'COLUMN', @level2name = N'ctry_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier. This is the code of the state.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'state_mst', @level2type = N'COLUMN', @level2name = N'adrstc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'state_mst', @level2type = N'COLUMN', @level2name = N'grp_nam';

