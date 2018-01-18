CREATE TABLE [dbo].[car_pro_num] (
    [carcod]           NVARCHAR (10) NOT NULL,
    [adr_id]           NVARCHAR (20) NOT NULL,
    [pool_adr_id]      NVARCHAR (20) NOT NULL,
    [format]           NVARCHAR (32) NULL,
    [num_len]          INT           NULL,
    [next_val]         NVARCHAR (20) NULL,
    [pro_num_prefix]   NVARCHAR (32) NULL,
    [chk_dgt_mthd]     NVARCHAR (32) NULL,
    [separator]        NVARCHAR (1)  NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [car_pro_num_pk] PRIMARY KEY CLUSTERED ([carcod] ASC, [adr_id] ASC, [pool_adr_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Contains the PRO NUMBER definition for the carriers, facilities and clients', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_pro_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carrier ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_pro_num', @level2type = N'COLUMN', @level2name = N'carcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Facility Address ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_pro_num', @level2type = N'COLUMN', @level2name = N'adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Distribution or pool point address', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_pro_num', @level2type = N'COLUMN', @level2name = N'pool_adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user defined format for the PRO Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_pro_num', @level2type = N'COLUMN', @level2name = N'format';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N' The length of the base number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_pro_num', @level2type = N'COLUMN', @level2name = N'num_len';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The next value of the PRO number from the available block of numbers', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_pro_num', @level2type = N'COLUMN', @level2name = N'next_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Prefix for the PRO number definition', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_pro_num', @level2type = N'COLUMN', @level2name = N'pro_num_prefix';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The actual check digit method to be used', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_pro_num', @level2type = N'COLUMN', @level2name = N'chk_dgt_mthd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The separator used for the PRO number format e.g: - ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_pro_num', @level2type = N'COLUMN', @level2name = N'separator';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_pro_num', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_pro_num', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_pro_num', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_pro_num', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_pro_num', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

