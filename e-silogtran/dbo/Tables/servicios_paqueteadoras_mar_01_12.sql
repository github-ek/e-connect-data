CREATE TABLE [dbo].[servicios_paqueteadoras_mar_01_12] (
    [id_cliente]             BIGINT       IDENTITY (1, 1) NOT NULL,
    [cliente_identificacion] VARCHAR (9)  NOT NULL,
    [numero_solicitud]       VARCHAR (15) NOT NULL,
    [placa_programada]       VARCHAR (12) NOT NULL,
    [fecha_programada]       DATE         NULL,
    [placa_real]             VARCHAR (6)  NOT NULL
);

