CREATE TABLE [dbo].[are_invmix_rule] (
    [arecod]           NVARCHAR (10) NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [tblnme]           NVARCHAR (30) NOT NULL,
    [column_name]      NVARCHAR (30) NOT NULL,
    [srtseq]           INT           NULL,
    [mod_usr_id]       NVARCHAR (40) NULL,
    [moddte]           DATETIME      NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [are_invmix_rule_pk] PRIMARY KEY CLUSTERED ([arecod] ASC, [wh_id] ASC, [tblnme] ASC, [column_name] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The area inventory mixing rule table identifies the area mixing rules.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_invmix_rule';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Area Code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_invmix_rule', @level2type = N'COLUMN', @level2name = N'arecod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_invmix_rule', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Table Name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_invmix_rule', @level2type = N'COLUMN', @level2name = N'tblnme';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Column Name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_invmix_rule', @level2type = N'COLUMN', @level2name = N'column_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sort Sequence.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_invmix_rule', @level2type = N'COLUMN', @level2name = N'srtseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last user to modify the rule', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_invmix_rule', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date/time rule last modified', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_invmix_rule', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_invmix_rule', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_invmix_rule', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_invmix_rule', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_invmix_rule', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

