CREATE TABLE [dbo].[solicitudes_actas_ingredion_lineas_alistadas] (
    [suscripcion]        VARCHAR (50)  NOT NULL,
    [id_externo]         VARCHAR (50)  NOT NULL,
    [wh_id]              VARCHAR (32)  NOT NULL,
    [client_id]          VARCHAR (32)  NOT NULL,
    [ordnum]             VARCHAR (35)  NOT NULL,
    [prtnum]             VARCHAR (50)  NOT NULL,
    [orgcod]             VARCHAR (25)  NOT NULL,
    [lotnum]             VARCHAR (25)  NOT NULL,
    [expire_dte]         DATETIME      NOT NULL,
    [untqty]             INT           NOT NULL,
    [version]            INT           NULL,
    [fecha_creacion]     DATETIME2 (0) NULL,
    [fecha_modificacion] DATETIME2 (0) NULL
);

