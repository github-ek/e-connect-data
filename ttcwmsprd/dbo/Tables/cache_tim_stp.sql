CREATE TABLE [dbo].[cache_tim_stp] (
    [obj_nam] NVARCHAR (40) NOT NULL,
    [idx_val] NVARCHAR (80) NOT NULL,
    [tim_stp] DATETIME      NOT NULL,
    CONSTRAINT [cache_tim_stp_pk] PRIMARY KEY CLUSTERED ([obj_nam] ASC, [idx_val] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table stores time stamps for client-side cached data.  This table is used to determine if a cache on the client needs to be refreshed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cache_tim_stp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Identifies the cached object.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cache_tim_stp', @level2type = N'COLUMN', @level2name = N'obj_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Identifies the key value that has been changed.  Eeach cached object type can have different key values.  A value of LES clears all values for that cached object.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cache_tim_stp', @level2type = N'COLUMN', @level2name = N'idx_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date/Time value (server based) when the object was last changed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cache_tim_stp', @level2type = N'COLUMN', @level2name = N'tim_stp';

