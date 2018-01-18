CREATE TABLE [dbo].[arecod_nxtmov] (
    [src_wh_id]        NVARCHAR (32) NOT NULL,
    [src_arecod]       NVARCHAR (10) NOT NULL,
    [dst_wh_id]        NVARCHAR (32) NOT NULL,
    [dst_arecod]       NVARCHAR (10) NOT NULL,
    [lodlvl]           NVARCHAR (1)  NOT NULL,
    [seqnum]           INT           NOT NULL,
    [oprcod]           NVARCHAR (9)  NULL,
    [pricod]           INT           NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [arecod_nxtmov_pk] PRIMARY KEY CLUSTERED ([src_wh_id] ASC, [src_arecod] ASC, [dst_wh_id] ASC, [dst_arecod] ASC, [lodlvl] ASC, [seqnum] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tracks the next move of inventory when using directed work', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arecod_nxtmov';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Source warehouse.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arecod_nxtmov', @level2type = N'COLUMN', @level2name = N'src_wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Source aree code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arecod_nxtmov', @level2type = N'COLUMN', @level2name = N'src_arecod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Destination warehouse..', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arecod_nxtmov', @level2type = N'COLUMN', @level2name = N'dst_wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Destination area code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arecod_nxtmov', @level2type = N'COLUMN', @level2name = N'dst_arecod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load level', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arecod_nxtmov', @level2type = N'COLUMN', @level2name = N'lodlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arecod_nxtmov', @level2type = N'COLUMN', @level2name = N'seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Operation code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arecod_nxtmov', @level2type = N'COLUMN', @level2name = N'oprcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Priority code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arecod_nxtmov', @level2type = N'COLUMN', @level2name = N'pricod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arecod_nxtmov', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arecod_nxtmov', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arecod_nxtmov', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arecod_nxtmov', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'arecod_nxtmov', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

