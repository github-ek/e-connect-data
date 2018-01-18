CREATE TABLE [dbo].[invtid_serv] (
    [wh_id]            NVARCHAR (32) NOT NULL,
    [invtid]           NVARCHAR (30) NOT NULL,
    [lodlvl]           NVARCHAR (1)  NOT NULL,
    [serv_id]          NVARCHAR (20) NOT NULL,
    [exitpnt_typ]      NVARCHAR (30) NOT NULL,
    [exitpnt]          NVARCHAR (15) NOT NULL,
    [serv_req_flg]     INT           NOT NULL,
    [adddte]           DATETIME      NULL,
    [moddte]           DATETIME      NULL,
    [mod_usr_id]       NVARCHAR (40) NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [invtid_serv_pk] PRIMARY KEY CLUSTERED ([wh_id] ASC, [invtid] ASC, [lodlvl] ASC, [serv_id] ASC, [exitpnt_typ] ASC, [exitpnt] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier Service', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invtid_serv';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invtid_serv', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invtid_serv', @level2type = N'COLUMN', @level2name = N'invtid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load Level', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invtid_serv', @level2type = N'COLUMN', @level2name = N'lodlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invtid_serv', @level2type = N'COLUMN', @level2name = N'serv_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Exit Point Type - determines the general process during which the exit point should be evaluated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invtid_serv', @level2type = N'COLUMN', @level2name = N'exitpnt_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Exit Point - determines the exact point in the warehouse process when this exit point should be evaluated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invtid_serv', @level2type = N'COLUMN', @level2name = N'exitpnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Requeired', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invtid_serv', @level2type = N'COLUMN', @level2name = N'serv_req_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Added Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invtid_serv', @level2type = N'COLUMN', @level2name = N'adddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invtid_serv', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invtid_serv', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invtid_serv', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invtid_serv', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invtid_serv', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invtid_serv', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invtid_serv', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

