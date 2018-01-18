CREATE TABLE [dbo].[lblfmt] (
    [lblfmt]      NVARCHAR (20)  NOT NULL,
    [def_printer] NVARCHAR (200) NULL,
    [rfid_flg]    INT            DEFAULT ((0)) NULL,
    [moddte]      DATETIME       NULL,
    [mod_usr_id]  NVARCHAR (40)  NULL,
    CONSTRAINT [lblfmt_pk] PRIMARY KEY CLUSTERED ([lblfmt] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [lblfmt_rfid_flg_ck] CHECK ([rfid_flg]=(0) OR [rfid_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Where label format names will be uniquely stored along with the type of document they are.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lblfmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Holds the label format name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lblfmt', @level2type = N'COLUMN', @level2name = N'lblfmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Holds the default printer for this particular label format.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lblfmt', @level2type = N'COLUMN', @level2name = N'def_printer';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'RFID Flag - indicates whether RFID printer should be used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lblfmt', @level2type = N'COLUMN', @level2name = N'rfid_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Datetime Stamp of last change to row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lblfmt', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of user that performed last modification.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lblfmt', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

