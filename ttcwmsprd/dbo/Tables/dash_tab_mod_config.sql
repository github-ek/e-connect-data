CREATE TABLE [dbo].[dash_tab_mod_config] (
    [mod_config_id] NVARCHAR (40)  NOT NULL,
    [module_id]     NVARCHAR (50)  NOT NULL,
    [tab_id]        NVARCHAR (50)  NOT NULL,
    [srtseq]        INT            NOT NULL,
    [dda_qual]      NVARCHAR (512) NULL,
    [refresh_sec]   INT            NULL,
    [description]   NVARCHAR (250) NULL,
    [ctrl_dt]       DATETIME       NULL,
    [grp_nam]       NVARCHAR (40)  NULL,
    CONSTRAINT [dsh_tab_mod_cfg_pk] PRIMARY KEY CLUSTERED ([mod_config_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Holds the configuration information for a given module on a given tab', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_tab_mod_config';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The configuration ID. This is a sequence number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_tab_mod_config', @level2type = N'COLUMN', @level2name = N'mod_config_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The ID of the module that this configuration affects', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_tab_mod_config', @level2type = N'COLUMN', @level2name = N'module_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The ID of the tab that the module is on', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_tab_mod_config', @level2type = N'COLUMN', @level2name = N'tab_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The sequence that the module appears in', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_tab_mod_config', @level2type = N'COLUMN', @level2name = N'srtseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Any custom DDA qualifiers that are applied to the module', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_tab_mod_config', @level2type = N'COLUMN', @level2name = N'dda_qual';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The refresh rate of the module in seconds, 0 implies no refresh', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_tab_mod_config', @level2type = N'COLUMN', @level2name = N'refresh_sec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description or title of the config, this overrides any sys_dsc_mst entries', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_tab_mod_config', @level2type = N'COLUMN', @level2name = N'description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date of last programatic modification for a configuration', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_tab_mod_config', @level2type = N'COLUMN', @level2name = N'ctrl_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The group that added this record as distributed data', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_tab_mod_config', @level2type = N'COLUMN', @level2name = N'grp_nam';

