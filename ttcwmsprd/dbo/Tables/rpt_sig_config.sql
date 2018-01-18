CREATE TABLE [dbo].[rpt_sig_config] (
    [rpt_id]           NVARCHAR (30)   NOT NULL,
    [sig_id]           NVARCHAR (30)   NOT NULL,
    [rpt_page]         NVARCHAR (10)   NOT NULL,
    [sig_top]          NUMERIC (19, 4) NOT NULL,
    [sig_left]         NUMERIC (19, 4) NOT NULL,
    [sig_wid]          NUMERIC (19, 4) NOT NULL,
    [sig_hgt]          NUMERIC (19, 4) NOT NULL,
    [ins_dt]           DATETIME        NULL,
    [last_upd_dt]      DATETIME        NULL,
    [ins_user_id]      NVARCHAR (40)   NULL,
    [last_upd_user_id] NVARCHAR (40)   NULL,
    CONSTRAINT [rpt_sig_config_pk] PRIMARY KEY CLUSTERED ([rpt_id] ASC, [sig_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stores Digital Signature attributes like report page and position on the page along with rpt_id. One rpt_id can have more than one signatures associated with it', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpt_sig_config';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Report which will use this signature configuration to put the signature in the PDF file', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpt_sig_config', @level2type = N'COLUMN', @level2name = N'rpt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifier for the report''s signature position', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpt_sig_config', @level2type = N'COLUMN', @level2name = N'sig_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This column will determine in which page the signature will be captured. (Valid values : F = First Page/ L = Last Page/ A = All Pages)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpt_sig_config', @level2type = N'COLUMN', @level2name = N'rpt_page';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates how far down from the top of the page. This will use UOM_SL field type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpt_sig_config', @level2type = N'COLUMN', @level2name = N'sig_top';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates how far from the left-hand side of the page. This will use UOM_SL field type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpt_sig_config', @level2type = N'COLUMN', @level2name = N'sig_left';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates the width of the signature. This will use UOM_SL field type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpt_sig_config', @level2type = N'COLUMN', @level2name = N'sig_wid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates the height of the signature. This will use UOM_SL field type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpt_sig_config', @level2type = N'COLUMN', @level2name = N'sig_hgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpt_sig_config', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpt_sig_config', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpt_sig_config', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpt_sig_config', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

