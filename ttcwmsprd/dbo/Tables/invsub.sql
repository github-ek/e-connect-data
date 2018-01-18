CREATE TABLE [dbo].[invsub] (
    [subnum]            NVARCHAR (30)   NOT NULL,
    [lodnum]            NVARCHAR (30)   NOT NULL,
    [subwgt]            NUMERIC (19, 4) NULL,
    [prmflg]            INT             NULL,
    [phyflg]            INT             NULL,
    [mvsflg]            INT             NULL,
    [ctnflg]            INT             DEFAULT ((0)) NULL,
    [idmflg]            INT             DEFAULT ((0)) NULL,
    [distro_ctnopn_flg] INT             DEFAULT ((0)) NULL,
    [wrkref]            NVARCHAR (12)   NULL,
    [tagdev]            NVARCHAR (20)   NULL,
    [adddte]            DATETIME        NULL,
    [lstmov]            DATETIME        NULL,
    [lstdte]            DATETIME        NULL,
    [lstcod]            NVARCHAR (20)   NULL,
    [lst_usr_id]        NVARCHAR (40)   NULL,
    [subucc]            NVARCHAR (20)   NULL,
    [uccdte]            DATETIME        NULL,
    [subtag]            NVARCHAR (40)   NULL,
    [sub_tagsts]        NVARCHAR (40)   NULL,
    [asset_typ]         NVARCHAR (30)   NULL,
    [u_version]         INT             NULL,
    [ins_dt]            DATETIME        NULL,
    [last_upd_dt]       DATETIME        NULL,
    [ins_user_id]       NVARCHAR (40)   NULL,
    [last_upd_user_id]  NVARCHAR (40)   NULL,
    CONSTRAINT [invsub_pk] PRIMARY KEY CLUSTERED ([subnum] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [invsub_ctnflg_ck] CHECK ([ctnflg]=(0) OR [ctnflg]=(1)),
    CONSTRAINT [invsub_ctnopn_ck] CHECK ([distro_ctnopn_flg]=(0) OR [distro_ctnopn_flg]=(1)),
    CONSTRAINT [invsub_idmflg_ck] CHECK ([idmflg]=(0) OR [idmflg]=(1)),
    CONSTRAINT [invsub_mvsflg_ck] CHECK ([mvsflg]=(0) OR [mvsflg]=(1)),
    CONSTRAINT [invsub_phyflg_ck] CHECK ([phyflg]=(0) OR [phyflg]=(1)),
    CONSTRAINT [invsub_prmflg_ck] CHECK ([prmflg]=(0) OR [prmflg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [invsub_idx1]
    ON [dbo].[invsub]([lodnum] ASC, [phyflg] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [invsub_idx2]
    ON [dbo].[invsub]([tagdev] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [invsub_idx3]
    ON [dbo].[invsub]([lodnum] ASC, [subnum] ASC, [phyflg] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [invsub_idx4]
    ON [dbo].[invsub]([lodnum] ASC, [phyflg] ASC, [subnum] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [invsub_idx5]
    ON [dbo].[invsub]([lodnum] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [invsub_wrkref]
    ON [dbo].[invsub]([wrkref] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [invsub_subucc]
    ON [dbo].[invsub]([subucc] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [invsub_subtag]
    ON [dbo].[invsub]([subtag] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The inventory subload table is used to represent cases in the system. If physical cases are not tracked, then the invsub table simply provides a mechanism to connect invdtl entries to invlod entries.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsub';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Uniquely identified invsub record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsub', @level2type = N'COLUMN', @level2name = N'subnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifies which inventory load (invlod) record this subload is attached to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsub', @level2type = N'COLUMN', @level2name = N'lodnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'In systems where scales are available, this field may be used to store the physical weight of the case that this invsub entry represents.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsub', @level2type = N'COLUMN', @level2name = N'subwgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Set if this is a ''permanent'' subload.  Permanent subloads are used throughout the system when it is necessary to provide a container to attach details to.  Additionally, in systems utilizing totes, they are represented as ''perm subloads''', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsub', @level2type = N'COLUMN', @level2name = N'prmflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will be set to 1 if this invsub record represents a physical case in the system.  In this case, the subnum will be set to the external labeling on the physical case.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsub', @level2type = N'COLUMN', @level2name = N'phyflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is used to indicate if this subload entry may be moved.  In the case where permanent subloads are used to provide places to attach inventory, it is seldom desired that those permanent subs be allowed to move.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsub', @level2type = N'COLUMN', @level2name = N'mvsflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will be set if this sub was created as a result of a cartonization or overpack operation.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsub', @level2type = N'COLUMN', @level2name = N'ctnflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag will be set if details are not allowed to move out from under this subload.  When serialized product is tracked in a facility, it is sometimes desired to disable details from moving out of a serialized, physical case.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsub', @level2type = N'COLUMN', @level2name = N'idmflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The flag to show whether the put to store Carton is open or not.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsub', @level2type = N'COLUMN', @level2name = N'distro_ctnopn_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this subload represents a cartonized or overpacked case,  and the case was picked against a work reference, the wrkref field will map back to the pckwrk_hdr/pckwrk_dtl tables  to indicate which KIT pick this subload was picked against.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsub', @level2type = N'COLUMN', @level2name = N'wrkref';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used so that RF can tag cases for later operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsub', @level2type = N'COLUMN', @level2name = N'tagdev';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Set to the date and time this invsub entry was added to the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsub', @level2type = N'COLUMN', @level2name = N'adddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The last date/time this subload was moved.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsub', @level2type = N'COLUMN', @level2name = N'lstmov';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last date/time activity occurred on this subload.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsub', @level2type = N'COLUMN', @level2name = N'lstdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last activity code on this subload.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsub', @level2type = N'COLUMN', @level2name = N'lstcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last user which performed an activity on this subload.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsub', @level2type = N'COLUMN', @level2name = N'lst_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If UCC128 processing is installed and this case receives a UCC128 shipping label, then this field will be filled in with the value of that label.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsub', @level2type = N'COLUMN', @level2name = N'subucc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date/time the UCC128 shipping label was applied.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsub', @level2type = N'COLUMN', @level2name = N'uccdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The RFID tag associated to carton', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsub', @level2type = N'COLUMN', @level2name = N'subtag';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carton RFID Tag Status', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsub', @level2type = N'COLUMN', @level2name = N'sub_tagsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Type - Identifies the asset type for this sub', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsub', @level2type = N'COLUMN', @level2name = N'asset_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsub', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsub', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsub', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsub', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsub', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

