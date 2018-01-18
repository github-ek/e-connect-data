CREATE TABLE [dbo].[inb_serv_rcvinv] (
    [wh_id]            NVARCHAR (32) NOT NULL,
    [trknum]           NVARCHAR (20) NOT NULL,
    [invnum]           NVARCHAR (35) NOT NULL,
    [supnum]           NVARCHAR (32) NOT NULL,
    [client_id]        NVARCHAR (32) NOT NULL,
    [serv_id]          NVARCHAR (20) NOT NULL,
    [serv_rate_id]     NVARCHAR (20) NOT NULL,
    [def_serv_cod]     NVARCHAR (10) NULL,
    [serv_req_flg]     INT           NOT NULL,
    [adddte]           DATETIME      NULL,
    [moddte]           DATETIME      NULL,
    [mod_usr_id]       NVARCHAR (40) NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [inb_serv_rcvinv_pk] PRIMARY KEY CLUSTERED ([wh_id] ASC, [trknum] ASC, [invnum] ASC, [supnum] ASC, [serv_id] ASC, [serv_rate_id] ASC, [client_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inbound Service Receive Invoice', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inb_serv_rcvinv';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inb_serv_rcvinv', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Truck Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inb_serv_rcvinv', @level2type = N'COLUMN', @level2name = N'trknum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Invoice Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inb_serv_rcvinv', @level2type = N'COLUMN', @level2name = N'invnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Supplier Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inb_serv_rcvinv', @level2type = N'COLUMN', @level2name = N'supnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inb_serv_rcvinv', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inb_serv_rcvinv', @level2type = N'COLUMN', @level2name = N'serv_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Rate ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inb_serv_rcvinv', @level2type = N'COLUMN', @level2name = N'serv_rate_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default Service Code - specifies what type of default service this entry resulted from.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inb_serv_rcvinv', @level2type = N'COLUMN', @level2name = N'def_serv_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Requeired - is the user required to perform this service before proceeding?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inb_serv_rcvinv', @level2type = N'COLUMN', @level2name = N'serv_req_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Added Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inb_serv_rcvinv', @level2type = N'COLUMN', @level2name = N'adddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inb_serv_rcvinv', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inb_serv_rcvinv', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inb_serv_rcvinv', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inb_serv_rcvinv', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inb_serv_rcvinv', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inb_serv_rcvinv', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inb_serv_rcvinv', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

