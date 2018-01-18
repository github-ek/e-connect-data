CREATE TABLE [dbo].[cnfrm_noninv_serv] (
    [cnfrm_serv_id] NVARCHAR (20)  NOT NULL,
    [wh_id]         NVARCHAR (32)  NOT NULL,
    [serv_id]       NVARCHAR (20)  NOT NULL,
    [exitpnt]       NVARCHAR (15)  NOT NULL,
    [srtseq]        INT            NOT NULL,
    [non_invtid]    NVARCHAR (150) NOT NULL,
    [non_invtyp]    NVARCHAR (6)   NOT NULL,
    [trlr_typ]      NVARCHAR (4)   NULL,
    [vehtyp]        NVARCHAR (10)  NULL,
    [serv_result]   NVARCHAR (10)  NULL,
    [adddte]        DATETIME       NULL,
    [moddte]        DATETIME       NULL,
    [cmpdte]        DATETIME       NULL,
    [usr_id]        NVARCHAR (40)  NULL,
    [mod_usr_id]    NVARCHAR (40)  NULL,
    [cmp_usr_id]    NVARCHAR (40)  NULL,
    [trlr_cod]      NVARCHAR (4)   NULL,
    [serv_req_flg]  INT            DEFAULT ((1)) NOT NULL,
    [cmpflg]        INT            DEFAULT ((0)) NOT NULL,
    [devcod]        NVARCHAR (20)  NULL,
    CONSTRAINT [cnfrm_noninv_srvpk] PRIMARY KEY CLUSTERED ([cnfrm_serv_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [cfmsrv_cmpflg_ck] CHECK ([cmpflg]=(0) OR [cmpflg]=(1)),
    CONSTRAINT [cfmsrv_req_flg_ck] CHECK ([serv_req_flg]=(0) OR [serv_req_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is used to log a history of non-inventory services as they are completed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_noninv_serv';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Service ID - unique Base 36 system-generated sequence to identify a service confirmation record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_noninv_serv', @level2type = N'COLUMN', @level2name = N'cnfrm_serv_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_noninv_serv', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_noninv_serv', @level2type = N'COLUMN', @level2name = N'serv_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Exit Point - determines when this service is required during the background process.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_noninv_serv', @level2type = N'COLUMN', @level2name = N'exitpnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sort Sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_noninv_serv', @level2type = N'COLUMN', @level2name = N'srtseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Non Inventory ID - if this is a service for a trailer, this would hold the trlr_id, if it is for a vehicle, this would hold the devcod.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_noninv_serv', @level2type = N'COLUMN', @level2name = N'non_invtid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Non Inventory Type - defines the type of non inventory entity.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_noninv_serv', @level2type = N'COLUMN', @level2name = N'non_invtyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Trailer Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_noninv_serv', @level2type = N'COLUMN', @level2name = N'trlr_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Vehicle Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_noninv_serv', @level2type = N'COLUMN', @level2name = N'vehtyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Results', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_noninv_serv', @level2type = N'COLUMN', @level2name = N'serv_result';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Added Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_noninv_serv', @level2type = N'COLUMN', @level2name = N'adddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_noninv_serv', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_noninv_serv', @level2type = N'COLUMN', @level2name = N'usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_noninv_serv', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Complete User ID - the user that completed this service.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_noninv_serv', @level2type = N'COLUMN', @level2name = N'cmp_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines the trailer as either a Shipping or Receiving trailer. Trailer Code options are RCV or SHIP.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_noninv_serv', @level2type = N'COLUMN', @level2name = N'trlr_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Required Flag - It determines if service is required.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_noninv_serv', @level2type = N'COLUMN', @level2name = N'serv_req_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Completed Flag - It indicates if service is completed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_noninv_serv', @level2type = N'COLUMN', @level2name = N'cmpflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Device code on which the workflow is done. It would be the device code when the workflow is done on RF or the work station number when it is done in GUI', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_noninv_serv', @level2type = N'COLUMN', @level2name = N'devcod';

