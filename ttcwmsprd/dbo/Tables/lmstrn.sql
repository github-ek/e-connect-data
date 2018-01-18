CREATE TABLE [dbo].[lmstrn] (
    [lms_trn_id]       NVARCHAR (15)   NOT NULL,
    [lmsasn]           NVARCHAR (15)   NULL,
    [grpseq]           INT             NULL,
    [adrnum]           NVARCHAR (20)   NULL,
    [lmscod]           NVARCHAR (1)    NOT NULL,
    [lmstyp]           NVARCHAR (1)    NOT NULL,
    [lmswrk]           NVARCHAR (15)   NULL,
    [actcod]           NVARCHAR (40)   NOT NULL,
    [oprcod]           NVARCHAR (9)    NULL,
    [palqty]           INT             NULL,
    [casqty]           INT             NULL,
    [inpqty]           INT             NULL,
    [untqty]           INT             NULL,
    [prtnum]           NVARCHAR (50)   NULL,
    [prt_client_id]    NVARCHAR (32)   NULL,
    [prtdsc]           NVARCHAR (250)  NULL,
    [untvol]           NUMERIC (19, 4) NULL,
    [untwgt]           NUMERIC (19, 4) NULL,
    [usr_id]           NVARCHAR (40)   NOT NULL,
    [begdte]           DATETIME        NOT NULL,
    [enddte]           DATETIME        NOT NULL,
    [plndte]           DATETIME        NULL,
    [lodnum]           NVARCHAR (30)   NULL,
    [subnum]           NVARCHAR (30)   NULL,
    [dtlnum]           NVARCHAR (30)   NULL,
    [dstlod]           NVARCHAR (30)   NULL,
    [dstsub]           NVARCHAR (30)   NULL,
    [wh_id]            NVARCHAR (32)   NULL,
    [srcare]           NVARCHAR (10)   NULL,
    [srcloc]           NVARCHAR (20)   NULL,
    [dstare]           NVARCHAR (10)   NULL,
    [dstloc]           NVARCHAR (20)   NULL,
    [devcod]           NVARCHAR (20)   NULL,
    [eqptyp]           NVARCHAR (10)   NULL,
    [disc_proc_id]     NVARCHAR (40)   NULL,
    [hldflg]           INT             NULL,
    [lstflg]           INT             NULL,
    [assign_flg]       INT             DEFAULT ((0)) NOT NULL,
    [cstnum]           NVARCHAR (20)   NULL,
    [supnum]           NVARCHAR (32)   NULL,
    [trlr_num]         NVARCHAR (20)   NULL,
    [user_def_1]       NVARCHAR (40)   NULL,
    [user_def_2]       NVARCHAR (40)   NULL,
    [user_def_3]       NVARCHAR (40)   NULL,
    [user_def_4]       NVARCHAR (40)   NULL,
    [user_def_5]       NVARCHAR (40)   NULL,
    [u_version]        INT             NULL,
    [ins_dt]           DATETIME        NULL,
    [last_upd_dt]      DATETIME        NULL,
    [ins_user_id]      NVARCHAR (40)   NULL,
    [last_upd_user_id] NVARCHAR (40)   NULL,
    [sent_dte]         DATETIME        NULL,
    CONSTRAINT [lmstrn_pk] PRIMARY KEY CLUSTERED ([lms_trn_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [lmstrn_assign_ck] CHECK ([assign_flg]=(0) OR [assign_flg]=(1)),
    CONSTRAINT [lmstrn_hldflg_ck] CHECK ([hldflg]=(0) OR [hldflg]=(1)),
    CONSTRAINT [lmstrn_lstflg_ck] CHECK ([lstflg]=(0) OR [lstflg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [lmstrn_devcod]
    ON [dbo].[lmstrn]([devcod] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [lmstrn_idx1]
    ON [dbo].[lmstrn]([lmsasn] ASC, [grpseq] ASC, [begdte] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [lmstrn_idx2]
    ON [dbo].[lmstrn]([devcod] ASC, [usr_id] ASC, [lmsasn] ASC, [lmscod] ASC)
    INCLUDE([wh_id]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [lmstrn_idx3]
    ON [dbo].[lmstrn]([devcod] ASC, [wh_id] ASC, [hldflg] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The LMS activity table is used to map WM/Discrete activity codes to the LM work code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lmstrn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lmstrn', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The discrete procedure ID is used to accurately categorize and track the work in WM and match to the standards in WFM.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lmstrn', @level2type = N'COLUMN', @level2name = N'disc_proc_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customer Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lmstrn', @level2type = N'COLUMN', @level2name = N'cstnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Supplier Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lmstrn', @level2type = N'COLUMN', @level2name = N'supnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Trailer Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lmstrn', @level2type = N'COLUMN', @level2name = N'trlr_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User configurable field, the value of which is passed to WFM with the user''s WFM assignment data. Typically these user configurable fields are mapped to inbound receipt information or outbound order information and are used in the WFM product as the source for the creation of custom labor standards.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lmstrn', @level2type = N'COLUMN', @level2name = N'user_def_1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User configurable field, the value of which is passed to WFM with the user''s WFM assignment data. Typically these user configurable fields are mapped to inbound receipt information or outbound order information and are used in the WFM product as the source for the creation of custom labor standards.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lmstrn', @level2type = N'COLUMN', @level2name = N'user_def_2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User configurable field, the value of which is passed to WFM with the user''s WFM assignment data. Typically these user configurable fields are mapped to inbound receipt information or outbound order information and are used in the WFM product as the source for the creation of custom labor standards.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lmstrn', @level2type = N'COLUMN', @level2name = N'user_def_3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User configurable field, the value of which is passed to WFM with the user''s WFM assignment data. Typically these user configurable fields are mapped to inbound receipt information or outbound order information and are used in the WFM product as the source for the creation of custom labor standards.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lmstrn', @level2type = N'COLUMN', @level2name = N'user_def_4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User configurable field, the value of which is passed to WFM with the user''s WFM assignment data. Typically these user configurable fields are mapped to inbound receipt information or outbound order information and are used in the WFM product as the source for the creation of custom labor standards.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lmstrn', @level2type = N'COLUMN', @level2name = N'user_def_5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lmstrn', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lmstrn', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lmstrn', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lmstrn', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lmstrn', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was sent', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lmstrn', @level2type = N'COLUMN', @level2name = N'sent_dte';

