CREATE TABLE [dbo].[prtfam] (
    [prtfam]           NVARCHAR (10) NOT NULL,
    [brk_stop_seq_cod] NVARCHAR (10) NULL,
    [pal_thresh_pct]   INT           NULL,
    [prtfamgrp]        NVARCHAR (20) NULL,
    [moddte]           DATETIME      NULL,
    [mod_usr_id]       NVARCHAR (40) NULL,
    CONSTRAINT [prtfam_pk] PRIMARY KEY CLUSTERED ([prtfam] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is used to keep track of the item families.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtfam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the item family.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtfam', @level2type = N'COLUMN', @level2name = N'prtfam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The code to indicate if it can be loaded out of stop sequence order.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtfam', @level2type = N'COLUMN', @level2name = N'brk_stop_seq_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pallet Threshold Percentage', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtfam', @level2type = N'COLUMN', @level2name = N'pal_thresh_pct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Family Group.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtfam', @level2type = N'COLUMN', @level2name = N'prtfamgrp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date of the last modification.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtfam', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The ID of the user that made the last modification.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtfam', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

