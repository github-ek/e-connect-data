CREATE TABLE [dbo].[rfid_reader_tag_ids] (
    [reader_id]        NVARCHAR (20) NOT NULL,
    [tag_id]           NVARCHAR (30) NOT NULL,
    [grp_nam]          NVARCHAR (40) NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [rfid_rdr_tag_id_pk] PRIMARY KEY CLUSTERED ([reader_id] ASC, [tag_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The RFID reader tag ids table contains the last tag ids read at the gateway.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_reader_tag_ids';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The id of this RFID reader.  The description for this reader exists in the dscmst table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_reader_tag_ids', @level2type = N'COLUMN', @level2name = N'reader_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The tag id.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_reader_tag_ids', @level2type = N'COLUMN', @level2name = N'tag_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The distributed data group.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_reader_tag_ids', @level2type = N'COLUMN', @level2name = N'grp_nam';

