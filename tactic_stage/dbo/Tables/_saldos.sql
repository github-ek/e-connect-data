CREATE TABLE [dbo].[_saldos] (
    [id]                           BIGINT        IDENTITY (1, 1) NOT NULL,
    [client_id]                    NVARCHAR (32) NULL,
    [wh_id]                        NVARCHAR (32) NULL,
    [prtnum]                       NVARCHAR (50) NULL,
    [lotnum]                       NVARCHAR (30) NULL,
    [invsts]                       NVARCHAR (4)  NULL,
    [untqty]                       INT           NULL,
    [ordqty]                       INT           NULL,
    [disponible]                   INT           NULL,
    [reservado_acumulado_corte]    INT           NULL,
    [expire_dte]                   DATE          NULL,
    [min_expire_dte]               DATE          NULL,
    [numero_dias_vencimiento_lote] INT           NULL,
    [prioridad]                    BIGINT        NULL
);

