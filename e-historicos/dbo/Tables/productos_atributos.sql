CREATE TABLE [dbo].[productos_atributos] (
    [id]                 BIGINT  NOT NULL,
    [operacion]          NVARCHAR (1) NOT NULL,
    [cambio_notificado]  BIT NOT NULL DEFAULT 0,
    [fecha_creacion]     DATETIME       NOT NULL,
    [fecha_modificacion] DATETIME       NOT NULL,

    [prt_client_id]     NVARCHAR (32) NOT NULL,
    [prtnum]            NVARCHAR (50) NOT NULL,
    [wh_id]             NVARCHAR (32) NOT NULL,
    [dte_code]          NVARCHAR (5) NOT NULL,
    [lotflg]            INT NOT NULL,
    [untcst]            BIGINT NOT NULL,

    [moddte] DATETIME NOT NULL, 
    [mod_usr_id] NVARCHAR(40) NOT NULL, 
    CONSTRAINT [PK_productos_atributos] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [UK_productos_atributos_01] UNIQUE NONCLUSTERED ([prt_client_id],[prtnum],[wh_id],[dte_code])
);

