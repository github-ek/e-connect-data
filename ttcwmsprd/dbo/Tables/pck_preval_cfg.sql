CREATE TABLE [dbo].[pck_preval_cfg] (
    [pck_preval_id]    NVARCHAR (40) NOT NULL,
    [wrktyp]           NVARCHAR (1)  NOT NULL,
    [info_cd]          NVARCHAR (40) NOT NULL,
    [action_cd]        NVARCHAR (40) NOT NULL,
    [skip_limit]       INT           DEFAULT ((0)) NOT NULL,
    [cancod]           NVARCHAR (40) NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [preval_cfg_pk] PRIMARY KEY CLUSTERED ([pck_preval_id] ASC, [wrktyp] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pre-Validation Scheme Configuration', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pck_preval_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pick Pre Validation Scheme ID  - Validation Scheme ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pck_preval_cfg', @level2type = N'COLUMN', @level2name = N'pck_preval_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Work Type  - Work Type .', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pck_preval_cfg', @level2type = N'COLUMN', @level2name = N'wrktyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Information Level Code  - The level of information that is communicated to the user when a prevalidation fails.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pck_preval_cfg', @level2type = N'COLUMN', @level2name = N'info_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Action Code  - Action taken when pre-validation fails.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pck_preval_cfg', @level2type = N'COLUMN', @level2name = N'action_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Skip Limit  - Number of times a pick can be skiped before it will be canceled.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pck_preval_cfg', @level2type = N'COLUMN', @level2name = N'skip_limit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Cancel Code  - Cancel code system use when pick should be cancelled.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pck_preval_cfg', @level2type = N'COLUMN', @level2name = N'cancod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert Date  - The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pck_preval_cfg', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Update Date  - The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pck_preval_cfg', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert User ID - The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pck_preval_cfg', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Update User ID - The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pck_preval_cfg', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

