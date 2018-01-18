CREATE TABLE [dbo].[auto_alc_rule] (
    [wh_id]            NVARCHAR (32) NOT NULL,
    [auto_alc_num]     NVARCHAR (12) NOT NULL,
    [auto_alc_mtd]     NVARCHAR (40) NOT NULL,
    [rule_type]        NVARCHAR (40) NOT NULL,
    [time_in_mins]     INT           NOT NULL,
    [date_type]        NVARCHAR (40) NOT NULL,
    [ena_flg]          INT           DEFAULT ((0)) NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [auto_alc_rule_pk] PRIMARY KEY CLUSTERED ([auto_alc_num] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [autoalcrule_enaflgck] CHECK ([ena_flg]=(0) OR [ena_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is used to store the auto allocation rules.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'auto_alc_rule';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'auto_alc_rule', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Auto Allocation Rule Number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'auto_alc_rule', @level2type = N'COLUMN', @level2name = N'auto_alc_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Auto Allocation Method.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'auto_alc_rule', @level2type = N'COLUMN', @level2name = N'auto_alc_mtd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allocation Rule Type.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'auto_alc_rule', @level2type = N'COLUMN', @level2name = N'rule_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Time in Minutes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'auto_alc_rule', @level2type = N'COLUMN', @level2name = N'time_in_mins';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date Type.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'auto_alc_rule', @level2type = N'COLUMN', @level2name = N'date_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Enable Flag.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'auto_alc_rule', @level2type = N'COLUMN', @level2name = N'ena_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'auto_alc_rule', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'auto_alc_rule', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'auto_alc_rule', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'auto_alc_rule', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

