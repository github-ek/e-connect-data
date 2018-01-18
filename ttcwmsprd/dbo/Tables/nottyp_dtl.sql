CREATE TABLE [dbo].[nottyp_dtl] (
    [nottyp]           NVARCHAR (40) NOT NULL,
    [exitpnt]          NVARCHAR (15) NOT NULL,
    [dsp_auto_flg]     INT           DEFAULT ((0)) NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [nottyp_dtl_pk] PRIMARY KEY CLUSTERED ([nottyp] ASC, [exitpnt] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [nottyp_dtl_dsp_auto_flg_ck] CHECK ([dsp_auto_flg]=(0) OR [dsp_auto_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'It associates the exit points where a note should be triggered for display with a specific note type.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'nottyp_dtl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicate order notes type. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'nottyp_dtl', @level2type = N'COLUMN', @level2name = N'nottyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Processing point at which system would display order notes. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'nottyp_dtl', @level2type = N'COLUMN', @level2name = N'exitpnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates that if we will display notes automatically with this exit point. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'nottyp_dtl', @level2type = N'COLUMN', @level2name = N'dsp_auto_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'nottyp_dtl', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'nottyp_dtl', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'nottyp_dtl', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'nottyp_dtl', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

