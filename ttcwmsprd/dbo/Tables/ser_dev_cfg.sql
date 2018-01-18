CREATE TABLE [dbo].[ser_dev_cfg] (
    [ser_dev_id]         NVARCHAR (50)   NOT NULL,
    [wh_id]              NVARCHAR (32)   NOT NULL,
    [ser_dev_typ]        NVARCHAR (20)   NOT NULL,
    [ser_port]           NVARCHAR (20)   NOT NULL,
    [baudrate]           INT             NOT NULL,
    [databits]           INT             NOT NULL,
    [parity]             NVARCHAR (10)   NOT NULL,
    [stopbits]           NVARCHAR (3)    NOT NULL,
    [scale_comm_cmd]     NVARCHAR (2000) NULL,
    [scale_timeout]      INT             NULL,
    [scanner_encoding]   NVARCHAR (50)   NULL,
    [scanner_wait_time]  INT             NULL,
    [scanner_delay_time] INT             NULL,
    [ins_dt]             DATETIME        NULL,
    [last_upd_dt]        DATETIME        NULL,
    [ins_user_id]        NVARCHAR (40)   NULL,
    [last_upd_user_id]   NVARCHAR (40)   NULL,
    CONSTRAINT [ser_dev_cfg_pk] PRIMARY KEY CLUSTERED ([ser_dev_id] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Serial Device Configurations table stores the connection and protocol configuration for peripherals connecting through the serial port, such as scales or bar code scanners.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_dev_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Serial Device Configuration ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_dev_cfg', @level2type = N'COLUMN', @level2name = N'ser_dev_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_dev_cfg', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Serial Device Type - Type of serial device for the configuration; scale, barcode scanner ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_dev_cfg', @level2type = N'COLUMN', @level2name = N'ser_dev_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Port', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_dev_cfg', @level2type = N'COLUMN', @level2name = N'ser_port';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Baud Rate: The rate of transfer for the serial device', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_dev_cfg', @level2type = N'COLUMN', @level2name = N'baudrate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Data Bits: The number of data bits used for this serial device', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_dev_cfg', @level2type = N'COLUMN', @level2name = N'databits';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Parity: The type of parity check used for this serial device', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_dev_cfg', @level2type = N'COLUMN', @level2name = N'parity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stop Bits: The number of stop bits used for this serial device', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_dev_cfg', @level2type = N'COLUMN', @level2name = N'stopbits';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Barcode Scanner Encoding - Text encoding used for the data received from the scanner', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_dev_cfg', @level2type = N'COLUMN', @level2name = N'scale_comm_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Serial Scale Communication Command - Serial Scale Communication Command; a MOCA command which will handle the serial communication', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_dev_cfg', @level2type = N'COLUMN', @level2name = N'scale_timeout';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Serial Scale Timeout', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_dev_cfg', @level2type = N'COLUMN', @level2name = N'scanner_encoding';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Barcode Scanner Wait Time - Time interval to wait for a full message from the barcode scanner, in milliseconds', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_dev_cfg', @level2type = N'COLUMN', @level2name = N'scanner_wait_time';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Barcode Scanner Delay Time - Time interval to ignore reads after a scan, to ignore repeated scans, in milliseconds', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_dev_cfg', @level2type = N'COLUMN', @level2name = N'scanner_delay_time';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert Date - The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_dev_cfg', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Update Date - The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_dev_cfg', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert User ID - The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_dev_cfg', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Update User ID - The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_dev_cfg', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

