CREATE TABLE [logs].[productos_atributos]
(
    [id_log]             BIGINT         IDENTITY (1, 1) NOT NULL,
    [id]                 BIGINT         NOT NULL,
    [operacion]          NVARCHAR (1) NOT NULL,
    [cambio_notificado]  BIT NOT NULL,
    [fecha_creacion]     DATETIME       NOT NULL,
    [fecha_modificacion] DATETIME       NOT NULL,

    [prt_client_id]     NVARCHAR (32) NOT NULL,
    [prtnum]            NVARCHAR (50) NOT NULL,
    [wh_id]             NVARCHAR (32) NOT NULL,
    [dte_code]          NVARCHAR (5) NOT NULL,
    [lotflg]            INT NOT NULL,
    [untcst]            BIGINT NOT NULL,

    [last_upd_dt] DATETIME NOT NULL, 
    [last_upd_user_id] NVARCHAR(40) NOT NULL, 
    CONSTRAINT [PK_productos_atributos] PRIMARY KEY CLUSTERED ([id_log] ASC)
)
