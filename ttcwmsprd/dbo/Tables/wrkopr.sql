CREATE TABLE [dbo].[wrkopr] (
    [oprcod]            NVARCHAR (9)    NOT NULL,
    [wh_id_tmpl]        NVARCHAR (32)   NOT NULL,
    [baspri]            INT             NOT NULL,
    [exptim]            INT             NULL,
    [escinc]            INT             NULL,
    [maxescpri]         INT             NULL,
    [begdaycod]         NVARCHAR (1)    NULL,
    [begtim]            DATETIME        NULL,
    [enddaycod]         NVARCHAR (1)    NULL,
    [endtim]            DATETIME        NULL,
    [use_src_flg]       INT             NULL,
    [esc_cmd_flg]       INT             DEFAULT ((0)) NULL,
    [esc_cmd]           NVARCHAR (2000) NULL,
    [rls_cmd]           NVARCHAR (2000) NULL,
    [init_sts]          NVARCHAR (4)    DEFAULT (N'PEND') NOT NULL,
    [force_ack_loc_flg] INT             DEFAULT ((0)) NULL,
    CONSTRAINT [wrkopr_pk] PRIMARY KEY CLUSTERED ([oprcod] ASC, [wh_id_tmpl] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [wrkopr_esccmdflgck] CHECK ([esc_cmd_flg]=(0) OR [esc_cmd_flg]=(1)),
    CONSTRAINT [wrkopr_f_a_l_f_ck] CHECK ([force_ack_loc_flg]=(0) OR [force_ack_loc_flg]=(1)),
    CONSTRAINT [wrkopr_usesrcflgck] CHECK ([use_src_flg]=(0) OR [use_src_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The warehouse directed work operations table keeps warehouse specific configurations of directed work operations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkopr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Operation Code - The code that defines the type of work to be performed and how it should be handled in the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkopr', @level2type = N'COLUMN', @level2name = N'oprcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID Template - The wh_id_tmpl= ''----'' will represent a default item that will be shared by all warehouses. An entry with a wh_id_tmpl != ''----'' is an override for that warehouse.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkopr', @level2type = N'COLUMN', @level2name = N'wh_id_tmpl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The base piority or beginning priority at which work for this type of operation code was created.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkopr', @level2type = N'COLUMN', @level2name = N'baspri';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Expiration Time.  The system won''t escalate until the expiration time pased from the last escalation', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkopr', @level2type = N'COLUMN', @level2name = N'exptim';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Escalation Increment.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkopr', @level2type = N'COLUMN', @level2name = N'escinc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum Escalation Priority.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkopr', @level2type = N'COLUMN', @level2name = N'maxescpri';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Begin Day Code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkopr', @level2type = N'COLUMN', @level2name = N'begdaycod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Begin Time.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkopr', @level2type = N'COLUMN', @level2name = N'begtim';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'End Day Code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkopr', @level2type = N'COLUMN', @level2name = N'enddaycod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'End Time.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkopr', @level2type = N'COLUMN', @level2name = N'endtim';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Use Source Flag.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkopr', @level2type = N'COLUMN', @level2name = N'use_src_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Enable Escalation Command Flag.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkopr', @level2type = N'COLUMN', @level2name = N'esc_cmd_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A command to esclate work priority that is specific to an oprcod.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkopr', @level2type = N'COLUMN', @level2name = N'esc_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This field is used to store the command that will be called by the SAL Daemon to analysis this work type to see if the status should be changed from ''LOCK'' to ''PEND''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkopr', @level2type = N'COLUMN', @level2name = N'rls_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The field indicates which status the work will be created initially in.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkopr', @level2type = N'COLUMN', @level2name = N'init_sts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag indicates whether the user must scan the storage location during acknowledgement of directed work.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkopr', @level2type = N'COLUMN', @level2name = N'force_ack_loc_flg';

