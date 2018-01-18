CREATE TABLE [dbo].[mov_path_dtl] (
    [srcare]           NVARCHAR (10) NOT NULL,
    [dstare]           NVARCHAR (10) NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [lodlvl]           NVARCHAR (1)  NOT NULL,
    [hopseq]           INT           NOT NULL,
    [hopare]           NVARCHAR (10) NOT NULL,
    [move_method]      NVARCHAR (40) NULL,
    [cri_id]           NVARCHAR (9)  NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [mov_path_dtl_pk] PRIMARY KEY CLUSTERED ([srcare] ASC, [dstare] ASC, [wh_id] ASC, [lodlvl] ASC, [hopseq] ASC, [hopare] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is related to movement path details. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mov_path_dtl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This field indicates source area. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mov_path_dtl', @level2type = N'COLUMN', @level2name = N'srcare';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This field indicates destination area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mov_path_dtl', @level2type = N'COLUMN', @level2name = N'dstare';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mov_path_dtl', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load level- Load, Case, Detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mov_path_dtl', @level2type = N'COLUMN', @level2name = N'lodlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hop Sequence Number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mov_path_dtl', @level2type = N'COLUMN', @level2name = N'hopseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Intermediate Area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mov_path_dtl', @level2type = N'COLUMN', @level2name = N'hopare';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Move Method.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mov_path_dtl', @level2type = N'COLUMN', @level2name = N'move_method';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier of a Criteria.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mov_path_dtl', @level2type = N'COLUMN', @level2name = N'cri_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mov_path_dtl', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mov_path_dtl', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mov_path_dtl', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mov_path_dtl', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

