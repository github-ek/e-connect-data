CREATE TABLE [dbo].[wh_serv] (
    [serv_id]           NVARCHAR (20)   NOT NULL,
    [wh_id]             NVARCHAR (32)   NOT NULL,
    [seqnum]            INT             NOT NULL,
    [mixed_prt_flg]     INT             NOT NULL,
    [spec_serv_cod]     NVARCHAR (10)   NULL,
    [serv_enaflg]       INT             NOT NULL,
    [lodlvl]            NVARCHAR (1)    NULL,
    [moddte]            DATETIME        NULL,
    [mod_usr_id]        NVARCHAR (40)   NULL,
    [audit_thresh_cost] NUMERIC (19, 4) NULL,
    [crncy_code]        NVARCHAR (4)    NULL,
    CONSTRAINT [wh_serv_pk] PRIMARY KEY CLUSTERED ([serv_id] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The warehouse service table is the table that defines the services of the warehouse.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_serv';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_serv', @level2type = N'COLUMN', @level2name = N'serv_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'WareHouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_serv', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence Number - sequence in which the service is displayed during service execution.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_serv', @level2type = N'COLUMN', @level2name = N'seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Mixed Item Flag - should the service also be required for loads that contain more than one item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_serv', @level2type = N'COLUMN', @level2name = N'mixed_prt_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Speicalized Service code - used to further restrict when the service should be performed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_serv', @level2type = N'COLUMN', @level2name = N'spec_serv_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Enabled Flag - Allows the service to be disabled for all inventory for which the service has not yet been required.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_serv', @level2type = N'COLUMN', @level2name = N'serv_enaflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load Level.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_serv', @level2type = N'COLUMN', @level2name = N'lodlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Cost Threshold - Used to define when high value audit service is performed on inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_serv', @level2type = N'COLUMN', @level2name = N'audit_thresh_cost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Currency Code for the Currency fields in the table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_serv', @level2type = N'COLUMN', @level2name = N'crncy_code';

