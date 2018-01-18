CREATE TABLE [dbo].[btoaud] (
    [btoaud_id]        NVARCHAR (12) NOT NULL,
    [ship_id]          NVARCHAR (30) NOT NULL,
    [lodnum]           NVARCHAR (30) NULL,
    [asset_typ]        NVARCHAR (30) NULL,
    [btoaud_typ]       NVARCHAR (20) NULL,
    [btoaud_sts]       NVARCHAR (40) NULL,
    [begtim]           DATETIME      NULL,
    [endtim]           DATETIME      NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    CONSTRAINT [btoaud_pk] PRIMARY KEY CLUSTERED ([btoaud_id] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [btoaud_idx1]
    ON [dbo].[btoaud]([lodnum] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [btoaud_idx2]
    ON [dbo].[btoaud]([ship_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table will store the master audit records for BTO audits.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btoaud';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence that uniquely identifies an audit.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btoaud', @level2type = N'COLUMN', @level2name = N'btoaud_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shipment that the load is for.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btoaud', @level2type = N'COLUMN', @level2name = N'ship_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifies the load that we are auditing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btoaud', @level2type = N'COLUMN', @level2name = N'lodnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifies the type of asset (container) the shipment is in.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btoaud', @level2type = N'COLUMN', @level2name = N'asset_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifies the type of audit being performed; sequenced or metered.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btoaud', @level2type = N'COLUMN', @level2name = N'btoaud_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether the audit passed, failed, was incomplete or is in process.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btoaud', @level2type = N'COLUMN', @level2name = N'btoaud_sts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates when the audit began.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btoaud', @level2type = N'COLUMN', @level2name = N'begtim';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates when the audit ended.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btoaud', @level2type = N'COLUMN', @level2name = N'endtim';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btoaud', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btoaud', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btoaud', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btoaud', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - The warehouse that the load belongs to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btoaud', @level2type = N'COLUMN', @level2name = N'wh_id';

