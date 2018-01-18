CREATE TABLE [dbo].[dda_action] (
    [dda_id]          NVARCHAR (40)   NOT NULL,
    [action]          NVARCHAR (40)   NOT NULL,
    [cust_lvl]        INT             NOT NULL,
    [action_flds]     NVARCHAR (2000) NULL,
    [action_frm]      NVARCHAR (200)  NULL,
    [img_link]        NVARCHAR (100)  NULL,
    [ena_flg]         INT             NULL,
    [grp_nam]         NVARCHAR (40)   NULL,
    [srtseq]          INT             NULL,
    [action_init_cmd] NVARCHAR (2000) NULL,
    [action_post_cmd] NVARCHAR (2000) DEFAULT (CONVERT([nvarchar],NULL)) NULL,
    [rqdflg]          INT             DEFAULT ((0)) NULL,
    [submit_mls_id]   NVARCHAR (40)   NULL,
    [post_mls_id]     NVARCHAR (40)   NULL,
    [auto_clear]      INT             NULL,
    CONSTRAINT [dda_action_pk] PRIMARY KEY CLUSTERED ([dda_id] ASC, [action] ASC, [cust_lvl] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [dda_actn_autclrck] CHECK ([auto_clear]=(0) OR [auto_clear]=(1)),
    CONSTRAINT [dda_actn_enaflgck] CHECK ([ena_flg]=(0) OR [ena_flg]=(1)),
    CONSTRAINT [dda_actn_rqdflgck] CHECK ([rqdflg]=(0) OR [rqdflg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is used for actions that are attached to other DDA', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_action';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The master DDA identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_action', @level2type = N'COLUMN', @level2name = N'dda_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The DDA identifier that is the action.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_action', @level2type = N'COLUMN', @level2name = N'action';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows different customization levels for customer and project teams.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_action', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Fields whose data is passed from the parent to the action.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_action', @level2type = N'COLUMN', @level2name = N'action_flds';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used by the web to indicate use a custom form instead of the standard DDA.  GUI this indicates a button key to run standard form flow', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_action', @level2type = N'COLUMN', @level2name = N'action_frm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Determines if the action is enabled.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_action', @level2type = N'COLUMN', @level2name = N'ena_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_action', @level2type = N'COLUMN', @level2name = N'grp_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'sequence the actions are displayed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_action', @level2type = N'COLUMN', @level2name = N'srtseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Command run prior to the actual action command.  Run with semi-colon syntax so all commands are one transaction.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_action', @level2type = N'COLUMN', @level2name = N'action_init_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Command run after the actual action command.  Run with semi-colon syntax so all commands are one transaction.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_action', @level2type = N'COLUMN', @level2name = N'action_post_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates this action is required.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_action', @level2type = N'COLUMN', @level2name = N'rqdflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines the mls_id to use as the confirmation message before the action is executed or in the submit fields dialog.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_action', @level2type = N'COLUMN', @level2name = N'submit_mls_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines the mls_id to use as the message displayed to the user after an action executes successfully.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_action', @level2type = N'COLUMN', @level2name = N'post_mls_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Determines if the main form should be cleared after the action executes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_action', @level2type = N'COLUMN', @level2name = N'auto_clear';

