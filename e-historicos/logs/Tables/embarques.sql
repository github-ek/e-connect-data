CREATE TABLE [logs].[embarques]
(
    [id_log]                    BIGINT IDENTITY (1, 1) NOT NULL,
    [id]                        BIGINT NOT NULL,
    [record_key]            NVARCHAR(30) NOT NULL,
    [operacion]             NVARCHAR (1) NOT NULL,
    [estado]                NVARCHAR (50) NOT NULL,
    [cambio_notificado]     BIT NOT NULL,
    [fecha_creacion]        DATETIME       NOT NULL,
    [fecha_modificacion]    DATETIME       NOT NULL,

    [ship_id]               NVARCHAR (30) NOT NULL,

    [shpsts]                NVARCHAR (1) NOT NULL,
    [shipment_moddte]       DATETIME NOT NULL,
    [shipment_mod_usr_id]   NVARCHAR (40) NOT NULL,

    [trlr_id]               NVARCHAR (20) NOT NULL,
    [trlr_stat]             NVARCHAR (8) NOT NULL,
    [trlr_typ]              NVARCHAR (4) NOT NULL,
    [trlr_seal1]            NVARCHAR (30) NOT NULL,
    [trlr_seal2]            NVARCHAR (30) NOT NULL,
    [trlr_seal3]            NVARCHAR (30) NOT NULL,
    [trlr_seal4]            NVARCHAR (30) NOT NULL,
    [driver_nam]            NVARCHAR (40) NOT NULL,
    [driver_lic_num]        NVARCHAR (40) NOT NULL,
    [tractor_num]           NVARCHAR (10) NOT NULL,
    [arrdte]           	    DATETIME NOT NULL,
    [close_dte]           	DATETIME NOT NULL,
    [dispatch_dte]          DATETIME NOT NULL,
    [trlr_moddte]           DATETIME NOT NULL,
    [trlr_mod_usr_id]       NVARCHAR (40) NOT NULL,
    CONSTRAINT [PK_embarques] PRIMARY KEY CLUSTERED ([id_log] ASC) WITH (FILLFACTOR = 80)
) ON [PRIMARY]
