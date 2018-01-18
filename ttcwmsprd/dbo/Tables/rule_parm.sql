CREATE TABLE [dbo].[rule_parm] (
    [rule_nam]   NVARCHAR (20) NOT NULL,
    [parm_id]    NVARCHAR (30) NOT NULL,
    [parm_typ]   NVARCHAR (1)  NOT NULL,
    [moddte]     DATETIME      NULL,
    [mod_usr_id] NVARCHAR (40) NULL,
    CONSTRAINT [rule_parm_pk] PRIMARY KEY CLUSTERED ([rule_nam] ASC, [parm_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The rule parmaeter table is used to define the parameters that are valid for a rule.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rule_parm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique Identifier for the Rule.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rule_parm', @level2type = N'COLUMN', @level2name = N'rule_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique identifier for the Parameter. Most often a database field. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rule_parm', @level2type = N'COLUMN', @level2name = N'parm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Type of parameter: (L) list (R) range (N) normal. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rule_parm', @level2type = N'COLUMN', @level2name = N'parm_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modification Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rule_parm', @level2type = N'COLUMN', @level2name = N'moddte';

