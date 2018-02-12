CREATE TABLE [dbo].[embarques]
(
    [id_embarque]                       BIGINT IDENTITY (1, 1) NOT NULL,
    [numero_embarque]                   VARCHAR(35)  NOT NULL,
    [estado]                            VARCHAR(50)   NOT NULL,
    
    [id_bodega]                         BIGINT        NOT NULL,
    [id_tipo_vehiculo]                  BIGINT        NULL,
    [tipo_vehiculo_codigo_alterno]      VARCHAR(50)   NOT NULL,
    
    [placa]                             VARCHAR(20)   NOT NULL,
    [conductor_numero_identificacion]   VARCHAR(20)   NOT NULL,
    [conductor_nombre]                  VARCHAR(100)   NOT NULL,

    [fecha_arribo]                      DATETIME2 (0) NOT NULL,
    [fecha_cierre]                      DATETIME2 (0) NOT NULL,
    [fecha_despacho]                    DATETIME2 (0) NOT NULL,

    [sello1]                            VARCHAR(20)   NOT NULL,
    [sello2]                            VARCHAR(20)   NOT NULL,
    [sello3]                            VARCHAR(20)   NOT NULL,
    [sello4]                            VARCHAR(20)   NOT NULL,

    [version]                           INT           NOT NULL DEFAULT 0,
    [usuario_creacion]                  VARCHAR (50)  NOT NULL,
    [fecha_creacion]                    DATETIME2 (0) NOT NULL,
    [usuario_modificacion]              VARCHAR (50)  NOT NULL,
    [fecha_modificacion]                DATETIME2 (0) NOT NULL, 
)ON [PRIMARY]