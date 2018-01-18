CREATE TABLE [dbo].[recepciones_sin_cerrar] (
    [almacen]      NVARCHAR (64)   NULL,
    [trailer]      NVARCHAR (40)   NULL,
    [estado]       NVARCHAR (4000) NULL,
    [rec_maestro]  NVARCHAR (40)   NULL,
    [fecha_mod]    DATETIME        NULL,
    [tipo_fac]     NVARCHAR (8)    NULL,
    [cliente]      NVARCHAR (40)   NULL,
    [nro_facturas] INT             NULL,
    [nro_lineas]   INT             NULL,
    [cnt_esperada] INT             NULL,
    [cnt_recibida] INT             NULL
);

