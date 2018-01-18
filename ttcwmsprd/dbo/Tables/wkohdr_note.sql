CREATE TABLE [dbo].[wkohdr_note] (
    [wkonum]    NVARCHAR (20) NOT NULL,
    [client_id] NVARCHAR (32) NOT NULL,
    [wkorev]    NVARCHAR (10) NOT NULL,
    [notlin]    NVARCHAR (4)  NOT NULL,
    [wh_id]     NVARCHAR (32) NOT NULL,
    [nottxt]    NVARCHAR (40) NOT NULL,
    [edtflg]    INT           NULL,
    CONSTRAINT [wkohdr_note_pk] PRIMARY KEY CLUSTERED ([wkonum] ASC, [wkorev] ASC, [notlin] ASC, [wh_id] ASC, [client_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [wkohdr_notedtflgck] CHECK ([edtflg]=(0) OR [edtflg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Represents notes associated with work orders.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr_note';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A number which identifies the work order to the system.   ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr_note', @level2type = N'COLUMN', @level2name = N'wkonum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The client code that owns this work order.  In a non-3PL system, this value defaults to ''----''. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr_note', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used if multiple copies of a standard work order are desired.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr_note', @level2type = N'COLUMN', @level2name = N'wkorev';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to distinguish multiple lines of notes ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr_note', @level2type = N'COLUMN', @level2name = N'notlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - the warehouse in which the work order is to be processed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr_note', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Text of the note associated to the work order ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr_note', @level2type = N'COLUMN', @level2name = N'nottxt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used in host interfaces when host system sends a complete update of the work order on each change. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr_note', @level2type = N'COLUMN', @level2name = N'edtflg';

