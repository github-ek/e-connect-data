CREATE TABLE [dbo].[actcod] (
    [actcod]           NVARCHAR (40) NOT NULL,
    [actcod_typ]       NVARCHAR (4)  NULL,
    [voc_cod]          INT           NULL,
    [lms_flg]          INT           NULL,
    [worktype_id]      NVARCHAR (15) NULL,
    [indflg]           INT           NULL,
    [asgn_typ]         NVARCHAR (4)  NULL,
    [disc_proc_id]     NVARCHAR (40) NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [actcod_pk] PRIMARY KEY CLUSTERED ([actcod] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [actcod_indflg_ck] CHECK ([indflg]=(0) OR [indflg]=(1)),
    CONSTRAINT [actcod_lms_flg_ck] CHECK ([lms_flg]=(0) OR [lms_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Activity Code table is used to store activity codes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'actcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Activity Code, the type of inventory activity.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'actcod', @level2type = N'COLUMN', @level2name = N'actcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This field determines what type of activity this record represents.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'actcod', @level2type = N'COLUMN', @level2name = N'actcod_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The indirect voice code for the activity code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'actcod', @level2type = N'COLUMN', @level2name = N'voc_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag determines if the activity code can be sent to lms.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'actcod', @level2type = N'COLUMN', @level2name = N'lms_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Work Type ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'actcod', @level2type = N'COLUMN', @level2name = N'worktype_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag determines if the activity code is indirect work', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'actcod', @level2type = N'COLUMN', @level2name = N'indflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This field is an indicator to labor that this is the work type that the entry with that flag set should be used to determine the standard for the area and the activity code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'actcod', @level2type = N'COLUMN', @level2name = N'asgn_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The discrete procedure ID is used to accurately categorize and track the work in WM and match to the standards in WFM.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'actcod', @level2type = N'COLUMN', @level2name = N'disc_proc_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'actcod', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'actcod', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'actcod', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'actcod', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

