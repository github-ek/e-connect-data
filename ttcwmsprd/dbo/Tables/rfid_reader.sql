CREATE TABLE [dbo].[rfid_reader] (
    [reader_id]        NVARCHAR (20) NOT NULL,
    [reader_ext_id]    NVARCHAR (30) NULL,
    [epcloc]           NVARCHAR (60) NULL,
    [grp_nam]          NVARCHAR (40) NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [reader_loc]       NVARCHAR (20) NOT NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [rfid_reader_pk] PRIMARY KEY CLUSTERED ([reader_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The RFID reader table contains current information for a given RFID reader.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_reader';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The id of this RFID reader.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_reader', @level2type = N'COLUMN', @level2name = N'reader_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The distributed data group.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_reader', @level2type = N'COLUMN', @level2name = N'grp_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The warehouse id for this RFID reader.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_reader', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Location of this RFID reader.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_reader', @level2type = N'COLUMN', @level2name = N'reader_loc';

