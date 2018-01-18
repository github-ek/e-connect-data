CREATE TABLE [dbo].[slot_attr_join] (
    [table_name]     NVARCHAR (30)   NOT NULL,
    [next_table]     NVARCHAR (30)   NULL,
    [join_cmd]       NVARCHAR (2000) NULL,
    [outer_join_flg] INT             DEFAULT ((0)) NULL,
    [ctrl_user_id]   NVARCHAR (40)   NULL,
    [ctrl_dt]        DATETIME        NULL,
    CONSTRAINT [slot_attr_join_pk] PRIMARY KEY CLUSTERED ([table_name] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [saj_otr_join_flgck] CHECK ([outer_join_flg]=(0) OR [outer_join_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the table we are joining.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'slot_attr_join', @level2type = N'COLUMN', @level2name = N'table_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the table we are joining to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'slot_attr_join', @level2type = N'COLUMN', @level2name = N'next_table';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifies how the tables are joined together.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'slot_attr_join', @level2type = N'COLUMN', @level2name = N'join_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Should an outer join be used?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'slot_attr_join', @level2type = N'COLUMN', @level2name = N'outer_join_flg';

