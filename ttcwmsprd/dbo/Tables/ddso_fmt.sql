CREATE TABLE [dbo].[ddso_fmt] (
    [ddso_fmt_id]     NVARCHAR (40) NOT NULL,
    [toolbar_ena_flg] INT           DEFAULT ((0)) NULL,
    [grp_nam]         NVARCHAR (40) NULL,
    CONSTRAINT [ddso_fmt_pk] PRIMARY KEY CLUSTERED ([ddso_fmt_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains all DDSO format definitions.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ddso_fmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is a unique identifier for a defined DDSO output format.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ddso_fmt', @level2type = N'COLUMN', @level2name = N'ddso_fmt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicator for specifying the output format as toolbar supported.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ddso_fmt', @level2type = N'COLUMN', @level2name = N'toolbar_ena_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ddso_fmt', @level2type = N'COLUMN', @level2name = N'grp_nam';

