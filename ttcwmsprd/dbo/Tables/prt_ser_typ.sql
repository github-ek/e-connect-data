CREATE TABLE [dbo].[prt_ser_typ] (
    [prt_client_id]  NVARCHAR (32) NOT NULL,
    [prtnum]         NVARCHAR (50) NOT NULL,
    [ser_num_typ_id] NVARCHAR (10) NOT NULL,
    [moddte]         DATETIME      NULL,
    [mod_usr_id]     NVARCHAR (40) NULL,
    CONSTRAINT [prt_ser_typ_pk] PRIMARY KEY CLUSTERED ([prtnum] ASC, [ser_num_typ_id] ASC, [prt_client_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table represents the serial number types that are assigned to a item and client_id combination. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prt_ser_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client id of item number.  In non-3PL systems, this will set to a default of ''----''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prt_ser_typ', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The item number associated with this serial number type.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prt_ser_typ', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The ID created by the user to specify a type of serial number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prt_ser_typ', @level2type = N'COLUMN', @level2name = N'ser_num_typ_id';

