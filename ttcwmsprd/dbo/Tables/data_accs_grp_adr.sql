CREATE TABLE [dbo].[data_accs_grp_adr] (
    [accs_grp_nam]     NVARCHAR (40) NOT NULL,
    [adr_id]           NVARCHAR (20) NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_dt]      DATETIME      NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    [pckup_flg]        INT           NOT NULL,
    [dlv_flg]          INT           NOT NULL,
    CONSTRAINT [dag_adr_pk] PRIMARY KEY CLUSTERED ([accs_grp_nam] ASC, [adr_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Associate a Data Access Group with an authorized customer address.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'data_accs_grp_adr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Access Group Name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'data_accs_grp_adr', @level2type = N'COLUMN', @level2name = N'accs_grp_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Address ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'data_accs_grp_adr', @level2type = N'COLUMN', @level2name = N'adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert Date.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'data_accs_grp_adr', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert User ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'data_accs_grp_adr', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Update Date.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'data_accs_grp_adr', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Update User ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'data_accs_grp_adr', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'When true, indicates the address is authorized when viewed as a pickup location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'data_accs_grp_adr', @level2type = N'COLUMN', @level2name = N'pckup_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'When true, indicates the address is authorized when viewed as a delivery location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'data_accs_grp_adr', @level2type = N'COLUMN', @level2name = N'dlv_flg';

