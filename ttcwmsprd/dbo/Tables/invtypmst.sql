CREATE TABLE [dbo].[invtypmst] (
    [invtyp]           NVARCHAR (4)  NOT NULL,
    [bill_anvstg_flg]  INT           NULL,
    [retflg]           INT           NULL,
    [delvflg]          INT           DEFAULT ((0)) NOT NULL,
    [std_put_flg]      INT           DEFAULT ((0)) NOT NULL,
    [moddte]           DATETIME      NULL,
    [mod_usr_id]       NVARCHAR (40) NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [invtypmst_pk] PRIMARY KEY CLUSTERED ([invtyp] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [invtypmst_b_a_f_ck] CHECK ([bill_anvstg_flg]=(0) OR [bill_anvstg_flg]=(1)),
    CONSTRAINT [invtypmst_dlvflgck] CHECK ([delvflg]=(0) OR [delvflg]=(1)),
    CONSTRAINT [invtypmst_putflg] CHECK ([std_put_flg]=(0) OR [std_put_flg]=(1)),
    CONSTRAINT [invtypmst_retflgck] CHECK ([retflg]=(0) OR [retflg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines the different invoice types associated with the receive invoice.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invtypmst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Type of invoice associated with the receive invoice.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invtypmst', @level2type = N'COLUMN', @level2name = N'invtyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Denotes if the inventory being received can have an initial anniversary storage invoice created.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invtypmst', @level2type = N'COLUMN', @level2name = N'bill_anvstg_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Denotes a Return invoice type.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invtypmst', @level2type = N'COLUMN', @level2name = N'retflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Denotes a Delivery invoice type.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invtypmst', @level2type = N'COLUMN', @level2name = N'delvflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Determines to get the assigned locations first even if the RESPECT-FIFO-SKIP-LOCS is true.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invtypmst', @level2type = N'COLUMN', @level2name = N'std_put_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date of the last modification.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invtypmst', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The ID of the user that made the last modification.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invtypmst', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invtypmst', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invtypmst', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invtypmst', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invtypmst', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invtypmst', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

