CREATE TABLE [dbo].[excp_hrs_set] (
    [excp_hrs_set_id]  NVARCHAR (16) NOT NULL,
    [excp_hrs_set_nam] NVARCHAR (40) NOT NULL,
    [temp_flg]         INT           NOT NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [excp_hrs_set_pk] PRIMARY KEY CLUSTERED ([excp_hrs_set_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [exphrsset_tmpflgck] CHECK ([temp_flg]=(0) OR [temp_flg]=(1))
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [excp_hrs_set_nam]
    ON [dbo].[excp_hrs_set]([excp_hrs_set_nam] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Exceptions to recurring weekly operational hours for a location/operation.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'excp_hrs_set';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(PK, Required) Unique identifier and primary key. This field can be referenced by table adr_tran_opr in TM.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'excp_hrs_set', @level2type = N'COLUMN', @level2name = N'excp_hrs_set_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(Required) Unique name identifying the set.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'excp_hrs_set', @level2type = N'COLUMN', @level2name = N'excp_hrs_set_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(Required) Flag indicating if this is a temporary entry.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'excp_hrs_set', @level2type = N'COLUMN', @level2name = N'temp_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Generation Number (used for optimistic locking).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'excp_hrs_set', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of the create.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'excp_hrs_set', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of the last update.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'excp_hrs_set', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID of the user that created the record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'excp_hrs_set', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID of the user that last modified the record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'excp_hrs_set', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

