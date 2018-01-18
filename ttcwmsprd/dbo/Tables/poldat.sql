CREATE TABLE [dbo].[poldat] (
    [polcod]     NVARCHAR (50)   NOT NULL,
    [polvar]     NVARCHAR (50)   NOT NULL,
    [polval]     NVARCHAR (50)   NOT NULL,
    [wh_id_tmpl] NVARCHAR (32)   DEFAULT (N'----') NOT NULL,
    [srtseq]     INT             NOT NULL,
    [rtstr1]     NVARCHAR (150)  NULL,
    [rtstr2]     NVARCHAR (150)  NULL,
    [rtnum1]     INT             NULL,
    [rtnum2]     INT             NULL,
    [rtflt1]     NUMERIC (19, 4) NULL,
    [rtflt2]     NUMERIC (19, 4) NULL,
    [moddte]     DATETIME        NULL,
    [mod_usr_id] NVARCHAR (40)   NULL,
    [grp_nam]    NVARCHAR (40)   NULL,
    CONSTRAINT [poldat_pk] PRIMARY KEY CLUSTERED ([polcod] ASC, [polvar] ASC, [polval] ASC, [wh_id_tmpl] ASC, [srtseq] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [poldat_idx]
    ON [dbo].[poldat]([polvar] ASC, [polval] ASC, [wh_id_tmpl] ASC, [polcod] ASC, [srtseq] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table provides a means of storing configuration data by components and applications.  Any system component can uses this table to store relevant configuration data.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'poldat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Represents a top-level grouping of policies.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'poldat', @level2type = N'COLUMN', @level2name = N'polcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Represents a grouping by name of policy variables.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'poldat', @level2type = N'COLUMN', @level2name = N'polvar';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Represents a specific instance of the polvar level.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'poldat', @level2type = N'COLUMN', @level2name = N'polval';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID Template - The wh_id_tmpl= ''----'' will represent a default part that will be shared by all warehouses. An entry with a wh_id_tmpl != ''----'' is an override for that warehouse.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'poldat', @level2type = N'COLUMN', @level2name = N'wh_id_tmpl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Can be used to sort policies or as a unique identifier in policies that have more than one value.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'poldat', @level2type = N'COLUMN', @level2name = N'srtseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A string value for this policy.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'poldat', @level2type = N'COLUMN', @level2name = N'rtstr1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A string value for this policy.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'poldat', @level2type = N'COLUMN', @level2name = N'rtstr2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An integer value for this policy.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'poldat', @level2type = N'COLUMN', @level2name = N'rtnum1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An integer value for this policy.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'poldat', @level2type = N'COLUMN', @level2name = N'rtnum2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A floating point value for this policy.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'poldat', @level2type = N'COLUMN', @level2name = N'rtflt1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A floating point value for this policy.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'poldat', @level2type = N'COLUMN', @level2name = N'rtflt2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date this policy was last modified.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'poldat', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User id of the user last modifying this policy.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'poldat', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'poldat', @level2type = N'COLUMN', @level2name = N'grp_nam';

