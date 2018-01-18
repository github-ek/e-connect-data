CREATE TABLE [dbo].[voc_region] (
    [region_num]         INT           NOT NULL,
    [voc_valid_function] INT           NOT NULL,
    [wh_id]              NVARCHAR (32) NOT NULL,
    [ins_dt]             DATETIME      NULL,
    [last_upd_dt]        DATETIME      NULL,
    [ins_user_id]        NVARCHAR (40) NULL,
    [last_upd_user_id]   NVARCHAR (40) NULL,
    CONSTRAINT [voc_region_pk] PRIMARY KEY CLUSTERED ([region_num] ASC, [voc_valid_function] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The voc_region table is created to track the overall region information.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'voc_region';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Region Number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'voc_region', @level2type = N'COLUMN', @level2name = N'region_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The functional area of region number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'voc_region', @level2type = N'COLUMN', @level2name = N'voc_valid_function';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'voc_region', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'voc_region', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'voc_region', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'voc_region', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'voc_region', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

