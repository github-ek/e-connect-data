CREATE TABLE [dbo].[aisle_dckloc] (
    [aisle_dckloc_id]  INT           NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [aisle_id]         NVARCHAR (20) NULL,
    [dckloc]           NVARCHAR (20) NULL,
    [stgloc]           NVARCHAR (20) NULL,
    [bldg_id]          NVARCHAR (10) NOT NULL,
    [dckmode]          NVARCHAR (1)  NOT NULL,
    [seqnum_primary]   INT           NULL,
    [seqnum_secondary] INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [aisle_dckloc_pk] PRIMARY KEY CLUSTERED ([aisle_dckloc_id] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90)
);




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The aisle_dckloc table is used to store the association of dock doors to
    staging lanes to aisles for receiving dock doors (dckmode = R) and also the association of aisles to dock doors to staging lnaes for shipping dock doors (dckmode = S).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aisle_dckloc';




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier for aisle dock door associations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aisle_dckloc', @level2type = N'COLUMN', @level2name = N'aisle_dckloc_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'WareHouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aisle_dckloc', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A collection of locations in a row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aisle_dckloc', @level2type = N'COLUMN', @level2name = N'aisle_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Dock Door Location', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aisle_dckloc', @level2type = N'COLUMN', @level2name = N'dckloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Staging Location', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aisle_dckloc', @level2type = N'COLUMN', @level2name = N'stgloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Building ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aisle_dckloc', @level2type = N'COLUMN', @level2name = N'bldg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Dock Mode - Shipping ''S'' or Receiving ''R''', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aisle_dckloc', @level2type = N'COLUMN', @level2name = N'dckmode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence used to determine primary order of associations. For receiving asssociations, this identifies the sequence of the dock location.  For shipping, this identifies the sequence of the aisle', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aisle_dckloc', @level2type = N'COLUMN', @level2name = N'seqnum_primary';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence used to determine secondary order of associations.  For receiving associations, this identifies the sequence of the aisles.  For shipping, this identifies the sequence of the staging locations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aisle_dckloc', @level2type = N'COLUMN', @level2name = N'seqnum_secondary';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aisle_dckloc', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aisle_dckloc', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aisle_dckloc', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aisle_dckloc', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

