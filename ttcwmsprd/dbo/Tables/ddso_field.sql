CREATE TABLE [dbo].[ddso_field] (
    [ddso_id]         NVARCHAR (40) NOT NULL,
    [cust_lvl]        INT           NOT NULL,
    [var_nam]         NVARCHAR (40) NOT NULL,
    [srtseq]          INT           NOT NULL,
    [ddso_fmt_fld_id] NVARCHAR (40) NULL,
    [output_prefix]   NVARCHAR (15) NULL,
    [output_suffix]   NVARCHAR (10) NULL,
    [grp_nam]         NVARCHAR (40) NULL,
    CONSTRAINT [ddso_field_pk] PRIMARY KEY CLUSTERED ([ddso_id] ASC, [cust_lvl] ASC, [var_nam] ASC, [srtseq] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains all DDSO Field definitions.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ddso_field';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is a unique identifier for a defined DDSO.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ddso_field', @level2type = N'COLUMN', @level2name = N'ddso_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows different customization levels for customer and project teams.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ddso_field', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies the input field from the DDSO command.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ddso_field', @level2type = N'COLUMN', @level2name = N'var_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The sort order for appearance of the fields.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ddso_field', @level2type = N'COLUMN', @level2name = N'srtseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An string value that is prepended to the output value.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ddso_field', @level2type = N'COLUMN', @level2name = N'output_prefix';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An string value that is appended to the output value.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ddso_field', @level2type = N'COLUMN', @level2name = N'output_suffix';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ddso_field', @level2type = N'COLUMN', @level2name = N'grp_nam';

