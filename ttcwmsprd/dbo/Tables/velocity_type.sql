CREATE TABLE [dbo].[velocity_type] (
    [velocity_type] NVARCHAR (40) NOT NULL,
    CONSTRAINT [velocity_type_pk] PRIMARY KEY CLUSTERED ([velocity_type] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table keeps the types of the velocities.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'velocity_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Velocity Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'velocity_type', @level2type = N'COLUMN', @level2name = N'velocity_type';

