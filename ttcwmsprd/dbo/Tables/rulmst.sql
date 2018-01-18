CREATE TABLE [dbo].[rulmst] (
    [rule_nam]    NVARCHAR (20)   NOT NULL,
    [chg_carlvl]  NVARCHAR (30)   NOT NULL,
    [summary_cmd] NVARCHAR (2000) NULL,
    [cancel_cmd]  NVARCHAR (2000) NULL,
    [moddte]      DATETIME        NULL,
    [mod_usr_id]  NVARCHAR (40)   NULL,
    CONSTRAINT [rulmst_pk] PRIMARY KEY CLUSTERED ([rule_nam] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The rule master table is used to group MOCA componenets together into logical groupings that are run for various pieces of functionality .', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rulmst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique Identifier for the Rule.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rulmst', @level2type = N'COLUMN', @level2name = N'rule_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Change Carrier Level', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rulmst', @level2type = N'COLUMN', @level2name = N'chg_carlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The command that gets run to show a summary of the data that will get processed during wave planning.  Typically, would be a command that is also used by the wave rules to generate data. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rulmst', @level2type = N'COLUMN', @level2name = N'summary_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Command used in canceling the wave rule', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rulmst', @level2type = N'COLUMN', @level2name = N'cancel_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modification Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rulmst', @level2type = N'COLUMN', @level2name = N'moddte';

