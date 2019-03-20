CREATE TABLE [dbo].[car_move_note] (
    [car_move_id] NVARCHAR (10) NOT NULL,
    [notlin]      NVARCHAR (4)  NOT NULL,
    [nottyp]      NVARCHAR (40) NOT NULL,
    [nottxt]      NVARCHAR (40) NOT NULL,
    [tms_notlin]  NVARCHAR (4)  NOT NULL,
    [moddte]      DATETIME      NULL,
    [mod_usr_id]  NVARCHAR (40) NULL,
    CONSTRAINT [car_move_note_pk] PRIMARY KEY CLUSTERED ([car_move_id] ASC, [notlin] ASC, [nottyp] ASC) WITH (FILLFACTOR = 90)
);




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The carrier move note table defines notes for a particular carrier move. A carrier move associates shipments together into a trailer', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move_note';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carrier Move ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move_note', @level2type = N'COLUMN', @level2name = N'car_move_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Note Line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move_note', @level2type = N'COLUMN', @level2name = N'notlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Type of the note (GENERIC,EDI)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move_note', @level2type = N'COLUMN', @level2name = N'nottyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Note Text.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move_note', @level2type = N'COLUMN', @level2name = N'nottxt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'TM Note Line. This is used to convert the 132 character note line that TM uses
   to the 40 character note line that is used in WM/d.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move_note', @level2type = N'COLUMN', @level2name = N'tms_notlin';




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified Date.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move_note', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified User Id.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move_note', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

