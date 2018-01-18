CREATE TABLE [dbo].[wkamst] (
    [wrkare]       NVARCHAR (8)    NOT NULL,
    [wh_id]        NVARCHAR (32)   NOT NULL,
    [prithr]       INT             NULL,
    [hmemaxprithr] INT             NULL,
    [maxprithr]    INT             NULL,
    [voc_cod]      INT             NULL,
    [dist_thresh]  NUMERIC (19, 4) NULL,
    [moddte]       DATETIME        NULL,
    [mod_usr_id]   NVARCHAR (40)   NULL,
    CONSTRAINT [wkamst_pk] PRIMARY KEY CLUSTERED ([wrkare] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [wkamst_voc_cod_ck]
    ON [dbo].[wkamst]([voc_cod] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The work area master table is used to identify work areas in a warehouse.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkamst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Work Area - The unique identifier for the work area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkamst', @level2type = N'COLUMN', @level2name = N'wrkare';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - The unique identifier for the warehouse in which the work area resides.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkamst', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Delta Priority - Current priority of a work area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkamst', @level2type = N'COLUMN', @level2name = N'prithr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Home Work Area Absolute Priority - Home work area priority decides when the user will hop back to his/her home work area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkamst', @level2type = N'COLUMN', @level2name = N'hmemaxprithr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Absolute Priority - Maximum priority to which a work area may be set.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkamst', @level2type = N'COLUMN', @level2name = N'maxprithr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Voice Code - Unique numeric code that is spoken by the user during voice picking.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkamst', @level2type = N'COLUMN', @level2name = N'voc_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This field indicates how far a vehicle can travel from it''s current location to get work. Distance threshold is only used if LoadBuilder is enabled.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkamst', @level2type = N'COLUMN', @level2name = N'dist_thresh';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date/time this record was last modified. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkamst', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of user that performed last modification. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkamst', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

