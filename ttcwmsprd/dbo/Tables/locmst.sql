CREATE TABLE [dbo].[locmst] (
    [stoloc]           NVARCHAR (20)   NOT NULL,
    [wh_id]            NVARCHAR (32)   NOT NULL,
    [arecod]           NVARCHAR (10)   NOT NULL,
    [locsts]           NVARCHAR (1)    NOT NULL,
    [velzon]           NVARCHAR (1)    NOT NULL,
    [wrkzon]           NVARCHAR (10)   NOT NULL,
    [aisle_id]         NVARCHAR (20)   NULL,
    [trvseq]           NVARCHAR (20)   NULL,
    [rescod]           NVARCHAR (50)   NULL,
    [lochgt]           NUMERIC (19, 4) NULL,
    [loclen]           NUMERIC (19, 4) NULL,
    [locwid]           NUMERIC (19, 4) NULL,
    [locvrc]           NVARCHAR (20)   NULL,
    [maxqvl]           NUMERIC (19, 4) NOT NULL,
    [curqvl]           NUMERIC (19, 4) NOT NULL,
    [pndqvl]           NUMERIC (19, 4) NOT NULL,
    [trfpct]           INT             NULL,
    [erfpct]           INT             NULL,
    [useflg]           INT             NULL,
    [stoflg]           INT             NULL,
    [pckflg]           INT             NULL,
    [repflg]           INT             NULL,
    [asgflg]           INT             NULL,
    [cipflg]           INT             NULL,
    [cntseq]           NVARCHAR (20)   NULL,
    [numcnt]           INT             DEFAULT ((0)) NOT NULL,
    [abccod]           NVARCHAR (1)    NULL,
    [cntdte]           DATETIME        NULL,
    [devcod]           NVARCHAR (20)   NULL,
    [lokcod]           NVARCHAR (20)   NULL,
    [locacc]           NVARCHAR (30)   NULL,
    [voc_chkdgt]       NVARCHAR (5)    NULL,
    [lstdte]           DATETIME        NULL,
    [lstcod]           NVARCHAR (20)   NULL,
    [lst_usr_id]       NVARCHAR (40)   NULL,
    [slotseq]          NVARCHAR (20)   NULL,
    [perm_asgflg]      INT             NULL,
    [cntzon_id]        NVARCHAR (14)   NULL,
    [section]          NVARCHAR (50)   NULL,
    [x]                NVARCHAR (20)   NULL,
    [y]                NVARCHAR (20)   NULL,
    [z]                NVARCHAR (20)   NULL,
    [attr1]            NVARCHAR (50)   NULL,
    [attr2]            NVARCHAR (50)   NULL,
    [attr3]            NVARCHAR (50)   NULL,
    [attr4]            NVARCHAR (50)   NULL,
    [attr5]            NVARCHAR (50)   NULL,
    [basepoint_id]     NVARCHAR (32)   NULL,
    [top_left_x]       NUMERIC (19, 4) NULL,
    [top_left_y]       NUMERIC (19, 4) NULL,
    [top_right_x]      NUMERIC (19, 4) NULL,
    [top_right_y]      NUMERIC (19, 4) NULL,
    [bottom_left_x]    NUMERIC (19, 4) NULL,
    [bottom_left_y]    NUMERIC (19, 4) NULL,
    [bottom_right_x]   NUMERIC (19, 4) NULL,
    [bottom_right_y]   NUMERIC (19, 4) NULL,
    [border_pad]       NUMERIC (19, 4) NULL,
    [auto_mov_flg]     INT             DEFAULT ((0)) NOT NULL,
    [slot_id]          NVARCHAR (20)   NULL,
    [def_maxqvl]       NUMERIC (19, 4) NOT NULL,
    [u_version]        INT             NULL,
    [ateseq]           INT             DEFAULT ((9999)) NOT NULL,
    [atedte]           DATETIME        NULL,
    [ins_dt]           DATETIME        NULL,
    [last_upd_dt]      DATETIME        NULL,
    [ins_user_id]      NVARCHAR (40)   NULL,
    [last_upd_user_id] NVARCHAR (40)   NULL,
    [cntbck_ena_flg]   INT             NULL,
    [prdlin]           NVARCHAR (20)   NULL,
    [stgloc]           NVARCHAR (20)   NULL,
    [rcv_rescod]       NVARCHAR (50)   NULL,
    [pal_stck_rst]     NVARCHAR (40)   DEFAULT (N'N') NOT NULL,
    CONSTRAINT [locmst_pk] PRIMARY KEY CLUSTERED ([stoloc] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [locmst_asgflg_ck] CHECK ([asgflg]=(0) OR [asgflg]=(1)),
    CONSTRAINT [locmst_atmvflg_ck] CHECK ([auto_mov_flg]=(0) OR [auto_mov_flg]=(1)),
    CONSTRAINT [locmst_cipflg_ck] CHECK ([cipflg]=(0) OR [cipflg]=(1)),
    CONSTRAINT [locmst_cntbck_ck] CHECK ([cntbck_ena_flg]=(0) OR [cntbck_ena_flg]=(1)),
    CONSTRAINT [locmst_pckflg_ck] CHECK ([pckflg]=(0) OR [pckflg]=(1)),
    CONSTRAINT [locmst_permasg_ck] CHECK ([perm_asgflg]=(0) OR [perm_asgflg]=(1)),
    CONSTRAINT [locmst_repflg_ck] CHECK ([repflg]=(0) OR [repflg]=(1)),
    CONSTRAINT [locmst_stoflg_ck] CHECK ([stoflg]=(0) OR [stoflg]=(1)),
    CONSTRAINT [locmst_useflg_ck] CHECK ([useflg]=(0) OR [useflg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [locmst_idx1]
    ON [dbo].[locmst]([arecod] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [locmst_idx2]
    ON [dbo].[locmst]([abccod] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [locmst_idx3]
    ON [dbo].[locmst]([arecod] ASC, [wh_id] ASC, [lochgt] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [locmst_idx4]
    ON [dbo].[locmst]([stoloc] ASC, [wh_id] ASC, [trvseq] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [locmst_idx5]
    ON [dbo].[locmst]([stoloc] ASC, [wh_id] ASC, [arecod] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [locmst_num_cnt_wh]
    ON [dbo].[locmst]([cntdte] ASC, [numcnt] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [locmst_locvrc]
    ON [dbo].[locmst]([locvrc] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The LMS activity table is used to map WM/Discrete activity codes to the LM work code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Uniquely identifies the storage location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'stoloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - The warehouse where the aisle is located.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines the area to which this location belongs.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'arecod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Current disposition of the location.  One of:  Full (F), Partial (P), Empty (E) or Inventory Error (I).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'locsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The velocity zone of the location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'velzon';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used for RF work management.  This is the work zone of the location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'wrkzon';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Aisle ID - A collection of locations in a row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'aisle_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The relative distance between locations, the travel sequence is during work management to find the closest location to an idle user.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'trvseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to path inventory through processing locations.  The resource code is a mechanism by which that location is reserved for product matching the rescod.  For example, in a shipment staging lane, the rescod is often set to the carcod.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'rescod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This represents the hgt (in the same units as used on the ftpmst table) of product that the loc will tolerate.  This is evaluated on a per storage request.  For example, in a pallet racking example, the lochgt may be set to 90 (inches).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'lochgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This field is currently NOT used for storage selection or volume calculation purposes and is only used during 3PL Billing operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'loclen';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This field is currently NOT used for storage selection or volume calculation purposes and is only used during 3PL Billing operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'locwid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A ''checksum'' or alternate identifier which may be used to identify the location.  This is often used in facilities where locations may not be able to be labeled and it is desired to provide an alternate, easy to type, name for the loc.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'locvrc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The aremst.loccod will indicate what this number actually means (in terms of volume, pallets, etc...).  This represents the maximum storage capacity of the location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'maxqvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Much the same as maxqvl, this field is used to indicate the currently used capacity in a location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'curqvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Much the same as the other ''qvl'' numbers, this field is used to indicate how much capacity is pending storage to the location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'pndqvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates what percentage of the maxqvl should be used when performing top-off replenishments.  A value of 0 will indicate 100%.  50 will indicate half full.  This can be useful if it is desired to ''overfill'' a loc during repl process', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'trfpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Much the same as trfpct, this field indicates the percentage of maxqvl which should be used during emergency replenishment operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'erfpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag indicates that the location is usable.  If set to false, future allocations and stores are disabled at this location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'useflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag indicates that the location is available for storage operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'stoflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag indicates that the location is available for picking (allocation) operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'pckflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag indicates that the location may be replenished.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'repflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag indicates that this loc is permanently assigned. In processing area, it applies to rescod value that is set. In normal sto. areas, it indicates itmnum is assigned to loc. STORE-ASG-LOC policies tells the item that is assigned', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'asgflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag indicates that there is a count in-progress at this location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'cipflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Much like travel sequence, this field is used to sequence counting activities.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'cntseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Operational column used to track the number of counts performed during a particular cycle.  Used when location based cycle counting is in effect.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'numcnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to schedule location based cycle counts much in the same was as the itmmst.abccod is used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'abccod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date location was last counted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'cntdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Label device which is closest to this location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'devcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to indicate that this loc is locked for processing.  Often used by operational programs such as order overpack operations to indicate that a work station is processing a particular lane - this prevents collisions during processing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'lokcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to indicate that special vehicle access is necessary to get to this location.  This is used by the work manangement system to ensure that work is only sent to devices if the device can access the location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'locacc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Voice Check Digit - This will be a short code that will be used in voice to identify a location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'voc_chkdgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last date/time activity occurred at this location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'lstdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last activity code at this location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'lstcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last user which performed an activity at this location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'lst_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Much like travel sequence, this field is used to sequence locations for slotting purposes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'slotseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Permanent Assignment - indicates whether or not the asgflg will get toggled on/off when a storage assignment policy is removed', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'perm_asgflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Count zone this location is in', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'cntzon_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'MRM field - The section of the warehouse where this location is located.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'section';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'MRM field - The X coordinate of the location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'x';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'MRM field - The Y coordinate of the location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'y';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'MRM field - The Z coordinate of the location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'z';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'MRM field - Generic attribute.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'attr1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'MRM field - Generic attribute.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'attr2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'MRM field - Generic attribute.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'attr3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'MRM field - Generic attribute.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'attr4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'MRM field - Generic attribute.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'attr5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The base point used for mapping the RFID location coordinates.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'basepoint_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The top left x coordinate of the RFID location relative to it''s the base point.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'top_left_x';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The top left y coordinate of the RFID location relative to it''s the base point.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'top_left_y';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The top right x coordinate of the RFID location relative to it''s the base point.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'top_right_x';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The top right y coordinate of the RFID location relative to it''s the base point.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'top_right_y';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The bottom left x coordinate of the RFID location relative to it''s the base point.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'bottom_left_x';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The bottom left y coordinate of the RFID location relative to it''s the base point.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'bottom_left_y';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The bottom right x coordinate of the RFID location relative to it''s the base point.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'bottom_right_x';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The bottom right y coordinate of the RFID location relative to it''s the base point.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'bottom_right_y';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The value by which the four sides of the location will be extended to define an alternate border.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'border_pad';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Location is configured to allow auto move by RFID processing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'auto_mov_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Slot ID represents a grouping of dock doors in a dock. A dock can contain multiple slots and a slot can contain multiple doors. This is used to support appointments being added by the TM system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'slot_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default Max QVL', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'def_maxqvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allocate to Empty Sequence is used to sort locations having ATEflg set for their respective area while allocating inventory .Lesser the value higher the priority.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'ateseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date when the inventory in location having the ATEflg set for its respective area was first Allocated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'atedte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this flag is set, the location supports countback.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'cntbck_ena_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Production Line that the production station belongs to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'prdlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Staging Location assigned to the production station. This is only useful if prdlin is set.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'stgloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will reserve the location for inbound product matching the value(trknum or invnum).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'rcv_rescod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pallet Stack Restriction.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmst', @level2type = N'COLUMN', @level2name = N'pal_stck_rst';

