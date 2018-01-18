CREATE TABLE [dbo].[les_usr_ath] (
    [usr_id]            NVARCHAR (40)   NOT NULL,
    [login_id]          NVARCHAR (40)   NULL,
    [usr_pswd]          NVARCHAR (128)  NULL,
    [locale_id]         NVARCHAR (20)   NOT NULL,
    [usr_sts]           NVARCHAR (1)    NULL,
    [super_usr_flg]     INT             NULL,
    [acct_expir_dat]    DATETIME        NULL,
    [pswd_chg_dat]      DATETIME        NULL,
    [pswd_chg_flg]      INT             NULL,
    [pswd_expir_flg]    INT             NULL,
    [adr_id]            NVARCHAR (20)   NULL,
    [client_id]         NVARCHAR (32)   NULL,
    [lmsdte]            DATETIME        NULL,
    [lst_dat]           DATETIME        NULL,
    [lst_logout_dte]    DATETIME        NULL,
    [intruder_cnt]      INT             NULL,
    [single_signon_flg] INT             DEFAULT ((0)) NULL,
    [ext_ath_flg]       INT             DEFAULT ((0)) NULL,
    [moddte]            DATETIME        NULL,
    [mod_usr_id]        NVARCHAR (40)   NULL,
    [pin_num]           NVARCHAR (20)   NULL,
    [incentive_flg]     INT             DEFAULT ((0)) NULL,
    [differential_flg]  INT             DEFAULT ((0)) NULL,
    [unmeasured_flg]    INT             DEFAULT ((0)) NULL,
    [payroll_flg]       INT             DEFAULT ((0)) NULL,
    [ath_grp_nam]       NVARCHAR (40)   NULL,
    [cntbck_ena_cod]    NVARCHAR (1)    NULL,
    [adj_thr_cst]       NUMERIC (19, 4) NULL,
    [adj_thr_unit]      INT             NULL,
    [grp_nam]           NVARCHAR (40)   NULL,
    [voc_pin]           NVARCHAR (128)  NULL,
    CONSTRAINT [les_usr_ath_pk] PRIMARY KEY CLUSTERED ([usr_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [lesusrath_ckintcnt] CHECK ([intruder_cnt]>=(0)),
    CONSTRAINT [lesusrath_exflgck] CHECK ([ext_ath_flg]=(0) OR [ext_ath_flg]=(1)),
    CONSTRAINT [lesusrath_pdchflck] CHECK ([pswd_chg_flg]=(0) OR [pswd_chg_flg]=(1)),
    CONSTRAINT [lesusrath_pdexflck] CHECK ([pswd_expir_flg]=(0) OR [pswd_expir_flg]=(1)),
    CONSTRAINT [lesusrath_ssflgck] CHECK ([single_signon_flg]=(0) OR [single_signon_flg]=(1)),
    CONSTRAINT [lesusrath_suflgck] CHECK ([super_usr_flg]=(0) OR [super_usr_flg]=(1)),
    CONSTRAINT [lesusrath_umsdflck] CHECK ([unmeasured_flg]=(0) OR [unmeasured_flg]=(1)),
    CONSTRAINT [lesusrath_usrsts] CHECK ([usr_sts]=N'T' OR [usr_sts]=N'E' OR [usr_sts]=N'I' OR [usr_sts]=N'A')
);


GO
CREATE NONCLUSTERED INDEX [lesusrath_logididx]
    ON [dbo].[les_usr_ath]([login_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table represents a user in the LES suite.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_ath';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier and user''''s login.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_ath', @level2type = N'COLUMN', @level2name = N'usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This field is an alternate id for the user.  This is typically the long or full user name for a user.  Typically used for passport and single-sign on verifications.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_ath', @level2type = N'COLUMN', @level2name = N'login_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user password', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_ath', @level2type = N'COLUMN', @level2name = N'usr_pswd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the default locale for this user.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_ath', @level2type = N'COLUMN', @level2name = N'locale_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Values: A=Active, I=Inactive, E=Expired', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_ath', @level2type = N'COLUMN', @level2name = N'usr_sts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to indicate the user is a super user, meaning they have access to all functionality on the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_ath', @level2type = N'COLUMN', @level2name = N'super_usr_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this field is not null, it defines the date this user''''s account expires.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_ath', @level2type = N'COLUMN', @level2name = N'acct_expir_dat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this field is not null, it defines the date this user must change their password.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_ath', @level2type = N'COLUMN', @level2name = N'pswd_chg_dat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this flag is set, it forces the user to change their password.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_ath', @level2type = N'COLUMN', @level2name = N'pswd_chg_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this flag is set, the password will expire on the the pswd_chg_dat.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_ath', @level2type = N'COLUMN', @level2name = N'pswd_expir_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This points to the address information for a user.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_ath', @level2type = N'COLUMN', @level2name = N'adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This field ties this user to a specific client for a 3PL system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_ath', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'LMS Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_ath', @level2type = N'COLUMN', @level2name = N'lmsdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the last time this user logged into the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_ath', @level2type = N'COLUMN', @level2name = N'lst_dat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A count of any invalid logins against this user.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_ath', @level2type = N'COLUMN', @level2name = N'intruder_cnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates user uses single signon processing', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_ath', @level2type = N'COLUMN', @level2name = N'single_signon_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'External Authentication/Authorization Flag.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_ath', @level2type = N'COLUMN', @level2name = N'ext_ath_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last time this user''''s information was modified.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_ath', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user that last changed this user''''s information.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_ath', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used by CompTrak as a secondary user identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_ath', @level2type = N'COLUMN', @level2name = N'pin_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used by CompTrak for incentive pay', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_ath', @level2type = N'COLUMN', @level2name = N'incentive_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used by CompTrak for differential pay', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_ath', @level2type = N'COLUMN', @level2name = N'differential_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used by LM to signify a dummy user (ie. dock door, in line scanner) that users can work against.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_ath', @level2type = N'COLUMN', @level2name = N'unmeasured_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies an authorization sub-group to which the user belongs.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_ath', @level2type = N'COLUMN', @level2name = N'ath_grp_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used by WM to indicates under which condition the count back should be performed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_ath', @level2type = N'COLUMN', @level2name = N'cntbck_ena_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User adjustment threshold cost value.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_ath', @level2type = N'COLUMN', @level2name = N'adj_thr_cst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User adjustment threshold unit value.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_ath', @level2type = N'COLUMN', @level2name = N'adj_thr_unit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_ath', @level2type = N'COLUMN', @level2name = N'grp_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Voice PIN.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_ath', @level2type = N'COLUMN', @level2name = N'voc_pin';

