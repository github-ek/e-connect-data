CREATE TABLE [dbo].[les_key_config] (
    [key_code]  INT           NOT NULL,
    [key_shift] INT           NOT NULL,
    [frm_id]    NVARCHAR (40) NOT NULL,
    [cust_lvl]  INT           NOT NULL,
    [act_key]   NVARCHAR (40) NULL,
    [grp_nam]   NVARCHAR (40) NULL,
    [ena_flg]   INT           DEFAULT ((1)) NULL,
    CONSTRAINT [les_key_config_pk] PRIMARY KEY CLUSTERED ([key_code] ASC, [key_shift] ASC, [frm_id] ASC, [cust_lvl] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains  a list of assigned key presses and their associated actions.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_key_config';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  This is an integer value that represents the keyboard key code of the key.  This is NOT the ASCII value.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_key_config', @level2type = N'COLUMN', @level2name = N'key_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  This is a bit-mapped integer that represents the Shift(1), Control(2) and Alt(4) keys.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_key_config', @level2type = N'COLUMN', @level2name = N'key_shift';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Indicates to which form this key configuration applies.  A value of ''''LES'''' applies to all forms.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_key_config', @level2type = N'COLUMN', @level2name = N'frm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows different customization levels for customer and project teams.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_key_config', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Represents and LES Action.  Found in the les_act table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_key_config', @level2type = N'COLUMN', @level2name = N'act_key';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_key_config', @level2type = N'COLUMN', @level2name = N'grp_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag that indicates whether the key is enabled or not in the form.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_key_config', @level2type = N'COLUMN', @level2name = N'ena_flg';

