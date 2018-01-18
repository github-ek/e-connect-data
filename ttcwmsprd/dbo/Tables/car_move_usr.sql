CREATE TABLE [dbo].[car_move_usr] (
    [car_move_id]      NVARCHAR (10) NOT NULL,
    [usr_id]           NVARCHAR (40) NOT NULL,
    [lock_usr_flg]     INT           DEFAULT ((0)) NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [car_move_usr_pk] PRIMARY KEY CLUSTERED ([car_move_id] ASC, [usr_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [cmu_lc_usr_flg_ck] CHECK ([lock_usr_flg]=(0) OR [lock_usr_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maintains the carrier move and the assigned users for it.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move_usr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carrier Move Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move_usr', @level2type = N'COLUMN', @level2name = N'car_move_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID - The user id of the person to whom the carrier move is assigned', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move_usr', @level2type = N'COLUMN', @level2name = N'usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lock User Flag - If this flag is set, user will be locked to the carrier move and system will not allow him to take up work of other carrier moves.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move_usr', @level2type = N'COLUMN', @level2name = N'lock_usr_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert Date - The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move_usr', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Update Date - The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move_usr', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert User ID - The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move_usr', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Update User ID - The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move_usr', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

