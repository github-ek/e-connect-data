CREATE TABLE [dbo].[les_cmd] (
    [les_cmd_id] NVARCHAR (50)   NOT NULL,
    [cust_lvl]   INT             NOT NULL,
    [syntax]     NVARCHAR (4000) NOT NULL,
    [moddte]     DATETIME        NULL,
    [mod_usr_id] NVARCHAR (40)   NULL,
    [grp_nam]    NVARCHAR (40)   NULL,
    CONSTRAINT [les_cmd_pk] PRIMARY KEY CLUSTERED ([les_cmd_id] ASC, [cust_lvl] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is used to specify commands that can be used in multiple places.  These are typically called from the client application.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows different customization levels for customer and project teams.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_cmd', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'MOCA component used to return data.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_cmd', @level2type = N'COLUMN', @level2name = N'syntax';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_cmd', @level2type = N'COLUMN', @level2name = N'grp_nam';

