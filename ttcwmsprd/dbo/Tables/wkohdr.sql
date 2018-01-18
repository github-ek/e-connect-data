CREATE TABLE [dbo].[wkohdr] (
    [wkonum]           NVARCHAR (20)   NOT NULL,
    [client_id]        NVARCHAR (32)   NOT NULL,
    [wkorev]           NVARCHAR (10)   NOT NULL,
    [wh_id]            NVARCHAR (32)   NOT NULL,
    [wko_typ]          NVARCHAR (10)   NOT NULL,
    [disass_prcloc]    NVARCHAR (20)   NULL,
    [prtnum]           NVARCHAR (50)   NOT NULL,
    [prt_client_id]    NVARCHAR (32)   NOT NULL,
    [invsts]           NVARCHAR (4)    NOT NULL,
    [rule_nam]         NVARCHAR (20)   NULL,
    [lotnum]           NVARCHAR (25)   NULL,
    [sup_lotnum]       NVARCHAR (25)   NULL,
    [revlvl]           NVARCHAR (25)   NULL,
    [orgcod]           NVARCHAR (25)   NULL,
    [wkosts]           NVARCHAR (1)    NOT NULL,
    [entdte]           DATETIME        NULL,
    [adddte]           DATETIME        NULL,
    [duedte]           DATETIME        NULL,
    [alcdte]           DATETIME        NULL,
    [clsdte]           DATETIME        NULL,
    [prcpri]           NVARCHAR (1)    NOT NULL,
    [pricod]           NVARCHAR (2)    NULL,
    [prcare]           NVARCHAR (10)   NOT NULL,
    [prdlin]           NVARCHAR (20)   NULL,
    [prd_tol_pct]      INT             NULL,
    [prjnum]           NVARCHAR (30)   NULL,
    [accnum]           NVARCHAR (30)   NULL,
    [prdqty]           INT             NOT NULL,
    [prd_catch_qty]    NUMERIC (19, 4) NULL,
    [wkoqty]           INT             NOT NULL,
    [wko_catch_qty]    NUMERIC (19, 4) NULL,
    [rpt_rtsqty]       NUMERIC (19, 4) NULL,
    [pckgr1]           NVARCHAR (20)   NULL,
    [cls_usr_id]       NVARCHAR (40)   NULL,
    [cmp_trk_flg]      INT             NULL,
    [rrlflg]           INT             NULL,
    [excl_flg]         INT             DEFAULT ((0)) NOT NULL,
    [start_flg]        INT             DEFAULT ((0)) NOT NULL,
    [arcdte]           DATETIME        NULL,
    [arc_src]          NVARCHAR (30)   NULL,
    [moddte]           DATETIME        NULL,
    [mod_usr_id]       NVARCHAR (40)   NULL,
    [edtflg]           INT             NULL,
    [sch_begdte]       DATETIME        NULL,
    [sch_enddte]       DATETIME        NULL,
    [auto_relpck_flg]  INT             DEFAULT ((0)) NOT NULL,
    [auto_relpck_tim]  INT             NULL,
    [goal_tim]         INT             NULL,
    [dur_tim]          INT             NULL,
    [plan_seq]         INT             NULL,
    [old_prdlin]       NVARCHAR (20)   NULL,
    [lst_stgloc]       NVARCHAR (20)   NULL,
    [nocomp_flg]       INT             DEFAULT ((0)) NOT NULL,
    [num_people]       INT             NULL,
    [speed]            INT             NULL,
    [actcod]           NVARCHAR (40)   NULL,
    [lms_assign_num]   NVARCHAR (15)   NULL,
    [lms_plan_dte]     DATETIME        NULL,
    [lms_cur_wkoqty]   INT             NULL,
    [lms_cur_goal_tim] INT             NULL,
    [pckqty]           INT             NULL,
    [pck_catch_qty]    NUMERIC (19, 4) NULL,
    [inpqty]           INT             NULL,
    [oviqty]           INT             NULL,
    [invsts_prg]       NVARCHAR (4)    NULL,
    [rpqflg]           INT             DEFAULT ((0)) NOT NULL,
    [xdkflg]           INT             NULL,
    [untcas]           INT             NOT NULL,
    [untpak]           INT             NOT NULL,
    [ftpcod]           NVARCHAR (30)   NULL,
    [ovrcod]           NVARCHAR (4)    NULL,
    [ovramt]           INT             NULL,
    [ordinv]           NVARCHAR (30)   NULL,
    [min_shelf_hrs]    INT             NULL,
    [tot_dlvqty]       INT             DEFAULT ((0)) NOT NULL,
    [tot_cnsqty]       INT             DEFAULT ((0)) NOT NULL,
    [sub_wkonum]       NVARCHAR (20)   NULL,
    [sub_wkorev]       NVARCHAR (10)   NULL,
    [inv_attr_str1]    NVARCHAR (100)  NULL,
    [inv_attr_str2]    NVARCHAR (100)  NULL,
    [inv_attr_str3]    NVARCHAR (100)  NULL,
    [inv_attr_str4]    NVARCHAR (100)  NULL,
    [inv_attr_str5]    NVARCHAR (100)  NULL,
    [inv_attr_str6]    NVARCHAR (100)  NULL,
    [inv_attr_str7]    NVARCHAR (100)  NULL,
    [inv_attr_str8]    NVARCHAR (100)  NULL,
    [inv_attr_str9]    NVARCHAR (100)  NULL,
    [inv_attr_str10]   NVARCHAR (100)  NULL,
    [inv_attr_str11]   NVARCHAR (100)  NULL,
    [inv_attr_str12]   NVARCHAR (100)  NULL,
    [inv_attr_str13]   NVARCHAR (100)  NULL,
    [inv_attr_str14]   NVARCHAR (100)  NULL,
    [inv_attr_str15]   NVARCHAR (100)  NULL,
    [inv_attr_str16]   NVARCHAR (100)  NULL,
    [inv_attr_str17]   NVARCHAR (100)  NULL,
    [inv_attr_str18]   NVARCHAR (100)  NULL,
    [inv_attr_int1]    INT             NULL,
    [inv_attr_int2]    INT             NULL,
    [inv_attr_int3]    INT             NULL,
    [inv_attr_int4]    INT             NULL,
    [inv_attr_int5]    INT             NULL,
    [inv_attr_flt1]    NUMERIC (19, 4) NULL,
    [inv_attr_flt2]    NUMERIC (19, 4) NULL,
    [inv_attr_flt3]    NUMERIC (19, 4) NULL,
    [inv_attr_dte1]    DATETIME        NULL,
    [inv_attr_dte2]    DATETIME        NULL,
    CONSTRAINT [wkohdr_pk] PRIMARY KEY CLUSTERED ([wkonum] ASC, [wkorev] ASC, [wh_id] ASC, [client_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [wkohdr_arelflg_ck] CHECK ([auto_relpck_flg]=(0) OR [auto_relpck_flg]=(1)),
    CONSTRAINT [wkohdr_cmptrkflgck] CHECK ([cmp_trk_flg]=(0) OR [cmp_trk_flg]=(1)),
    CONSTRAINT [wkohdr_edtflg_ck] CHECK ([edtflg]=(0) OR [edtflg]=(1)),
    CONSTRAINT [wkohdr_excl_flg_ck] CHECK ([excl_flg]=(0) OR [excl_flg]=(1)),
    CONSTRAINT [wkohdr_ncmpflg_ck] CHECK ([nocomp_flg]=(0) OR [nocomp_flg]=(1)),
    CONSTRAINT [wkohdr_rpqflg_ck] CHECK ([rpqflg]=(0) OR [rpqflg]=(1)),
    CONSTRAINT [wkohdr_rrlflg_ck] CHECK ([rrlflg]=(0) OR [rrlflg]=(1)),
    CONSTRAINT [wkohdr_startflg_ck] CHECK ([start_flg]=(0) OR [start_flg]=(1)),
    CONSTRAINT [wkohdr_xdkflg_ck] CHECK ([xdkflg]=(0) OR [xdkflg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Represents work order which is used to produce top-level finished good item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A number which identifies the work order to the system.   ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'wkonum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The client code that owns this work order.  In a non-3PL system, this value defaults to ''----''. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used if multiple copies of a standard work order are desired. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'wkorev';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - the warehouse in which the work order is to be processed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of the work order. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'wko_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'We will use this field to track the production station that the finished good should be taken to to be disassembled. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'disass_prcloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The item number of the top-level item/finished good that is being produced. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'In non-3PL systems, this will be set to a default of ''----''. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Expected status of finished goods inventory that is to be produced. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'invsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An allocation rule name linking the work order to the allocation rule table. The allocation rule specifies a set of attributes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'rule_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lot number for the top-level item/finished good that is being produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lot number supplied by the supplier for tracking purposes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'sup_lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Revision level of the top-level item/finished good that is being produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'revlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Origin Code for the top-level item/finished good that is being produced. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'orgcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Possible values are: Pending, Inprocess, Complete, Waiting for Work Order. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'wkosts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This typically is date/time when the order was entered on the host system. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'entdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date/time when work order was added to WM Discrete . ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'adddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date/time when the work order is due for completion. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'duedte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date/time when allocation for work order components was completed. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'alcdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date/time that work order was completed/closed. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'clsdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Priority at which work order should be considered for crossdock or other allocation processing. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'prcpri';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The priority with which wrkque work for this work order should be created. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'pricod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The work order area where this work order shall be processed. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'prcare';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Production Line where the work order is to be processed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'prdlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The percentage over/under of deviation that is allowed from the originally requested production amount. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'prd_tol_pct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used for host transactions against this work order ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'prjnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used for host transactions against this work order. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'accnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Quantity of finished goods produced against this work order.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'prdqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Catch quantity of finished goods produced against this work order.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'prd_catch_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Quantity of finished goods expected to be produced against this work order. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'wkoqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Catch quantity of finished good expected to be produced against this work order.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'wko_catch_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Reported return to stock quantity.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'rpt_rtsqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'May be used to indicate that set of work order should allocate together. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'pckgr1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of the user that completed/closed the work order. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'cls_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether component consumption tracking for this work order is enabled. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'cmp_trk_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Should lines that are not being crossdocked get released before line is crossdocked. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'rrlflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Exclusively Occupy Production Line. This flag indicates whether the work order will occupy a production line exclusively if it''s started or share it with other started work orders at the same time.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'excl_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Started. This flag indicates whether this work order is started or not.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'start_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date/time this record was last modified. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of user that performed last modification. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The scheduled begin date of work order on production line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'sch_begdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The scheduled end date of work order on production line. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'sch_enddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inidicate system can release pick work for this work order automatically. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'auto_relpck_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The number of minutes before begin date that user wants system to release its picks. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'auto_relpck_tim';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The number of minutes LMS determines that it should take to complete the work order. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'goal_tim';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The number of minutes the host or a user defines that it should take to complete the work order. Would be used in a non LMS environment.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'dur_tim';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The sequential number that the work order is to be produced when it''s assigned production line schedules by sequence.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'plan_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The old production line to which the work order was assigned before the last work order movement.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'old_prdlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default stage location selected by user in last allocation.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'lst_stgloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'No Components Needed. This flag indicates whether this work order has component or not.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'nocomp_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Number of people working on work order.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'num_people';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Production Speed. This value is the amount of finished good that can be produced per hour.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'speed';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Activity Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'actcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'LMS Assignment Number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'lms_assign_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'LMS Plan Date. It should be Schedule Begin Date if it is scheduled, or current date if it is not scheduled. This field is set once and never be changed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'lms_plan_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'LMS Current Work Order Assignment Quantity. It is pckqty when last split happened.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'lms_cur_wkoqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'LMS Current Assignment''s Goal Time.  GOAL_TIM will be the sum total goal time of all old assignment and the current assignment.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'lms_cur_goal_tim';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This represents the quantity that is yet to be allocated against this work order.  As allocations succeed, this quantity will drive to zero.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'pckqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This represents the catch quantity that is yet to be allocated against this work order.  As allocations succeed, this quantity will go to zero.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'pck_catch_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This represents the amount of quantity allocated against the work order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'inpqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This represents any over allocation which may have resulted due to rounding up during allocation cycle.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'oviqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory status progression of component inventory that is being consumed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'invsts_prg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag indicates that allocation should attempt to round up the quantity requested to the next logical material handling unit in order to achieve a more efficient product move.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'rpqflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether line is a candidate for cross docking.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'xdkflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unit case quantity.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'untcas';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unit pack quantity.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'untpak';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Footprint Code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'ftpcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies how to treat the value specified in ovramt.  Valid values are PRCT and QTY.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'ovrcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Depending on the ovrcod, this value either represents a percentage of the originally requested line quantity or a fixed quantity above the linqty.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'ovramt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Location Order By - This value determines how the system will determine which inventory in an area code to allocate for this work order line. Examples of possible values include FEFO-ORDER-BY, FIFO-ORDER-BY.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'ordinv';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Minimum Shelf Life (Hours) - If set, only inventory with an expiration date that is at least this many hours away from expiring will be allocated for this work order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'min_shelf_hrs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Total deliverd quantity', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'tot_dlvqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Total consumed quantity', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'tot_cnsqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This field will be filled in during the process of generate replenishment for work order when find matching assembly work order to indicate the work number of the work order that this work order is waiting for', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'sub_wkonum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This field will be filled in during the process of generate replenishment for work order when find matching assembly work order to indicate the work number revision of the work order that this work order is waiting for', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'sub_wkorev';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 1 for the top-level item/finished good that is being produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 2 for the top-level item/finished good that is being produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 3 for the top-level item/finished good that is being produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 4 for the top-level item/finished good that is being produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 5 for the top-level item/finished good that is being produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 6 for the top-level item/finished good that is being produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str6';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 7 for the top-level item/finished good that is being produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str7';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 8 for the top-level item/finished good that is being produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str8';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 9 for the top-level item/finished good that is being produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str9';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 10 for the top-level item/finished good that is being produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str10';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 11 for the top-level item/finished good that is being produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str11';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 12 for the top-level item/finished good that is being produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str12';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 13 for the top-level item/finished good that is being produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str13';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 14 for the top-level item/finished good that is being produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str14';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 15 for the top-level item/finished good that is being produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str15';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 16 for the top-level item/finished good that is being produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str16';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 17 for the top-level item/finished good that is being produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str17';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Text 18 for the top-level item/finished good that is being produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'inv_attr_str18';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 1 for the top-level item/finished good that is being produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'inv_attr_int1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 2 for the top-level item/finished good that is being produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'inv_attr_int2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 3 for the top-level item/finished good that is being produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'inv_attr_int3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 4 for the top-level item/finished good that is being produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'inv_attr_int4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Number 5 for the top-level item/finished good that is being produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'inv_attr_int5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 1 for the top-level item/finished good that is being produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'inv_attr_flt1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 2 for the top-level item/finished good that is being produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'inv_attr_flt2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Decimal 3 for the top-level item/finished good that is being produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'inv_attr_flt3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Date 1 for the top-level item/finished good that is being produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'inv_attr_dte1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute Date 2 for the top-level item/finished good that is being produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkohdr', @level2type = N'COLUMN', @level2name = N'inv_attr_dte2';

