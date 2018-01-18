CREATE TABLE [dbo].[ser_num_typ] (
    [ser_num_typ_id]  NVARCHAR (10) NOT NULL,
    [ser_msk]         NVARCHAR (30) NULL,
    [rpt_to_host_flg] INT           DEFAULT ((0)) NULL,
    [srtseq]          INT           NULL,
    [moddte]          DATETIME      NULL,
    [mod_usr_id]      NVARCHAR (40) NULL,
    CONSTRAINT [ser_num_typ_pk] PRIMARY KEY CLUSTERED ([ser_num_typ_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sernumtyp_r_h_f_ck] CHECK ([rpt_to_host_flg]=(0) OR [rpt_to_host_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table represents the possible serial number types that can exist in the system. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_num_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Serial Number Type ID - The ID created by the user to specify a type of serial number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_num_typ', @level2type = N'COLUMN', @level2name = N'ser_num_typ_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Serial Mask - Indicates the format that the serial number should be scanned or typed in. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_num_typ', @level2type = N'COLUMN', @level2name = N'ser_msk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Report to Host Flag - Indicates whether serial numbers need to be sent to host system. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_num_typ', @level2type = N'COLUMN', @level2name = N'rpt_to_host_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sort Sequence - Indicates the sort order of serial number types.  This facilitates the ease of displaying serial numbers in RF forms. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_num_typ', @level2type = N'COLUMN', @level2name = N'srtseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified Date - Indicates the date the record was last modified. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_num_typ', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified by User ID - Indicates the last user to modify the record. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ser_num_typ', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

