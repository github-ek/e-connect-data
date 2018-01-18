CREATE TABLE [dbo].[prtftp_dtl] (
    [prtnum]           NVARCHAR (50)   NOT NULL,
    [ftpcod]           NVARCHAR (30)   NOT NULL,
    [prt_client_id]    NVARCHAR (32)   NOT NULL,
    [wh_id]            NVARCHAR (32)   NOT NULL,
    [uomcod]           NVARCHAR (2)    NOT NULL,
    [uomlvl]           INT             NOT NULL,
    [len]              NUMERIC (19, 4) DEFAULT ((0)) NOT NULL,
    [wid]              NUMERIC (19, 4) DEFAULT ((0)) NOT NULL,
    [hgt]              NUMERIC (19, 4) DEFAULT ((0)) NOT NULL,
    [grswgt]           NUMERIC (23, 8) DEFAULT ((0)) NOT NULL,
    [netwgt]           NUMERIC (23, 8) DEFAULT ((0)) NOT NULL,
    [pal_flg]          INT             DEFAULT ((0)) NOT NULL,
    [cas_flg]          INT             DEFAULT ((0)) NOT NULL,
    [pak_flg]          INT             DEFAULT ((0)) NOT NULL,
    [stk_flg]          INT             DEFAULT ((0)) NOT NULL,
    [rcv_flg]          INT             DEFAULT ((0)) NOT NULL,
    [untqty]           INT             NOT NULL,
    [ctn_flg]          INT             DEFAULT ((0)) NOT NULL,
    [thresh_pct]       NUMERIC (19, 4) DEFAULT ((100)) NOT NULL,
    [ctn_dstr_flg]     INT             DEFAULT ((0)) NOT NULL,
    [bulk_pck_flg]     INT             DEFAULT ((0)) NOT NULL,
    [ins_dt]           DATETIME        NULL,
    [last_upd_dt]      DATETIME        NULL,
    [ins_user_id]      NVARCHAR (40)   NULL,
    [last_upd_user_id] NVARCHAR (40)   NULL,
    CONSTRAINT [prtftp_dtl_pk] PRIMARY KEY CLUSTERED ([prtnum] ASC, [prt_client_id] ASC, [wh_id] ASC, [ftpcod] ASC, [uomcod] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [pd_bulkpckflg_ck] CHECK ([bulk_pck_flg]=(0) OR [bulk_pck_flg]=(1)),
    CONSTRAINT [pd_ctndstrflg_ck] CHECK ([ctn_dstr_flg]=(0) OR [ctn_dstr_flg]=(1)),
    CONSTRAINT [pd_ctnflg_ck] CHECK ([ctn_flg]=(0) OR [ctn_flg]=(1)),
    CONSTRAINT [prtftp_dtl_cas_flg_ck] CHECK ([cas_flg]=(0) OR [cas_flg]=(1)),
    CONSTRAINT [prtftp_dtl_pak_flg_ck] CHECK ([pak_flg]=(0) OR [pak_flg]=(1)),
    CONSTRAINT [prtftp_dtl_pal_flg_ck] CHECK ([pal_flg]=(0) OR [pal_flg]=(1)),
    CONSTRAINT [prtftp_dtl_rcv_flg_ck] CHECK ([rcv_flg]=(0) OR [rcv_flg]=(1)),
    CONSTRAINT [prtftp_dtl_stk_flg_ck] CHECK ([stk_flg]=(0) OR [stk_flg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [prtftp_dtl_idx1]
    ON [dbo].[prtftp_dtl]([wh_id] ASC, [prtnum] ASC, [prt_client_id] ASC, [ftpcod] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is created to define multiple UOMs to item&ftpcod.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp_dtl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp_dtl', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Footprint Code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp_dtl', @level2type = N'COLUMN', @level2name = N'ftpcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Client ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp_dtl', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp_dtl', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'UOM Code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp_dtl', @level2type = N'COLUMN', @level2name = N'uomcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'UOM level, a number which is manipulated by system. Upper UOM level has greater uomlvl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp_dtl', @level2type = N'COLUMN', @level2name = N'uomlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'UOM Length.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp_dtl', @level2type = N'COLUMN', @level2name = N'len';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'UOM Width.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp_dtl', @level2type = N'COLUMN', @level2name = N'wid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'UOM Height.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp_dtl', @level2type = N'COLUMN', @level2name = N'hgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'UOM gross weight which is weight with package.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp_dtl', @level2type = N'COLUMN', @level2name = N'grswgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'UOM net weight which weight without package.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp_dtl', @level2type = N'COLUMN', @level2name = N'netwgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pallet UOM flag, which indicates if current UOM is a pallet UOM.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp_dtl', @level2type = N'COLUMN', @level2name = N'pal_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Case UOM flag, which indicates if current UOM is case UOM.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp_dtl', @level2type = N'COLUMN', @level2name = N'cas_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Package UOM flag, which indicates if current UOM is package uom.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp_dtl', @level2type = N'COLUMN', @level2name = N'pak_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unit UOM flag, which indicates if current UOM is unit UOM.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp_dtl', @level2type = N'COLUMN', @level2name = N'stk_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Receive UOM Flag. This indicates if current uom is the default UOM when receiving.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp_dtl', @level2type = N'COLUMN', @level2name = N'rcv_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unit per UOM.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp_dtl', @level2type = N'COLUMN', @level2name = N'untqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allow Cartonization Flag, which indicates if this UOM can be cartonized.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp_dtl', @level2type = N'COLUMN', @level2name = N'ctn_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Minimum percentage value of platform capacity a partial platform must contain to qualify as a Threshold Pick. The value in this field can be greater than 0.000% and no more than 100.000%.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp_dtl', @level2type = N'COLUMN', @level2name = N'thresh_pct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag determines if the carton will be utilized in the distribution process. These carton types will not be used for cartonization.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp_dtl', @level2type = N'COLUMN', @level2name = N'ctn_dstr_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Bulk Picking Flag, which indicates if current UOM is supported Bulk Picking.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp_dtl', @level2type = N'COLUMN', @level2name = N'bulk_pck_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp_dtl', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row as was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp_dtl', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp_dtl', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp_dtl', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

