CREATE TABLE [dbo].[migracion_servicios_paqueteadoras_ene_mar_15] (
    [tipo]                          VARCHAR (13)  NOT NULL,
    [id_remesa_programada]          INT           NOT NULL,
    [cedi_codigo]                   VARCHAR (13)  NOT NULL,
    [fecha_programada]              DATE          NULL,
    [placa_programada]              VARCHAR (12)  NOT NULL,
    [servicio_codigo]               VARCHAR (10)  NOT NULL,
    [cliente_codigo]                VARCHAR (10)  NOT NULL,
    [cliente_numero_identificacion] VARCHAR (13)  NOT NULL,
    [numero_remesa]                 VARCHAR (20)  NOT NULL,
    [tipo_remesa]                   VARCHAR (8)   NOT NULL,
    [paqueteadora_codigo]           VARCHAR (11)  NOT NULL,
    [migrado]                       BIT           NOT NULL,
    [notas_migracion]               VARCHAR (200) NOT NULL
);


GO
CREATE UNIQUE CLUSTERED INDEX [ix_migracion_servicios_paqueteadoras_ene_mar_15_01]
    ON [dbo].[migracion_servicios_paqueteadoras_ene_mar_15]([cliente_codigo] ASC, [numero_remesa] ASC, [fecha_programada] ASC, [placa_programada] ASC);

