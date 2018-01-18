CREATE TABLE [dbo].[conteo_ciclico] (
    [wh_id]              NVARCHAR (32)  NULL,
    [cntbat]             NVARCHAR (10)  NULL,
    [stoloc]             NVARCHAR (20)  NULL,
    [prt_client_id]      NVARCHAR (64)  NULL,
    [prtnum]             NVARCHAR (100) NULL,
    [lngdsc]             NVARCHAR (250) NULL,
    [conteomax]          DATETIME       NULL,
    [conteomin]          DATETIME       NULL,
    [trndte]             DATETIME       NULL,
    [mod_usr_id]         NVARCHAR (40)  NULL,
    [tipo1]              NVARCHAR (3)   NULL,
    [tipo2]              NVARCHAR (3)   NULL,
    [tipo_recuento1]     INT            NULL,
    [cantidad_recuento1] INT            NULL,
    [contar_usuario1]    NVARCHAR (40)  NULL,
    [fecha_recuento1]    DATETIME       NULL,
    [id_contador1]       NVARCHAR (10)  NULL
);

