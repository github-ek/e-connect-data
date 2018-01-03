CREATE TABLE [tms].[moviles_rutacontrol] (
    [id]                    BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_archivo]            BIGINT        NOT NULL,
    [estado]                VARCHAR (50)  NOT NULL,
    [numero_linea]          INT           NOT NULL,
    [movil]                 VARCHAR (20)  NOT NULL,
    [placa]                 VARCHAR (20)  NOT NULL,
    [ciudad_codigo_alterno] VARCHAR (50)  NOT NULL,
    [version]               INT           NOT NULL,
    [fecha_creacion]        DATETIME2 (0) NOT NULL,
    [usuario_creacion]      VARCHAR (50)  NOT NULL,
    [fecha_modificacion]    DATETIME2 (0) NOT NULL,
    [usuario_modificacion]  VARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_moviles_rutacontrol] PRIMARY KEY CLUSTERED ([id] ASC)
);

