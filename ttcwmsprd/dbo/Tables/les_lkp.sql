CREATE TABLE [dbo].[les_lkp] (
    [lkp_id]         NVARCHAR (20)   NOT NULL,
    [cust_lvl]       INT             NOT NULL,
    [lkp_cmd]        NVARCHAR (2000) NOT NULL,
    [static_cmd_flg] INT             DEFAULT ((0)) NOT NULL,
    [lkp_comp]       NVARCHAR (40)   NULL,
    [ret_fld]        NVARCHAR (256)  NULL,
    [grp_nam]        NVARCHAR (40)   NULL,
    CONSTRAINT [les_lkp_pk] PRIMARY KEY CLUSTERED ([lkp_id] ASC, [cust_lvl] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [les_lkp_static_ck] CHECK ([static_cmd_flg]=(0) OR [static_cmd_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains lookup command information used in variable lookups (les_var_lkp) and valid possibilities (les_var_vp).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_lkp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_lkp', @level2type = N'COLUMN', @level2name = N'lkp_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows different customization levels for customer and project teams.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_lkp', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'MOCA component used to return data.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_lkp', @level2type = N'COLUMN', @level2name = N'lkp_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates the lookup command is static, that it always returns the same data. Using this flag improves performance of the client by caching the returned result set. Currently, this is only supported in conjunction with valid possibilities (les_var_vp - ComboBoxes).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_lkp', @level2type = N'COLUMN', @level2name = N'static_cmd_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ClassID of Active X component used to display a lookup dialog.  Not currently used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_lkp', @level2type = N'COLUMN', @level2name = N'lkp_comp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Comma-delimited list of column values to return from the lookup dialog.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_lkp', @level2type = N'COLUMN', @level2name = N'ret_fld';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_lkp', @level2type = N'COLUMN', @level2name = N'grp_nam';

