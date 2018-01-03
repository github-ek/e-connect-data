CREATE TABLE [dbo].[dias] (
    [fecha]            DATE         NOT NULL,
    [habil]            BIT          NOT NULL,
    [ano]              SMALLINT     NOT NULL,
    [ano_corto]        SMALLINT     NOT NULL,
    [trimestre_nombre] VARCHAR (20) NOT NULL,
    [trimestre]        SMALLINT     NOT NULL,
    [mes_nombre]       VARCHAR (20) NOT NULL,
    [mes_abreviatura]  VARCHAR (20) NOT NULL,
    [mes]              SMALLINT     NOT NULL,
    [semana]           SMALLINT     NOT NULL,
    [dia_nombre]       VARCHAR (20) NOT NULL,
    [dia_abreviatura]  VARCHAR (20) NOT NULL,
    [dia_mes]          SMALLINT     NOT NULL,
    [mes_primer_dia]   DATE         NOT NULL,
    [mes_ultimo_dia]   DATE         NOT NULL,
    CONSTRAINT [PK_dias] PRIMARY KEY CLUSTERED ([fecha] ASC)
);

