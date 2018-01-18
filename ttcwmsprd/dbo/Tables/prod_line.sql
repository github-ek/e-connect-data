CREATE TABLE [dbo].[prod_line] (
    [stoloc]           NVARCHAR (20) NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [rcvkey]           NVARCHAR (15) NOT NULL,
    [blkqty]           INT           NULL,
    [thrqty]           INT           NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [prod_line_pk] PRIMARY KEY CLUSTERED ([stoloc] ASC, [wh_id] ASC, [rcvkey] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The production line table is used receiving information for a production line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prod_line';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Storage Location - The storage location for the production line .', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prod_line', @level2type = N'COLUMN', @level2name = N'stoloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - The warehouse where the line is located.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prod_line', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Receive Key - The receive key for the receipt line that will be received against on the production line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prod_line', @level2type = N'COLUMN', @level2name = N'rcvkey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Block Quantity - The block quantity defines the number of cartons created at a time.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prod_line', @level2type = N'COLUMN', @level2name = N'blkqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Threshold Quantity - The threshold quantity defines the number of cases remaining until another block of cartons is created for the production line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prod_line', @level2type = N'COLUMN', @level2name = N'thrqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prod_line', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prod_line', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prod_line', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prod_line', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prod_line', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

