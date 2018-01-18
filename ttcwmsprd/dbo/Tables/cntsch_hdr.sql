CREATE TABLE [dbo].[cntsch_hdr] (
    [cnt_id]           NVARCHAR (32) NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [schdte]           DATETIME      NOT NULL,
    [reqtyp]           NVARCHAR (1)  NOT NULL,
    [cnttyp]           NVARCHAR (3)  NULL,
    [cnt_tmpl_id]      NVARCHAR (20) NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [cntsch_hdr_pk] PRIMARY KEY CLUSTERED ([cnt_id] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Count ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cntsch_hdr', @level2type = N'COLUMN', @level2name = N'cnt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cntsch_hdr', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Scheduled Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cntsch_hdr', @level2type = N'COLUMN', @level2name = N'schdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Request type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cntsch_hdr', @level2type = N'COLUMN', @level2name = N'reqtyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Cycle Count Template Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cntsch_hdr', @level2type = N'COLUMN', @level2name = N'cnt_tmpl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cntsch_hdr', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Update Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cntsch_hdr', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cntsch_hdr', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Update User', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cntsch_hdr', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

