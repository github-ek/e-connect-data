CREATE TABLE [dbo].[com_equip] (
    [comcod]           NVARCHAR (32) NOT NULL,
    [equip_res_typ]    NVARCHAR (40) NOT NULL,
    [equip_res]        NVARCHAR (40) NOT NULL,
    [incl_excl_cod]    NVARCHAR (40) NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [com_equip_pk] PRIMARY KEY CLUSTERED ([comcod] ASC, [equip_res_typ] ASC, [equip_res] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The com_equip is the table that defines the Commodity Equipment restrictions.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'com_equip';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Commodity', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'com_equip', @level2type = N'COLUMN', @level2name = N'comcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This equipment restriction represents an equipment or an equipment group.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'com_equip', @level2type = N'COLUMN', @level2name = N'equip_res_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Based on the value of equip_res_typ it represents either an equipment or an equipment Group which defines this restriction.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'com_equip', @level2type = N'COLUMN', @level2name = N'equip_res';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is an include (require this equipment/equipment group) or exclude (prohibit this equipment/equipment group) restriction.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'com_equip', @level2type = N'COLUMN', @level2name = N'incl_excl_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'com_equip', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'com_equip', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'com_equip', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'com_equip', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'com_equip', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

