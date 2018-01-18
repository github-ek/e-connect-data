CREATE TABLE [dbo].[agepfl] (
    [age_pflnam]       NVARCHAR (30) NOT NULL,
    [invsts]           NVARCHAR (4)  NOT NULL,
    [agecod]           NVARCHAR (1)  NOT NULL,
    [agehrs]           INT           NOT NULL,
    [scpflg]           INT           NULL,
    [expire_flg]       INT           NULL,
    [exp_age_flg]      INT           DEFAULT ((0)) NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [agepfl_pk] PRIMARY KEY CLUSTERED ([age_pflnam] ASC, [invsts] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [agepflexpageflg_ck] CHECK ([exp_age_flg]=(0) OR [exp_age_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The aging profile is the table that defines the sequence of inventory statuses that inventory takes as it ages.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'agepfl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Aging Profile Name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'agepfl', @level2type = N'COLUMN', @level2name = N'age_pflnam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory status', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'agepfl', @level2type = N'COLUMN', @level2name = N'invsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Aging code.  This field is solely for converting the value stored in agehrs into something more readible on the screen.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'agepfl', @level2type = N'COLUMN', @level2name = N'agecod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Age in hours', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'agepfl', @level2type = N'COLUMN', @level2name = N'agehrs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Scrap flag.  Is this a scrap status?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'agepfl', @level2type = N'COLUMN', @level2name = N'scpflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Expiration flag.  Is this an expiration status?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'agepfl', @level2type = N'COLUMN', @level2name = N'expire_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Expiration Aged. When this flag is set, the next inventory status is determined using the time left until expiration, rather than the manufacturing age.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'agepfl', @level2type = N'COLUMN', @level2name = N'exp_age_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'agepfl', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'agepfl', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'agepfl', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'agepfl', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'agepfl', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

