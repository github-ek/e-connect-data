CREATE TABLE [dbo].[productos_medidas] (
    [id]                 BIGINT          IDENTITY (1, 1) NOT NULL,
    [operacion]          NVARCHAR (1)    NOT NULL,
    [fecha_creacion]     DATETIME2 (0)   NOT NULL,
    [fecha_modificacion] DATETIME2 (0)   NOT NULL,
    [id_cliente]         BIGINT          NOT NULL,
    [id_producto]        BIGINT          NOT NULL,
    [id_bodega]          BIGINT          NOT NULL,
    [id_unidad_medida]   BIGINT          NOT NULL,
    [prt_client_id]      NVARCHAR (32)   NOT NULL,
    [prtnum]             NVARCHAR (50)   NOT NULL,
    [wh_id]              NVARCHAR (32)   NOT NULL,
    [ftpcod]             NVARCHAR (30)   NOT NULL,
    [uomcod]             NVARCHAR (2)    NOT NULL,
    [uomlvl]             INT             NOT NULL,
    [untqty]             INT             NOT NULL,
    [len]                NUMERIC (19, 4) NOT NULL,
    [wid]                NUMERIC (19, 4) NOT NULL,
    [hgt]                NUMERIC (19, 4) NOT NULL,
    [grswgt]             NUMERIC (23, 8) NOT NULL,
    [rcv_flg]            BIT             NOT NULL,
    [cas_flg]            BIT             NOT NULL,
    [pal_flg]            BIT             NOT NULL,
    CONSTRAINT [PK_productos_medidas] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [UK_productos_medidas_01] UNIQUE NONCLUSTERED ([prt_client_id] ASC, [prtnum] ASC, [wh_id] ASC, [ftpcod] ASC, [uomcod] ASC),
    CONSTRAINT [UK_productos_medidas_02] UNIQUE NONCLUSTERED ([id_producto] ASC, [id_bodega] ASC, [id_unidad_medida] ASC)
);



