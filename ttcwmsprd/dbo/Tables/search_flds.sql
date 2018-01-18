CREATE TABLE [dbo].[search_flds] (
    [search_cfg_id] NVARCHAR (20) NOT NULL,
    [cust_lvl]      INT           NOT NULL,
    [var_nam]       NVARCHAR (40) NOT NULL,
    [ena_flg]       INT           DEFAULT ((1)) NULL,
    [dspl_only_flg] INT           DEFAULT ((0)) NULL,
    [srtseq]        INT           NULL,
    [grp_nam]       NVARCHAR (40) NULL,
    CONSTRAINT [search_flds_pk] PRIMARY KEY CLUSTERED ([search_cfg_id] ASC, [cust_lvl] ASC, [var_nam] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table holds the fields available to a search configuration.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'search_flds';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique search configuration id.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'search_flds', @level2type = N'COLUMN', @level2name = N'search_cfg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The customization level', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'search_flds', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The var name of the displayed search column', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'search_flds', @level2type = N'COLUMN', @level2name = N'var_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag specifying whether the field is enabled.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'search_flds', @level2type = N'COLUMN', @level2name = N'ena_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag for specifying the as display only.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'search_flds', @level2type = N'COLUMN', @level2name = N'dspl_only_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sort sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'search_flds', @level2type = N'COLUMN', @level2name = N'srtseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Group Name for the Data.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'search_flds', @level2type = N'COLUMN', @level2name = N'grp_nam';

