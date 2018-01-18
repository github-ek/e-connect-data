CREATE TABLE [dbo].[car_pro_num_blk] (
    [carcod]           NVARCHAR (10) NOT NULL,
    [adr_id]           NVARCHAR (20) NOT NULL,
    [pool_adr_id]      NVARCHAR (20) NOT NULL,
    [srt_seq]          INT           NOT NULL,
    [blk_start]        NVARCHAR (20) NULL,
    [blk_stop]         NVARCHAR (20) NULL,
    [inc_val]          INT           NULL,
    [used_dt]          DATETIME      NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [car_pro_num_blk_pk] PRIMARY KEY CLUSTERED ([carcod] ASC, [adr_id] ASC, [pool_adr_id] ASC, [srt_seq] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Contains the PRO number block definitions for the Carriers, facilities and clients', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_pro_num_blk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carrier ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_pro_num_blk', @level2type = N'COLUMN', @level2name = N'carcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Facility Address ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_pro_num_blk', @level2type = N'COLUMN', @level2name = N'adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Distribution or pool point address id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_pro_num_blk', @level2type = N'COLUMN', @level2name = N'pool_adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence number for a particular block of numbers', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_pro_num_blk', @level2type = N'COLUMN', @level2name = N'srt_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The start value of a block of PRO number sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_pro_num_blk', @level2type = N'COLUMN', @level2name = N'blk_start';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The end value of a block of PRO number sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_pro_num_blk', @level2type = N'COLUMN', @level2name = N'blk_stop';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The increment value defined for a sequence of numbers', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_pro_num_blk', @level2type = N'COLUMN', @level2name = N'inc_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The last date and time the block of PRO numbers was used up', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_pro_num_blk', @level2type = N'COLUMN', @level2name = N'used_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_pro_num_blk', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_pro_num_blk', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_pro_num_blk', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_pro_num_blk', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_pro_num_blk', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

