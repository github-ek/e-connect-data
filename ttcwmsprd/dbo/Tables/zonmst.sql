CREATE TABLE [dbo].[zonmst] (
    [wrkzon]           NVARCHAR (10) NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [wrkare]           NVARCHAR (8)  NOT NULL,
    [maxdev]           INT           NULL,
    [oosflg]           INT           NULL,
    [trvseq]           INT           NULL,
    [prithr]           INT           NULL,
    [maxprithr]        INT           NULL,
    [moddte]           DATETIME      NULL,
    [mod_usr_id]       NVARCHAR (40) NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [zonmst_pk] PRIMARY KEY CLUSTERED ([wrkzon] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [zonmst_oosflg_ck] CHECK ([oosflg]=(0) OR [oosflg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The zone master table is used to manage work zones in a warehouse.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'zonmst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Work Zone - The unique identifier for the zone.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'zonmst', @level2type = N'COLUMN', @level2name = N'wrkzon';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - The unique identifier for the warehouse.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'zonmst', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Work Area - The work area in which the zone resides.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'zonmst', @level2type = N'COLUMN', @level2name = N'wrkare';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum Devices - The maximum number of devices which can be used in the zone at a given time.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'zonmst', @level2type = N'COLUMN', @level2name = N'maxdev';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Out Of Service flag - The flag used to place the zone in and out of service.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'zonmst', @level2type = N'COLUMN', @level2name = N'oosflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Travel Sequence - Helps to determine the order in which zones are accessed when performing picking or putaway.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'zonmst', @level2type = N'COLUMN', @level2name = N'trvseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Delta Priority - Current priority of a zone.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'zonmst', @level2type = N'COLUMN', @level2name = N'prithr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Absolute Priority - Maximum priority to which a zone may be set.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'zonmst', @level2type = N'COLUMN', @level2name = N'maxprithr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'zonmst', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'zonmst', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'zonmst', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'zonmst', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'zonmst', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

