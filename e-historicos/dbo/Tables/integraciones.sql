CREATE TABLE [dbo].[integraciones] (
    [id_integracion]    BIGINT        IDENTITY (1, 1) NOT NULL,
    [codigo]            VARCHAR (50)  NOT NULL,
    [nombre]            VARCHAR (100) NOT NULL,
    [descripcion]       VARCHAR (200) NOT NULL,
    [fecha_ultimo_pull] DATETIME      NOT NULL,
    CONSTRAINT [PK_integraciones] PRIMARY KEY CLUSTERED ([id_integracion] ASC)
);

