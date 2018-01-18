CREATE TABLE [dbo].[embarques]
(
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[operacion] [nvarchar](50) NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
	[client_id] [nvarchar](32) NOT NULL,
	[wh_id] [nvarchar](32) NOT NULL,
	[ordnum] [nvarchar](35) NOT NULL,
	[rmanum] [nvarchar](30) NOT NULL,
	[ordtyp] [nvarchar](4) NOT NULL,
	[ordlin] [nvarchar](10) NOT NULL,
	[prtnum] [nvarchar](50) NOT NULL,
	[ordqty] [int] NOT NULL,
	[shpqty] [int] NOT NULL,
	[invsts_prg] [nvarchar](4) NOT NULL,
	[shpsts] [nvarchar](1) NOT NULL,
	[shipment_loddte] [datetime] NOT NULL,
	[shipment_moddte] [datetime] NOT NULL,
	[shipment_mod_usr_id] [nvarchar](40) NOT NULL,
	[linsts] [nvarchar](1) NOT NULL,
	[shipment_line_stgqty] [int] NOT NULL,
	[shipment_line_shpqty] [int] NOT NULL,
	[shipment_line_moddte] [datetime] NOT NULL,
	[shipment_line_mod_usr_id] [nvarchar](40) NOT NULL,

    [lotnum]                  NVARCHAR (30) NOT NULL,
    [lotnum_last_upd_dt]      DATETIME      NOT NULL,
    [lotnum_last_upd_user_id] NVARCHAR (40) NOT NULL,
 CONSTRAINT [PK_embarques] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY],
 CONSTRAINT [UK_embarques_01] UNIQUE NONCLUSTERED 
(
	[client_id] ASC,
	[wh_id] ASC,
	[ordnum] ASC,
	[ordlin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]