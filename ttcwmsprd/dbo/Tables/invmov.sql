CREATE TABLE [dbo].[invmov] (
    [lodnum]           NVARCHAR (30) NOT NULL,
    [lodlvl]           NVARCHAR (1)  NOT NULL,
    [seqnum]           INT           NOT NULL,
    [stoloc]           NVARCHAR (20) NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [xdkref]           NVARCHAR (10) NULL,
    [xdkqty]           INT           NULL,
    [invmov_typ]       NVARCHAR (4)  NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [invmov_pk] PRIMARY KEY CLUSTERED ([lodnum] ASC, [lodlvl] ASC, [seqnum] ASC, [stoloc] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [invmov_idx1]
    ON [dbo].[invmov]([lodlvl] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [invmov_stoloc]
    ON [dbo].[invmov]([stoloc] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The inventory movement table is the table that defines where inventory will be moved to when it is expected to be moved to another location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invmov';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'although defined as ''Load Number'' this field actually holds the identifier that will be moved. The identifier may be a lodnum, subnum, or dtlnum. It is the Load Level field which determines what type of identifier is being moved.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invmov', @level2type = N'COLUMN', @level2name = N'lodnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load Level - determines the load level of the identifer in the ''Load Number'' field.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invmov', @level2type = N'COLUMN', @level2name = N'lodlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence Number - the order of the inventory movement', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invmov', @level2type = N'COLUMN', @level2name = N'seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Destination Location - the destination location where the inventory will be moved to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invmov', @level2type = N'COLUMN', @level2name = N'stoloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - the warehouse ID where the inventory will be moved to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invmov', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Cross-Dock Reference', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invmov', @level2type = N'COLUMN', @level2name = N'xdkref';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Cross-Dock Quantity', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invmov', @level2type = N'COLUMN', @level2name = N'xdkqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Movement Type - Used to provide the general reason for the inventory move. Options include: RCV , RPLN, TRNS, PICK', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invmov', @level2type = N'COLUMN', @level2name = N'invmov_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invmov', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invmov', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invmov', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invmov', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invmov', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

