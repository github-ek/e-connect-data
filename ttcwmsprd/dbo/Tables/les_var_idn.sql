CREATE TABLE [dbo].[les_var_idn] (
    [var_nam] NVARCHAR (40) NOT NULL,
    [idn_typ] NVARCHAR (20) NOT NULL,
    [fld_idn] NVARCHAR (40) NOT NULL,
    [sid_flg] INT           NULL,
    [rfe_flg] INT           NULL,
    [wke_flg] INT           NULL,
    [grp_nam] NVARCHAR (40) NULL,
    CONSTRAINT [les_var_idn_pk] PRIMARY KEY CLUSTERED ([var_nam] ASC, [idn_typ] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [lesvaridn_rfeflgck] CHECK ([rfe_flg]=(0) OR [rfe_flg]=(1)),
    CONSTRAINT [lesvaridn_sidflgck] CHECK ([sid_flg]=(0) OR [sid_flg]=(1)),
    CONSTRAINT [lesvaridn_wkeflgck] CHECK ([wke_flg]=(0) OR [wke_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table deals with variable identifiers for the RF devices.  Identifiers allow a way of stripping out identifier codes from a value.  These codes identify a bar code or value as a specific type of field (e.g. part number etc.)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_idn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  This field represents the client-side tag name of the variable.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_idn', @level2type = N'COLUMN', @level2name = N'var_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  This field allows multiple identifiers to be used for a single field.  It has no functional value other than being part of the unique key.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_idn', @level2type = N'COLUMN', @level2name = N'idn_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The string value that identifies this value as a field of type var_nam.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_idn', @level2type = N'COLUMN', @level2name = N'fld_idn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies whether the client should show the fld_idn in the value or hide it.  A value of true causes the text to be seen.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_idn', @level2type = N'COLUMN', @level2name = N'sid_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies that the identifier is enabled on RF devices.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_idn', @level2type = N'COLUMN', @level2name = N'rfe_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies that the identifier is enabled on workstation devices.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_var_idn', @level2type = N'COLUMN', @level2name = N'wke_flg';

