CREATE TABLE [dbo].[wave_rule] (
    [rule_nam] NVARCHAR (20)   NOT NULL,
    [dumkey]   INT             NOT NULL,
    [cmd]      NVARCHAR (2000) NOT NULL,
    [srtseq]   INT             NOT NULL,
    CONSTRAINT [wave_rule_pk] PRIMARY KEY CLUSTERED ([rule_nam] ASC, [dumkey] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The wave rule table is used to define which MOCA components make up the rule.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wave_rule';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique Identifier for the Rule.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wave_rule', @level2type = N'COLUMN', @level2name = N'rule_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Dummy key value used to make each command unique.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wave_rule', @level2type = N'COLUMN', @level2name = N'dumkey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The MOCA component that gets run.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wave_rule', @level2type = N'COLUMN', @level2name = N'cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The order the command is run in.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wave_rule', @level2type = N'COLUMN', @level2name = N'srtseq';

