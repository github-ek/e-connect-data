CREATE TABLE [dbo].[cnt_tmpl_hdr] (
    [wh_id]              NVARCHAR (32) NOT NULL,
    [cnt_tmpl_id]        NVARCHAR (20) NOT NULL,
    [cnttyp]             NVARCHAR (3)  NOT NULL,
    [auto_gen_tmpl_flg]  INT           DEFAULT ((0)) NOT NULL,
    [request_cnt_by_opt] NVARCHAR (20) NOT NULL,
    [ins_dt]             DATETIME      NULL,
    [last_upd_dt]        DATETIME      NULL,
    [ins_user_id]        NVARCHAR (40) NULL,
    [last_upd_user_id]   NVARCHAR (40) NULL,
    CONSTRAINT [cnt_tmpl_hdr_pk] PRIMARY KEY CLUSTERED ([wh_id] ASC, [cnt_tmpl_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [cnt_tmph_agtf_ck] CHECK ([auto_gen_tmpl_flg]=(0) OR [auto_gen_tmpl_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnt_tmpl_hdr', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Cycle Count Template ID - Cycle Count Template Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnt_tmpl_hdr', @level2type = N'COLUMN', @level2name = N'cnt_tmpl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Count Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnt_tmpl_hdr', @level2type = N'COLUMN', @level2name = N'cnttyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Auto Generate Cycle Count', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnt_tmpl_hdr', @level2type = N'COLUMN', @level2name = N'auto_gen_tmpl_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Request Count By - Request Count By Option', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnt_tmpl_hdr', @level2type = N'COLUMN', @level2name = N'request_cnt_by_opt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert Date - The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnt_tmpl_hdr', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Update Date - The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnt_tmpl_hdr', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert User ID - The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnt_tmpl_hdr', @level2type = N'COLUMN', @level2name = N'ins_user_id';

