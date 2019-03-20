-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[OrdenesAlistamientoMensajesNuevos]() 
RETURNS TABLE 
AS
RETURN 
(
     SELECT
	     a.id_externo
	    ,wh_id
	    ,client_id
	    ,ordnum
	    ,id_mensaje
	    ,id_orden_alistamiento
     FROM mensajes_alistamiento_jda a
     LEFT OUTER JOIN actualizaciones b ON
         b.id_externo = a.id_externo
     AND b.integracion = 'ORDENES_DE_ALISTAMIENTO' 
     WHERE
         a.estado_mensaje = 'MENSAJE_ENVIADO' 
     AND b.id_externo IS NULL
)