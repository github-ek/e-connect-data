CREATE TABLE [dbo].[btn_config] (
    [btn_key]     NVARCHAR (20)  NOT NULL,
    [cust_lvl]    INT            NOT NULL,
    [type]        NUMERIC (1)    NOT NULL,
    [style]       NUMERIC (1)    NOT NULL,
    [posn]        NUMERIC (2)    NOT NULL,
    [func]        NVARCHAR (3)   NOT NULL,
    [parms]       NVARCHAR (120) NULL,
    [event]       NVARCHAR (40)  NOT NULL,
    [pmsns]       NUMERIC (3)    NOT NULL,
    [caption_id]  NVARCHAR (40)  NULL,
    [img_id]      NVARCHAR (512) NULL,
    [dis_img_id]  NVARCHAR (512) NULL,
    [hot_img_id]  NVARCHAR (512) NULL,
    [ttip_txt_id] NVARCHAR (40)  NULL,
    [cause_valdt] INT            NOT NULL,
    [grp_nam]     NVARCHAR (40)  NULL,
    CONSTRAINT [btn_config_pk] PRIMARY KEY CLUSTERED ([btn_key] ASC, [cust_lvl] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains configuration data for all MCSToolbar and MCSButtonBar buttons.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btn_config';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btn_config', @level2type = N'COLUMN', @level2name = N'btn_key';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows different customization levels for customer and project teams.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btn_config', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not currently used', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btn_config', @level2type = N'COLUMN', @level2name = N'type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Determines if the button is a Button(0) or Separator(3)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btn_config', @level2type = N'COLUMN', @level2name = N'style';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order of button in Toolbar or Buttonbar', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btn_config', @level2type = N'COLUMN', @level2name = N'posn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines what kind of action is taken when button is pressed: APP=Application Level, FRM=Form Level, BAR=Buttonbar', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btn_config', @level2type = N'COLUMN', @level2name = N'func';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Delimited list of parameters passed to the event handler for the button', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btn_config', @level2type = N'COLUMN', @level2name = N'parms';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Event name passed to the event handler for the button', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btn_config', @level2type = N'COLUMN', @level2name = N'event';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'MLS Identifier for the label of this button', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btn_config', @level2type = N'COLUMN', @level2name = N'caption_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Filename of the icon for this button.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btn_config', @level2type = N'COLUMN', @level2name = N'img_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Filename of the icon for this button when disabled (button bar only)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btn_config', @level2type = N'COLUMN', @level2name = N'dis_img_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Filename of the icon for this button when focused (toolbar only)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btn_config', @level2type = N'COLUMN', @level2name = N'hot_img_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'MLS Identifier for the tool tip text (mouse over)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btn_config', @level2type = N'COLUMN', @level2name = N'ttip_txt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag to determine if the button causes validation.  See the VB documentation for CausesValidation property.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btn_config', @level2type = N'COLUMN', @level2name = N'cause_valdt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btn_config', @level2type = N'COLUMN', @level2name = N'grp_nam';

