CREATE TABLE [dbo].[_asignacion_linea] (
    [wh_id]                     NVARCHAR (32) NULL,
    [id_orden_venta]            BIGINT        NULL,
    [numero_linea]              INT           NULL,
    [prtnum]                    NVARCHAR (50) NULL,
    [invsts]                    NVARCHAR (4)  NULL,
    [ordqty]                    INT           NULL,
    [disponible]                INT           NULL,
    [reservado]                 INT           NULL,
    [reservado_acumulado_orden] INT           NULL,
    [id]                        BIGINT        NULL,
    [lotnum]                    NVARCHAR (30) NULL,
    [expire_dte]                DATETIME      NULL,
    [min_expire_dte]            DATETIME      NULL,
    [prioridad]                 INT           NULL
);

