CREATE TABLE [dbo].[pcl_usrfld] (
    [pcl_usrfld_id] INT           NOT NULL,
    [client_id]     NVARCHAR (32) NOT NULL,
    [cstnum]        NVARCHAR (20) NOT NULL,
    [usr_col1]      NVARCHAR (40) NULL,
    [usr_col2]      NVARCHAR (40) NULL,
    [usr_col3]      NVARCHAR (40) NULL,
    [usr_col4]      NVARCHAR (40) NULL,
    [ins_dt]        DATETIME      NULL,
    [ins_user_id]   NVARCHAR (40) NULL,
    [moddte]        DATETIME      NULL,
    [mod_usr_id]    NVARCHAR (40) NULL,
    CONSTRAINT [pcl_usrfld_pk] PRIMARY KEY CLUSTERED ([pcl_usrfld_id] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [pcl_usrfld_idx1]
    ON [dbo].[pcl_usrfld]([client_id] ASC, [cstnum] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table stores the configuration data for user fields which are send to parcel.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcl_usrfld';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier for parcel user fields', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcl_usrfld', @level2type = N'COLUMN', @level2name = N'pcl_usrfld_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcl_usrfld', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customer Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcl_usrfld', @level2type = N'COLUMN', @level2name = N'cstnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User Column 1', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcl_usrfld', @level2type = N'COLUMN', @level2name = N'usr_col1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User Column 2', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcl_usrfld', @level2type = N'COLUMN', @level2name = N'usr_col2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User Column 3', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcl_usrfld', @level2type = N'COLUMN', @level2name = N'usr_col3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User Column 4', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcl_usrfld', @level2type = N'COLUMN', @level2name = N'usr_col4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcl_usrfld', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcl_usrfld', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was modified', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcl_usrfld', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who modified the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcl_usrfld', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

