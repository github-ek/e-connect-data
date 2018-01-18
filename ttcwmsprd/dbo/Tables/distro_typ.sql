CREATE TABLE [dbo].[distro_typ] (
    [distro_typ]       NVARCHAR (40) NOT NULL,
    [distro_rule_set]  NVARCHAR (10) NULL,
    [overage_rule_set] NVARCHAR (10) NULL,
    [distro_timing]    NVARCHAR (4)  NULL,
    [requir_tms_flg]   INT           DEFAULT ((0)) NULL,
    [distro_lead_time] INT           NULL,
    [adj_open_rec_flg] INT           DEFAULT ((0)) NULL,
    [mod_usr_id]       NVARCHAR (40) NULL,
    [moddte]           DATETIME      NULL,
    [ins_dt]           DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_dt]      DATETIME      NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [distro_typ_pk] PRIMARY KEY CLUSTERED ([distro_typ] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [distyp_adjoprc_ck] CHECK ([adj_open_rec_flg]=(0) OR [adj_open_rec_flg]=(1)),
    CONSTRAINT [distyp_reqtms_ck] CHECK ([requir_tms_flg]=(0) OR [requir_tms_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines the strategy to be used for distribution.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Distribution Type - The method to fill distro.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_typ', @level2type = N'COLUMN', @level2name = N'distro_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The rule set is a group of rules to be applied for a distribution type.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_typ', @level2type = N'COLUMN', @level2name = N'distro_rule_set';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The overage rule set is a group of rules used when distributing inventory overages.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_typ', @level2type = N'COLUMN', @level2name = N'overage_rule_set';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sets the trigger point for distribution to occur.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_typ', @level2type = N'COLUMN', @level2name = N'distro_timing';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'TMS Planning Required.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_typ', @level2type = N'COLUMN', @level2name = N'requir_tms_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Distribution Lead Time. The number of hours that distribution receipts for this type will take to process to completion upon arrival to the warehouse. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_typ', @level2type = N'COLUMN', @level2name = N'distro_lead_time';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Adjust Open Receipt Flag.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_typ', @level2type = N'COLUMN', @level2name = N'adj_open_rec_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Modified User.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_typ', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modification date.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_typ', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_typ', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_typ', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_typ', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_typ', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

