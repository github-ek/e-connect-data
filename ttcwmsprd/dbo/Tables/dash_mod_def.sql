CREATE TABLE [dbo].[dash_mod_def] (
    [module_id]          NVARCHAR (50)  NOT NULL,
    [module_typ]         NVARCHAR (4)   NOT NULL,
    [module_width]       NVARCHAR (4)   NOT NULL,
    [module_height]      INT            NULL,
    [refresh_sec]        INT            NULL,
    [dash_dda_id]        NVARCHAR (40)  NULL,
    [dda_qual]           NVARCHAR (512) NULL,
    [opt_nam]            NVARCHAR (50)  NULL,
    [ws_wsdl]            NVARCHAR (512) NULL,
    [ws_service]         NVARCHAR (50)  NULL,
    [ws_port]            NVARCHAR (10)  NULL,
    [ws_wsml]            NVARCHAR (512) NULL,
    [ws_function]        NVARCHAR (50)  NULL,
    [custom_subscribe]   NVARCHAR (512) NULL,
    [custom_unsubscribe] NVARCHAR (512) NULL,
    [moca_connect_str]   NVARCHAR (100) NULL,
    [multi_flg]          INT            NULL,
    [session_quals]      NVARCHAR (512) NULL,
    [grp_nam]            NVARCHAR (40)  NULL,
    CONSTRAINT [dash_mod_def_pk] PRIMARY KEY CLUSTERED ([module_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [dash_mod_def_mf_ck] CHECK ([multi_flg]=(0) OR [multi_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Holds dashboard module information.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_mod_def';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Module identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_mod_def', @level2type = N'COLUMN', @level2name = N'module_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Module type, either Q for query or X for web service.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_mod_def', @level2type = N'COLUMN', @level2name = N'module_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Module width, either W for wide or N for narrow.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_mod_def', @level2type = N'COLUMN', @level2name = N'module_width';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Module height, can be 0 to size to the size of the module results.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_mod_def', @level2type = N'COLUMN', @level2name = N'module_height';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Seconds before auto-refreshing.  0 means it will not refresh.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_mod_def', @level2type = N'COLUMN', @level2name = N'refresh_sec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'For Q types, the qualifiers for the query.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_mod_def', @level2type = N'COLUMN', @level2name = N'dda_qual';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies the application to start when a module is clicked.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_mod_def', @level2type = N'COLUMN', @level2name = N'opt_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'For X types, a url path to the wsdl file.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_mod_def', @level2type = N'COLUMN', @level2name = N'ws_wsdl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'For X types, the service to call.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_mod_def', @level2type = N'COLUMN', @level2name = N'ws_service';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'For X types, the port to call.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_mod_def', @level2type = N'COLUMN', @level2name = N'ws_port';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'For X types, a url path to the wsml file (not used).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_mod_def', @level2type = N'COLUMN', @level2name = N'ws_wsml';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'For X types, the function within the service to call.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_mod_def', @level2type = N'COLUMN', @level2name = N'ws_function';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Custom subscription page (model path).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_mod_def', @level2type = N'COLUMN', @level2name = N'custom_subscribe';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Custom unsubscribe page (model path).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_mod_def', @level2type = N'COLUMN', @level2name = N'custom_unsubscribe';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Passed to custom XML to provide a MOCA connection string or other data.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_mod_def', @level2type = N'COLUMN', @level2name = N'moca_connect_str';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Is the X type module capable of being subscribed to multiple times.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_mod_def', @level2type = N'COLUMN', @level2name = N'multi_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'List of qualifier names that can only be stored to the session.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_mod_def', @level2type = N'COLUMN', @level2name = N'session_quals';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Group Name for data unloading.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dash_mod_def', @level2type = N'COLUMN', @level2name = N'grp_nam';

