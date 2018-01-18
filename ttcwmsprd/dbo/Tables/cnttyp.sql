CREATE TABLE [dbo].[cnttyp] (
    [cnttyp]           NVARCHAR (3)  NOT NULL,
    [oprcod]           NVARCHAR (9)  NULL,
    [lpncnt_oprcod]    NVARCHAR (9)  NULL,
    [dtl_flg]          INT           NULL,
    [end_loc_cnt]      NVARCHAR (3)  NULL,
    [nxt_cnttyp]       NVARCHAR (3)  NULL,
    [sum_retry_flg]    INT           NULL,
    [cls_loc_cnt_mthd] NVARCHAR (2)  NOT NULL,
    [emp_loc_flg]      INT           NULL,
    [adj_mthd]         NVARCHAR (3)  NULL,
    [homog_adj_flg]    INT           DEFAULT ((0)) NOT NULL,
    [rf_prmpt_rea_flg] INT           DEFAULT ((1)) NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_usr_id]       NVARCHAR (40) NULL,
    [last_upd_usr_id]  NVARCHAR (40) NULL,
    [diff_usr_flg]     INT           DEFAULT ((1)) NOT NULL,
    CONSTRAINT [cnttyp_pk] PRIMARY KEY CLUSTERED ([cnttyp] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [cnttyp_dtl_flgck] CHECK ([dtl_flg]=(0) OR [dtl_flg]=(1)),
    CONSTRAINT [cnttyp_emp_flgck] CHECK ([emp_loc_flg]=(0) OR [emp_loc_flg]=(1)),
    CONSTRAINT [cnttyp_homadjflg] CHECK ([homog_adj_flg]=(0) OR [homog_adj_flg]=(1)),
    CONSTRAINT [cnttyp_prmtrcod] CHECK ([rf_prmpt_rea_flg]=(0) OR [rf_prmpt_rea_flg]=(1)),
    CONSTRAINT [cnttyp_sum_flgck] CHECK ([sum_retry_flg]=(0) OR [sum_retry_flg]=(1)),
    CONSTRAINT [cnttypdiff_usr_flg] CHECK ([diff_usr_flg]=(0) OR [diff_usr_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Count Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnttyp', @level2type = N'COLUMN', @level2name = N'cnttyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Operation Code associated with the count type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnttyp', @level2type = N'COLUMN', @level2name = N'oprcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'LPN Count Operation Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnttyp', @level2type = N'COLUMN', @level2name = N'lpncnt_oprcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Detail Flag - What screen is used to capture user entry? 0: use summary screen; 1: use detail screen', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnttyp', @level2type = N'COLUMN', @level2name = N'dtl_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'End Location Count - Specifies when a location''s count is complete.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnttyp', @level2type = N'COLUMN', @level2name = N'end_loc_cnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Next Count Type - What count type is generated if another count needs to be generated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnttyp', @level2type = N'COLUMN', @level2name = N'nxt_cnttyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Summary Retry Flag - Specifies whether users get a second chance to enter in the quantity during a summary count if their original entry was not what the system expected.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnttyp', @level2type = N'COLUMN', @level2name = N'sum_retry_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Empty Location Flag - Specifies whether or not to count empty locations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnttyp', @level2type = N'COLUMN', @level2name = N'emp_loc_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag indicating whether or not adjustments are allowed for summary counts for this count type.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnttyp', @level2type = N'COLUMN', @level2name = N'homog_adj_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag for whether or not to prompt for a reason code for the summary adjustment.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnttyp', @level2type = N'COLUMN', @level2name = N'rf_prmpt_rea_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Different User Flag - To Identify if the same user is allowed to do the audit counts.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnttyp', @level2type = N'COLUMN', @level2name = N'diff_usr_flg';

