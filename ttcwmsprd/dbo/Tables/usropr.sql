CREATE TABLE [dbo].[usropr] (
    [usr_id] NVARCHAR (40) NOT NULL,
    [oprcod] NVARCHAR (9)  NOT NULL,
    [wh_id]  NVARCHAR (32) NOT NULL,
    CONSTRAINT [usropr_pk] PRIMARY KEY CLUSTERED ([usr_id] ASC, [oprcod] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'user operation table is used to manage user operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'usropr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User Id - The unique identifier for the user.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'usropr', @level2type = N'COLUMN', @level2name = N'usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Operation Code - The operation code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'usropr', @level2type = N'COLUMN', @level2name = N'oprcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - The unique identifier for the warehouse.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'usropr', @level2type = N'COLUMN', @level2name = N'wh_id';

