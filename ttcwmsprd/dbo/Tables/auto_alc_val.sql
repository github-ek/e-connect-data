CREATE TABLE [dbo].[auto_alc_val] (
    [wh_id]           NVARCHAR (32)  NOT NULL,
    [seqnum]          INT            NOT NULL,
    [auto_alc_num]    NVARCHAR (12)  NOT NULL,
    [table_nam]       NVARCHAR (30)  NOT NULL,
    [field_name]      NVARCHAR (30)  NOT NULL,
    [operator]        NVARCHAR (15)  NOT NULL,
    [value]           NVARCHAR (300) NULL,
    [ins_dt]          DATETIME       NULL,
    [last_upd_dt]     DATETIME       NULL,
    [ins_user_id]     NVARCHAR (40)  NULL,
    [last_upd_usr_id] NVARCHAR (40)  NULL,
    CONSTRAINT [auto_alc_val_pk] PRIMARY KEY CLUSTERED ([wh_id] ASC, [auto_alc_num] ASC, [seqnum] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The auto_alc_val table will provide a configurable way to decide which orders and shipments should be allocated when they are downloaded from host.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'auto_alc_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - The unique identifier for the warehouse.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'auto_alc_val', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence Number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'auto_alc_val', @level2type = N'COLUMN', @level2name = N'seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Auto Allocation Rule Number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'auto_alc_val', @level2type = N'COLUMN', @level2name = N'auto_alc_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Table Name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'auto_alc_val', @level2type = N'COLUMN', @level2name = N'table_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Field Name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'auto_alc_val', @level2type = N'COLUMN', @level2name = N'field_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Operator.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'auto_alc_val', @level2type = N'COLUMN', @level2name = N'operator';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value of the field.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'auto_alc_val', @level2type = N'COLUMN', @level2name = N'value';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'auto_alc_val', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'auto_alc_val', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'auto_alc_val', @level2type = N'COLUMN', @level2name = N'ins_user_id';

