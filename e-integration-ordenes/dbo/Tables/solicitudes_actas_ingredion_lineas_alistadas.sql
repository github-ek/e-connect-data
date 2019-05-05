CREATE TABLE [dbo].[solicitudes_actas_ingredion_lineas_alistadas] (
    [id]                 BIGINT          IDENTITY (1, 1) NOT NULL,
    [suscripcion]        VARCHAR (50)    NOT NULL,
    [id_externo]         VARCHAR (50)    NOT NULL,
    [ordnum]             VARCHAR (35)    NOT NULL,
    [wh_id]              VARCHAR (32)    NOT NULL,
    [client_id]          VARCHAR (32)    NOT NULL,
    [stgdte]             DATETIME        NOT NULL,
    [rmanum]             VARCHAR (30)    NOT NULL,
    [prtnum]             VARCHAR (50)    NOT NULL,
    [orgcod]             VARCHAR (25)    NOT NULL,
    [invsts]             VARCHAR (4)     NOT NULL,
    [lotnum]             VARCHAR (25)    NOT NULL,
    [expire_dte]         DATETIME        NOT NULL,
    [untqty]             INT             NOT NULL,
    [untcas]             INT             NOT NULL,
    [empaques]           DECIMAL (23, 8) NOT NULL,
    [peso_empaques]      DECIMAL (23, 8) NULL,
    [volumen_empaques]   DECIMAL (23, 8) NULL,
    [version]            INT             CONSTRAINT [DF_solicitudes_actas_ingredion_lineas_alistadas_version] DEFAULT ((0)) NOT NULL,
    [fecha_creacion]     DATETIME2 (0)   CONSTRAINT [DF_solicitudes_actas_ingredion_lineas_alistadas_fecha_creacion] DEFAULT (sysdatetime()) NOT NULL,
    [fecha_modificacion] DATETIME2 (0)   CONSTRAINT [DF_solicitudes_actas_ingredion_lineas_alistadas_fecha_modificacion] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_solicitudes_actas_ingredion_lineas_alistadas] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_solicitudes_actas_ingredion_lineas_alistadas]
    ON [dbo].[solicitudes_actas_ingredion_lineas_alistadas]([id_externo] ASC, [suscripcion] ASC);

