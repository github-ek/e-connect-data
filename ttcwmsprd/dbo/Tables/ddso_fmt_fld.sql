CREATE TABLE [dbo].[ddso_fmt_fld] (
    [ddso_fmt_id]        NVARCHAR (40) NOT NULL,
    [ddso_fmt_fld_id]    NVARCHAR (40) NOT NULL,
    [srtseq]             INT           NOT NULL,
    [ddso_tag_nam]       NVARCHAR (40) NOT NULL,
    [ddso_parent_fld_id] NVARCHAR (40) NULL,
    [grp_nam]            NVARCHAR (40) NULL,
    CONSTRAINT [ddso_fmt_fld_pk] PRIMARY KEY CLUSTERED ([ddso_fmt_id] ASC, [ddso_fmt_fld_id] ASC, [srtseq] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains all DDSO Field definitions.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ddso_fmt_fld';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is an unique identifier for a defined DDSO output format.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ddso_fmt_fld', @level2type = N'COLUMN', @level2name = N'ddso_fmt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is an unique identifier for a field defined in the DDSO output format.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ddso_fmt_fld', @level2type = N'COLUMN', @level2name = N'ddso_fmt_fld_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sort sequence of this field relative to the parent field.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ddso_fmt_fld', @level2type = N'COLUMN', @level2name = N'srtseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines the tag that will be output in the specified output.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ddso_fmt_fld', @level2type = N'COLUMN', @level2name = N'ddso_tag_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is an identifier for the parent field of this field defined in the DDSO output format.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ddso_fmt_fld', @level2type = N'COLUMN', @level2name = N'ddso_parent_fld_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ddso_fmt_fld', @level2type = N'COLUMN', @level2name = N'grp_nam';

