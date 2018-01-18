CREATE TABLE [dbo].[rpl_path_cfg] (
    [rpl_path_typ]     NVARCHAR (1)   NOT NULL,
    [wh_id]            NVARCHAR (32)  NOT NULL,
    [dstare]           NVARCHAR (10)  NOT NULL,
    [cfgtyp]           NVARCHAR (100) NOT NULL,
    [cfgval]           NVARCHAR (200) NOT NULL,
    [rplare]           NVARCHAR (10)  NOT NULL,
    [rpl_lodlvl]       NVARCHAR (1)   NOT NULL,
    [srtseq]           INT            NOT NULL,
    [hopare]           NVARCHAR (10)  NULL,
    [hop_lodlvl]       NVARCHAR (1)   NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [rpl_path_cfg_pk] PRIMARY KEY CLUSTERED ([rpl_path_typ] ASC, [wh_id] ASC, [dstare] ASC, [cfgtyp] ASC, [cfgval] ASC, [rplare] ASC, [rpl_lodlvl] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines the replenishment path for the specific destination areas.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpl_path_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Replenishment Path Type. S - Path for Case; D - Path for Piece.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpl_path_cfg', @level2type = N'COLUMN', @level2name = N'rpl_path_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpl_path_cfg', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Destination Area', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpl_path_cfg', @level2type = N'COLUMN', @level2name = N'dstare';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Configuration Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpl_path_cfg', @level2type = N'COLUMN', @level2name = N'cfgtyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Configuration Value', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpl_path_cfg', @level2type = N'COLUMN', @level2name = N'cfgval';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Replenishment Area', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpl_path_cfg', @level2type = N'COLUMN', @level2name = N'rplare';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Replenishment Allocation Level. L - Load Level; S - Case Level; D - Detail Level.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpl_path_cfg', @level2type = N'COLUMN', @level2name = N'rpl_lodlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sort Sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpl_path_cfg', @level2type = N'COLUMN', @level2name = N'srtseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hop Area. It��s only available if the rpl_path_typ is D.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpl_path_cfg', @level2type = N'COLUMN', @level2name = N'hopare';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hop Area Allocation Level. L - Load Level; S - Case Level; D - Detail Level.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpl_path_cfg', @level2type = N'COLUMN', @level2name = N'hop_lodlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpl_path_cfg', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpl_path_cfg', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpl_path_cfg', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpl_path_cfg', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

