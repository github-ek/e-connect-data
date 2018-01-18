CREATE TABLE [dbo].[hldmst_note] (
    [hldpfx] NVARCHAR (32) NOT NULL,
    [hldnum] NVARCHAR (10) NOT NULL,
    [wh_id]  NVARCHAR (32) NOT NULL,
    [notlin] NVARCHAR (4)  NOT NULL,
    [nottxt] NVARCHAR (40) NOT NULL,
    [edtflg] INT           DEFAULT ((0)) NULL,
    CONSTRAINT [hldmst_note_pk] PRIMARY KEY CLUSTERED ([hldpfx] ASC, [hldnum] ASC, [wh_id] ASC, [notlin] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [hldmst_notedtflgck] CHECK ([edtflg]=(0) OR [edtflg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The hold master note table defines notes for a particular hold master.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst_note';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hold Prefix.  A prefix which denotes the origin of a hold.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst_note', @level2type = N'COLUMN', @level2name = N'hldpfx';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hold Number.  A unique user defined or system generated code which uniquely identifies each individual hold master.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst_note', @level2type = N'COLUMN', @level2name = N'hldnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID. Warehouse that owns the hold.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst_note', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Note Line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst_note', @level2type = N'COLUMN', @level2name = N'notlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Note Text.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst_note', @level2type = N'COLUMN', @level2name = N'nottxt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Edit Flag.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'hldmst_note', @level2type = N'COLUMN', @level2name = N'edtflg';

