CREATE TABLE [dbo].[ord_note] (
    [client_id]        NVARCHAR (32) NOT NULL,
    [ordnum]           NVARCHAR (35) NOT NULL,
    [nottyp]           NVARCHAR (40) NOT NULL,
    [notlin]           NVARCHAR (4)  NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [nottxt]           NVARCHAR (60) NOT NULL,
    [edtflg]           INT           DEFAULT ((0)) NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [ord_note_pk] PRIMARY KEY CLUSTERED ([ordnum] ASC, [nottyp] ASC, [notlin] ASC, [wh_id] ASC, [client_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [ord_note_edtflg_ck] CHECK ([edtflg]=(0) OR [edtflg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [ord_note_wh_id]
    ON [dbo].[ord_note]([wh_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Represents notes associted with the order. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_note';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client ID - The client code that owns this order line.  In a non-3PL system, this value defaults to ''----''. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_note', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Number - A number which identifies the order to the system.   ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_note', @level2type = N'COLUMN', @level2name = N'ordnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Note Type ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_note', @level2type = N'COLUMN', @level2name = N'nottyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to distinguish multiple lines of notes ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_note', @level2type = N'COLUMN', @level2name = N'notlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - the warehouse in which the order is to be fulfilled', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_note', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Text of the note associated to the order ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_note', @level2type = N'COLUMN', @level2name = N'nottxt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Edit Flag - Used by the Integrator system to Refresh order downloads.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_note', @level2type = N'COLUMN', @level2name = N'edtflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_note', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_note', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_note', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_note', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_note', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

