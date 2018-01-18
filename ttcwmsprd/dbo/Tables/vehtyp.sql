CREATE TABLE [dbo].[vehtyp] (
    [vehtyp_id]     NVARCHAR (10) NOT NULL,
    [voc_cod]       INT           NOT NULL,
    [moddte]        DATETIME      NULL,
    [mod_usr_id]    NVARCHAR (40) NULL,
    [veh_lod_limit] INT           DEFAULT ((0)) NOT NULL,
    CONSTRAINT [vehtyp_pk] PRIMARY KEY CLUSTERED ([vehtyp_id] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [vehtyp_ck]
    ON [dbo].[vehtyp]([voc_cod] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The vehtyp table is used to associate vehicle type and code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vehtyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The vehicle id, like HAND and FORK. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vehtyp', @level2type = N'COLUMN', @level2name = N'vehtyp_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique number identifying the voice code similar to that of a srtseq number. It defaults to 1 or maximum + 1 of all the voc_cod. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vehtyp', @level2type = N'COLUMN', @level2name = N'voc_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date/time this record was last modified. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vehtyp', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of user that performed last modification. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vehtyp', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum number of loads that can reside on a vehicle - The 0 value for veh_lod_limit represents that the load limit is unlimited for the vehicle.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vehtyp', @level2type = N'COLUMN', @level2name = N'veh_lod_limit';

