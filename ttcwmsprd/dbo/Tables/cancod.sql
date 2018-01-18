CREATE TABLE [dbo].[cancod] (
    [codval]       NVARCHAR (40) NOT NULL,
    [srtseq]       INT           NOT NULL,
    [reaflg]       INT           NULL,
    [alctyp]       NVARCHAR (20) NULL,
    [cyc_cnt_cod]  NVARCHAR (1)  NOT NULL,
    [defflg]       INT           NULL,
    [rftflg]       INT           NULL,
    [voc_cod]      INT           NULL,
    [moddte]       DATETIME      NULL,
    [mod_usr_id]   NVARCHAR (40) NULL,
    [reuse_locflg] INT           NULL,
    [unassign_flg] INT           DEFAULT ((0)) NULL,
    [stage_shpflg] INT           DEFAULT ((0)) NULL,
    [ena_ems_flg]  INT           DEFAULT ((1)) NULL,
    CONSTRAINT [cancod_pk] PRIMARY KEY CLUSTERED ([codval] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [cancod_defflg_ck] CHECK ([defflg]=(0) OR [defflg]=(1)),
    CONSTRAINT [cancod_enaemsflgck] CHECK ([ena_ems_flg]=(0) OR [ena_ems_flg]=(1)),
    CONSTRAINT [cancod_reaflg_ck] CHECK ([reaflg]=(0) OR [reaflg]=(1)),
    CONSTRAINT [cancod_rftflg_ck] CHECK ([rftflg]=(0) OR [rftflg]=(1)),
    CONSTRAINT [cancod_ruslocflgck] CHECK ([reuse_locflg]=(0) OR [reuse_locflg]=(1)),
    CONSTRAINT [cancod_stgshpflgck] CHECK ([stage_shpflg]=(0) OR [stage_shpflg]=(1)),
    CONSTRAINT [cancod_unasgnflgck] CHECK ([unassign_flg]=(0) OR [unassign_flg]=(1))
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [cancod_voc_cod_ck]
    ON [dbo].[cancod]([voc_cod] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Represents all of the pick cancelleation codes available to the user.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cancod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies the implicit system code for the pick cancellation code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cancod', @level2type = N'COLUMN', @level2name = N'codval';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to indicate what order to display the cancel codes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cancod', @level2type = N'COLUMN', @level2name = N'srtseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies whether reallocation should be initiated for this cancel code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cancod', @level2type = N'COLUMN', @level2name = N'reaflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allcation Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cancod', @level2type = N'COLUMN', @level2name = N'alctyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates which cancel codes get cycle counts generated when any pick is
   cacelled, and control whether the work is released right away or could be released at a later
   time.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cancod', @level2type = N'COLUMN', @level2name = N'cyc_cnt_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default Flag.  Specifies what cancellation code should be displayed by default.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cancod', @level2type = N'COLUMN', @level2name = N'defflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies if this Cancel Code is available to RF.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cancod', @level2type = N'COLUMN', @level2name = N'rftflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Voice Code - Unique numeric code that is spoken by the user during voice picking.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cancod', @level2type = N'COLUMN', @level2name = N'voc_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Datetime Stamp of last change to row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cancod', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of user that performed last modification.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cancod', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies if allocation should use or should not ignore the previously allocated location, found in the Cancelled Pick (canpck) table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cancod', @level2type = N'COLUMN', @level2name = N'reuse_locflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'When the pick gets cancelled and this flag is set, the pick status will be changed to un-assigned.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cancod', @level2type = N'COLUMN', @level2name = N'unassign_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'When user cancels a pick and selects a cancel code that has the stage shipment flag set, write stage shipment will be called.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cancod', @level2type = N'COLUMN', @level2name = N'stage_shpflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag to specify if this pick cancellation should raise an EMS event.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cancod', @level2type = N'COLUMN', @level2name = N'ena_ems_flg';

