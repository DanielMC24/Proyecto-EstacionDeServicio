use EL_CRUCE;
GO
CREATE OR ALTER PROCEDURE VEHICULOS_DE_CLIENTE
	@ID_USUARIO INT    
AS
BEGIN
    SELECT * FROM VEHICULO WHERE ID_USUARIO = @ID_USUARIO;
END;

GO

CREATE OR ALTER PROCEDURE PROYECTOS_DE_CLIENTE
	@PLACAS_VEHICULOS VARCHAR(MAX)
AS
BEGIN
    SELECT 
		PROYECTO.*,
		SERVICIO.DESCRIPCION 'DESCRIPCION_SERVICIO'
	FROM PROYECTO 
	JOIN SERVICIO ON PROYECTO.ID_SERVICIO = SERVICIO.ID_SERVICIO
	WHERE ID_VEHICULO IN (
		SELECT value
		FROM STRING_SPLIT(@PLACAS_VEHICULOS, ',')
	);
END;

GO

CREATE OR ALTER PROCEDURE ESTADOS_PROYECTO_DE_CLIENTE
	@ID_PROYECTO INT
AS
BEGIN
    SELECT 
		ESTADO_PROYECTO.ESTADO,
		HISTORIAL_ESTADOS.FECHA
	FROM HISTORIAL_ESTADOS 
	JOIN ESTADO_PROYECTO ON HISTORIAL_ESTADOS.ID_ESTADO = ESTADO_PROYECTO.ID_ESTADO
	WHERE ID_PROYECTO = @ID_PROYECTO;
		 
END;

GO


CREATE OR ALTER PROCEDURE COMENTARIOS_DE_PROYECTO
	@ID_PROYECTO INT
AS
BEGIN
    SELECT 
		USUARIO.NOMBRE 'NOMBRE_USUARIO',
		ROLE_USUARIO.ID_ROLE 'ID_ROL_USUARIO',
		ROLE_USUARIO.ROLE 'ROL_USUARIO',
		COMENTARIOS_PROYECTO.FECHA,
		COMENTARIOS_PROYECTO.COMENTARIO

	FROM COMENTARIOS_PROYECTO
	JOIN USUARIO ON COMENTARIOS_PROYECTO.ID_USUARIO = USUARIO.ID_USUARIO
	JOIN ROLE_USUARIO ON USUARIO.ID_ROLE = ROLE_USUARIO.ID_ROLE

	WHERE COMENTARIOS_PROYECTO.ID_PROYECTO = @ID_PROYECTO;		 
END;

GO

CREATE OR ALTER PROCEDURE PROYECTOS_DE_MECANICO
	@ID_MECANICO INT
AS
BEGIN
    SELECT 
		PROYECTO.*,
		SERVICIO.SERVICIO,
		SERVICIO.DESCRIPCION,
		USUARIO.NOMBRE 'NOMBRE_CLIENTE'

	FROM PROYECTO
	JOIN SERVICIO ON PROYECTO.ID_SERVICIO = SERVICIO.ID_SERVICIO
	JOIN VEHICULO ON PROYECTO.ID_VEHICULO = VEHICULO.PLACA
	JOIN USUARIO ON VEHICULO.ID_USUARIO = USUARIO.ID_USUARIO

	WHERE ID_MECANICO = @ID_MECANICO;
		
END;

GO

CREATE OR ALTER PROCEDURE HISTORIAL_DE_VEHICULO
	@PLACA VARCHAR(20)
AS
BEGIN
    SELECT 
		PROYECTO.FECHA,
		PROYECTO.ID_MECANICO,
		SERVICIO.SERVICIO,
		SERVICIO.DESCRIPCION,
		SERVICIO.PRECIO,
		USUARIO.NOMBRE 'MECANICO'
		
	FROM PROYECTO 
	JOIN SERVICIO ON PROYECTO.ID_SERVICIO = SERVICIO.ID_SERVICIO
	JOIN USUARIO ON PROYECTO.ID_MECANICO = USUARIO.ID_USUARIO
	WHERE ID_VEHICULO = @PLACA
END;