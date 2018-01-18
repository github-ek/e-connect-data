CREATE TABLE [dbo].[autlin] (
    [stoloc]           NVARCHAR (20) NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [app_timeout]      INT           NULL,
    [app_err_flg]      INT           NULL,
    [caslbldev]        NVARCHAR (20) NULL,
    [pallbldev]        NVARCHAR (20) NULL,
    [palzrflg]         INT           NULL,
    [prtcaslbl_flg]    INT           NULL,
    [prtpallbl_flg]    INT           NULL,
    [pal_stoloc]       NVARCHAR (20) NULL,
    [sngpal_flg]       INT           NULL,
    [sngprt_flg]       INT           NULL,
    [replace_errtag]   INT           NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [autlin_pk] PRIMARY KEY CLUSTERED ([stoloc] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [autlin_app_err_ck] CHECK ([app_err_flg]=(0) OR [app_err_flg]=(1)),
    CONSTRAINT [autlin_palzrflg_ck] CHECK ([palzrflg]=(0) OR [palzrflg]=(1)),
    CONSTRAINT [autlin_prtcas_ck] CHECK ([prtcaslbl_flg]=(0) OR [prtcaslbl_flg]=(1)),
    CONSTRAINT [autlin_prtpal_ck] CHECK ([prtpallbl_flg]=(0) OR [prtpallbl_flg]=(1)),
    CONSTRAINT [autlin_rep_err_ck] CHECK ([replace_errtag]=(0) OR [replace_errtag]=(1)),
    CONSTRAINT [autlin_sngpal_ck] CHECK ([sngpal_flg]=(0) OR [sngpal_flg]=(1)),
    CONSTRAINT [autlin_sngprt_ck] CHECK ([sngprt_flg]=(0) OR [sngprt_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The automation line table is used for setting up the parameters for an automated tagging line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'autlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Storage Location - The storage location for the automation line .', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'autlin', @level2type = N'COLUMN', @level2name = N'stoloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - The warehouse where the line is located.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'autlin', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Applicator Timeout - The number of seconds until an applicator times out.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'autlin', @level2type = N'COLUMN', @level2name = N'app_timeout';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Applicator Error Flag - Indicates whether the line should generate error when timeout occurs.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'autlin', @level2type = N'COLUMN', @level2name = N'app_err_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Case Label Device - the device that is used to print the case label', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'autlin', @level2type = N'COLUMN', @level2name = N'caslbldev';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pallet Label Device - the device that is used to print the pallet label.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'autlin', @level2type = N'COLUMN', @level2name = N'pallbldev';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Palletizer Flag - indicates the type of palletization that occurs at time (0=no palletization, 1=palletization).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'autlin', @level2type = N'COLUMN', @level2name = N'palzrflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Print Case Label Flag - indicates whether to print the case label.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'autlin', @level2type = N'COLUMN', @level2name = N'prtcaslbl_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Print Pallet Label Flag - indicates whether to print the pallet label.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'autlin', @level2type = N'COLUMN', @level2name = N'prtpallbl_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pallet Storage Location - indicates the automation line to be used for applying pallet label', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'autlin', @level2type = N'COLUMN', @level2name = N'pal_stoloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Single Pallet Flag - indicates whether the line can only handle a single pallet or multiple.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'autlin', @level2type = N'COLUMN', @level2name = N'sngpal_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'single Item Flag - indicates whether the line can only handle a single item number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'autlin', @level2type = N'COLUMN', @level2name = N'sngprt_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Replace Erred Tag - indicates whether erred tags should be replaced (1) or reused.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'autlin', @level2type = N'COLUMN', @level2name = N'replace_errtag';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'autlin', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'autlin', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'autlin', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'autlin', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'autlin', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

