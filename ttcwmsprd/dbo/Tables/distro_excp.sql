CREATE TABLE [dbo].[distro_excp] (
    [distro_excp_id]   NVARCHAR (35)  NOT NULL,
    [wh_id]            NVARCHAR (32)  NOT NULL,
    [bldg_id]          NVARCHAR (10)  NOT NULL,
    [arecod]           NVARCHAR (10)  NOT NULL,
    [stoloc]           NVARCHAR (20)  NOT NULL,
    [lodnum]           NVARCHAR (30)  NOT NULL,
    [excp_code]        NVARCHAR (200) NULL,
    [prtnum]           NVARCHAR (50)  NULL,
    [prt_client_id]    NVARCHAR (32)  NULL,
    [rptqty]           INT            NULL,
    [expqty]           INT            NULL,
    [rsv_flg]          INT            DEFAULT ((0)) NOT NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [distro_excp_pk] PRIMARY KEY CLUSTERED ([distro_excp_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [distro_excp_rsvflgck] CHECK ([rsv_flg]=(0) OR [rsv_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table will track exception related to unexpected residual inventory that is remaining after a voice distribution assignment.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_excp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique Id to identify the distribution exception.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_excp', @level2type = N'COLUMN', @level2name = N'distro_excp_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID for the distribution exception.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_excp', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Building ID in which the inventory is stored.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_excp', @level2type = N'COLUMN', @level2name = N'bldg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Area Code in which the inventory is stored.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_excp', @level2type = N'COLUMN', @level2name = N'arecod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Storage Location in which the inventory is stored.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_excp', @level2type = N'COLUMN', @level2name = N'stoloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique identifier for the inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_excp', @level2type = N'COLUMN', @level2name = N'lodnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Exception Code for this distribution exception.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_excp', @level2type = N'COLUMN', @level2name = N'excp_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Also referred to as item number or SKU.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_excp', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The client which owns the item number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_excp', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The actually distributed quantity.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_excp', @level2type = N'COLUMN', @level2name = N'rptqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The expected distributed quantity.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_excp', @level2type = N'COLUMN', @level2name = N'expqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicate whether this distribution excepiton is resolved or not.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_excp', @level2type = N'COLUMN', @level2name = N'rsv_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_excp', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'	The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_excp', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_excp', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_excp', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

