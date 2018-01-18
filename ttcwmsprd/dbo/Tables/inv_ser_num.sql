CREATE TABLE [dbo].[inv_ser_num] (
    [ser_num]          NVARCHAR (40) NOT NULL,
    [invtid]           NVARCHAR (30) NOT NULL,
    [ser_num_typ_id]   NVARCHAR (10) NOT NULL,
    [ser_lvl]          NVARCHAR (1)  NOT NULL,
    [moddte]           DATETIME      NULL,
    [mod_usr_id]       NVARCHAR (40) NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [inv_ser_num_pk] PRIMARY KEY CLUSTERED ([ser_num] ASC, [ser_num_typ_id] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [inv_ser_num_invtid]
    ON [dbo].[inv_ser_num]([invtid] ASC, [ser_lvl] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [inv_ser_num_typ]
    ON [dbo].[inv_ser_num]([invtid] ASC, [ser_num_typ_id] ASC, [ser_lvl] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table represents all the serial numbers captured in the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_ser_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This refers to a long piece of text that may contain numbers, letters, check digits and noise characters.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_ser_num', @level2type = N'COLUMN', @level2name = N'ser_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This could be a load number, sub number or detail number.  This will usually correspond to the serialization level regardless of the item''s load level.  For example, ser. lvl of Subload implies that the ser nums will be captured per case', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_ser_num', @level2type = N'COLUMN', @level2name = N'invtid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will be the ID created by the user to specify a type of serial number.  There could potentially be more than one associated with a item/item client combination.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_ser_num', @level2type = N'COLUMN', @level2name = N'ser_num_typ_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates the level to which serial numbers will be tracked.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_ser_num', @level2type = N'COLUMN', @level2name = N'ser_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Datetime Stamp of last change to row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_ser_num', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of user that performed last modification.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_ser_num', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_ser_num', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_ser_num', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_ser_num', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_ser_num', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inv_ser_num', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

