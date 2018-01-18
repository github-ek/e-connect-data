CREATE TABLE [dbo].[rfid_tag_co_prefix] (
    [co_prefix]        NVARCHAR (13) NOT NULL,
    [co_prefix_index]  NVARCHAR (5)  NULL,
    [grp_nam]          NVARCHAR (40) NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [rfid_tag_co_pfx_pk] PRIMARY KEY CLUSTERED ([co_prefix] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [r_t_c_p_co_pre_idx]
    ON [dbo].[rfid_tag_co_prefix]([co_prefix_index] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The tag company prefix table is a lookup table to translate between company prefixes and company prefix indexes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_tag_co_prefix';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The company prefix.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_tag_co_prefix', @level2type = N'COLUMN', @level2name = N'co_prefix';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The company prefix index for this company prefix.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_tag_co_prefix', @level2type = N'COLUMN', @level2name = N'co_prefix_index';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The distributed data group.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_tag_co_prefix', @level2type = N'COLUMN', @level2name = N'grp_nam';

