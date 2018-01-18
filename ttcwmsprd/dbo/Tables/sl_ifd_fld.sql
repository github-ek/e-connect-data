CREATE TABLE [dbo].[sl_ifd_fld] (
    [ifd_id]             NVARCHAR (30)  NOT NULL,
    [ifd_ver]            NVARCHAR (15)  NOT NULL,
    [ifd_seg_id]         NVARCHAR (30)  NOT NULL,
    [ifd_fld_id]         NVARCHAR (30)  NOT NULL,
    [ifd_fld_descr]      NVARCHAR (250) NULL,
    [ifd_fld_ordr]       NUMERIC (5)    NOT NULL,
    [ifd_fld_tag]        NVARCHAR (60)  NULL,
    [eo_id]              NVARCHAR (30)  NULL,
    [eo_ver]             NVARCHAR (15)  NULL,
    [eo_seg_id]          NVARCHAR (30)  NULL,
    [eo_fld_id]          NVARCHAR (30)  NULL,
    [evt_id]             NVARCHAR (30)  NULL,
    [evt_arg_id]         NVARCHAR (30)  NULL,
    [eo_fld_grp_func]    NVARCHAR (30)  NULL,
    [ifd_fld_sql_ordr]   NUMERIC (5)    NULL,
    [ifd_fld_class_cd]   NVARCHAR (5)   NULL,
    [data_typ_cd]        NVARCHAR (5)   NOT NULL,
    [fld_alg_id]         NVARCHAR (30)  NULL,
    [kw_id]              NVARCHAR (30)  NULL,
    [pre_alg_bnd_var_id] NVARCHAR (30)  NULL,
    [fld_val]            NVARCHAR (MAX) NULL,
    [sql_expr]           NVARCHAR (MAX) NULL,
    [default_expr]       NVARCHAR (MAX) NULL,
    [change_expr]        NVARCHAR (MAX) NULL,
    [fld_jus_cd]         NVARCHAR (5)   NOT NULL,
    [fld_fmt]            NVARCHAR (50)  NULL,
    [fld_trm_cd]         NVARCHAR (5)   NOT NULL,
    [pad_char]           NVARCHAR (1)   NULL,
    [trm_char]           NVARCHAR (1)   NULL,
    [ifd_fld_len]        NUMERIC (8)    NULL,
    [ifd_fld_attr_cd]    NVARCHAR (5)   NULL,
    [u_version]          NUMERIC (5)    NULL,
    [ins_dt]             DATETIME       NULL,
    [last_upd_dt]        DATETIME       NULL,
    [ins_user_id]        NVARCHAR (40)  NULL,
    [last_upd_user_id]   NVARCHAR (40)  NULL,
    [create_only_flg]    NVARCHAR (1)   NULL,
    [ol_fld_tag]         NVARCHAR (60)  NULL,
    [ol_grp_func]        NVARCHAR (30)  NULL,
    [validation_cmnt]    NVARCHAR (250) NULL,
    [required_flg]       NVARCHAR (1)   NULL,
    [default_val_cmnt]   NVARCHAR (250) NULL,
    [ifd_fld_max_chars]  NUMERIC (8)    NULL,
    CONSTRAINT [sl_ifd_fld_pk] PRIMARY KEY CLUSTERED ([ifd_id] ASC, [ifd_ver] ASC, [ifd_seg_id] ASC, [ifd_fld_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_ifd_fld_fk_alg] FOREIGN KEY ([fld_alg_id]) REFERENCES [dbo].[sl_alg_def] ([alg_id]),
    CONSTRAINT [sl_ifd_fld_fk_kw] FOREIGN KEY ([kw_id]) REFERENCES [dbo].[sl_kw_def] ([kw_id]),
    CONSTRAINT [sl_ifdfldfkeofld] FOREIGN KEY ([eo_id], [eo_ver], [eo_seg_id], [eo_fld_id]) REFERENCES [dbo].[sl_eo_fld] ([eo_id], [eo_ver], [eo_seg_id], [eo_fld_id]),
    CONSTRAINT [sl_ifdfldfkevtarg] FOREIGN KEY ([evt_id], [evt_arg_id]) REFERENCES [dbo].[sl_evt_arg_def] ([evt_id], [evt_arg_id]),
    CONSTRAINT [sl_ifdfldfkifdseg] FOREIGN KEY ([ifd_id], [ifd_ver], [ifd_seg_id]) REFERENCES [dbo].[sl_ifd_seg] ([ifd_id], [ifd_ver], [ifd_seg_id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [sl_ifdfldfkeofld]
    ON [dbo].[sl_ifd_fld]([eo_id] ASC, [eo_ver] ASC, [eo_seg_id] ASC, [eo_fld_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_ifdfldfkevtarg]
    ON [dbo].[sl_ifd_fld]([evt_id] ASC, [evt_arg_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_ifd_fld_fk_alg]
    ON [dbo].[sl_ifd_fld]([fld_alg_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_ifd_fld_fk_kw]
    ON [dbo].[sl_ifd_fld]([kw_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines an IFD field.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'ifd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'ifd_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD segment name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'ifd_seg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD field name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'ifd_fld_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The IFD field description', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'ifd_fld_descr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The IFD field order', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'ifd_fld_ordr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The IFD field tag', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'ifd_fld_tag';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The event output name (only for result IFD)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'eo_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The event output version (only for result IFD)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'eo_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The event output segment name (only for result IFD)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'eo_seg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The event output field name (only for result IFD)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'eo_fld_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The event name (only for result IFD)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'evt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The event argument name (only for result IFD)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'evt_arg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Event output field group function (only for result IFD)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'eo_fld_grp_func';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The IFD field SQL order', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'ifd_fld_sql_ordr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The IFD field class type (only for result IFD):ALG, CO, EA, EED, EEU, EO, ESE, IE, IFD, KW, OL, PA (Use command to get more details: sl_list col_vp where db_col_id = ''IFD_FLD_CLASS_CD'')', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'ifd_fld_class_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The data type of eo segment field: C = Character, D = Date/Time, N = Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'data_typ_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The Algorithm of the field', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'fld_alg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The keyword name (only for result IFD)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'kw_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The bind variable name of algorithm (only for result IFD)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'pre_alg_bnd_var_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The field value', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'fld_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SQL expression', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'sql_expr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default expression (only for result IFD)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'default_expr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Change expression (only for result IFD)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'change_expr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The field justification type: L = Left Justify, N = No Justification, R = Right Justify', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'fld_jus_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Field format', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'fld_fmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The field trim type: B = Left and Right Trimming, L = Left Trimming, N = No Trimming, R = Right Trimming', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'fld_trm_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pad character', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'pad_char';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Trim character', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'trm_char';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The length of IFD field', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'ifd_fld_len';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The IFD field attribute type: XATTR = XML Attribute, XCMNT = XML Comment, XELEM = XML Element, XIGNR = XML Ignore, XPI = XML Processing Instruction, XTXTN = XML Text Node, XTXTO = XML Text Only', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'ifd_fld_attr_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Use value only on create (only for result IFD)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'create_only_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Over-loaded field (only for result IFD)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'ol_fld_tag';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Over-loaded group function (only for result IFD)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'ol_grp_func';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Validation comments (documentation only)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'validation_cmnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Is required? (documentation only)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'required_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default value comments (documentation only)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_ifd_fld', @level2type = N'COLUMN', @level2name = N'default_val_cmnt';

