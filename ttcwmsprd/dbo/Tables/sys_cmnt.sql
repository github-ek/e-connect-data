CREATE TABLE [dbo].[sys_cmnt] (
    [sys_obj_typ] NVARCHAR (20)   NOT NULL,
    [sys_obj_id]  NVARCHAR (100)  NOT NULL,
    [cust_lvl]    INT             NOT NULL,
    [cmnt]        NVARCHAR (2000) NOT NULL,
    [grp_nam]     NVARCHAR (40)   NULL,
    CONSTRAINT [sys_cmnt_pk] PRIMARY KEY CLUSTERED ([sys_obj_id] ASC, [sys_obj_typ] ASC, [cust_lvl] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains comments on system objects.  These comments are supplied by developer or project teams.  They are typically used to describe an object and track changes made to that object.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sys_cmnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  The type of the system object being commented.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sys_cmnt', @level2type = N'COLUMN', @level2name = N'sys_obj_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Indicates the identifier of the system object being commented.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sys_cmnt', @level2type = N'COLUMN', @level2name = N'sys_obj_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows different customization levels for customer and project teams.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sys_cmnt', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the verbose comment for this data item', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sys_cmnt', @level2type = N'COLUMN', @level2name = N'cmnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sys_cmnt', @level2type = N'COLUMN', @level2name = N'grp_nam';

