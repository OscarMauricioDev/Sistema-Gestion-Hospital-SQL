-- Procedimientos Almacenados (CRUD) para la gestión de Acudientes

-- Procedimiento para insertar un nuevo acudiente
DELIMITER //
CREATE PROCEDURE insertar_acudiente(
  IN nombre_acudiente VARCHAR(100),
  IN cedula_acudiente VARCHAR(20),
  IN telefono_acudiente VARCHAR(15),
  IN direccion_acudiente VARCHAR(150)
)
BEGIN
  INSERT INTO acudientes (nombre, cedula, telefono, direccion)
  VALUES (nombre_acudiente, cedula_acudiente, telefono_acudiente, direccion_acudiente);
END;
//
DELIMITER ;

-- Procedimiento para listar todos los acudientes
DELIMITER //
CREATE PROCEDURE listar_acudientes()
BEGIN
  SELECT * FROM acudientes;
END;
//
DELIMITER ;

-- Procedimiento para consultar un acudiente por ID
DELIMITER //
CREATE PROCEDURE consultar_acudiente(IN id_buscar INT)
BEGIN
  SELECT * FROM acudientes WHERE id_acudiente = id_buscar;
END;
//
DELIMITER ;

-- Procedimiento para modificar un acudiente existente
DELIMITER //
CREATE PROCEDURE modificar_acudiente(
  IN id_modificar INT,
  IN nuevo_nombre VARCHAR(100),
  IN nueva_cedula VARCHAR(20),
  IN nuevo_telefono VARCHAR(15),
  IN nueva_direccion VARCHAR(150)
)
BEGIN
  UPDATE acudientes
  SET nombre = nuevo_nombre,
      cedula = nueva_cedula,
      telefono = nuevo_telefono,
      direccion = nueva_direccion
  WHERE id_acudiente = id_modificar;
END;
//
DELIMITER ;

-- Procedimiento para eliminar un acudiente (manejando dependencias)
DELIMITER //
CREATE PROCEDURE eliminar_acudiente(IN id_eliminar INT)
BEGIN
  -- Primero se eliminan los registros dependientes en la tabla intermedia
  DELETE FROM pacientes_acudientes WHERE id_acudiente = id_eliminar;
  -- Luego, se elimina el registro principal
  DELETE FROM acudientes WHERE id_acudiente = id_eliminar;
END;
//
DELIMITER ;