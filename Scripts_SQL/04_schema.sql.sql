-- Creación de la Base de Datos
-- Nota: Esta sentencia se puede omitir si el usuario ya ha creado la DB
-- CREATE DATABASE IF NOT EXISTS crecimed_db;
-- USE crecimed_db;

-- Creación de la tabla especialidades
CREATE TABLE especialidades (
    id_especialidad INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_especialidad)
);

-- Creación de la tabla medicos
CREATE TABLE medicos (
    id_medico INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    contacto VARCHAR(100) NOT NULL,
    id_especialidad INT NOT NULL,
    PRIMARY KEY (id_medico),
    FOREIGN KEY (id_especialidad) REFERENCES especialidades(id_especialidad)
);

-- Creación de la tabla pacientes
CREATE TABLE pacientes (
    id_paciente INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    sexo VARCHAR(10) NOT NULL,
    alergias TEXT,
    grupo_sanguineo VARCHAR(5),
    PRIMARY KEY (id_paciente)
);

-- Creación de la tabla acudientes
CREATE TABLE acudientes(
    id_acudiente INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    cedula VARCHAR(20) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    direccion VARCHAR(150) NOT NULL,
    PRIMARY KEY (id_acudiente)
);

-- Creación de la tabla pacientes_acudientes (tabla intermedia)
CREATE TABLE PACIENTES_ACUDIENTES (
    id_paciente INT NOT NULL,
    id_acudiente INT NOT NULL,
    PRIMARY KEY (id_paciente, id_acudiente),
    FOREIGN KEY (id_paciente) REFERENCES PACIENTES(id_paciente),
    FOREIGN KEY (id_acudiente) REFERENCES ACUDIENTES(id_acudiente)
);

-- Creación de la tabla diagnosticos
CREATE TABLE DIAGNOSTICOS (
    id_diagnostico INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    codigo_cie10 VARCHAR(10) NOT NULL,
    PRIMARY KEY (id_diagnostico)
);

-- Creación de la tabla habitaciones
CREATE TABLE HABITACIONES (
    id_habitacion INT NOT NULL AUTO_INCREMENT,
    numero VARCHAR(10) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_habitacion)
);

-- Creación de la tabla citas
CREATE TABLE CITAS (
    id_cita INT NOT NULL AUTO_INCREMENT,
    fecha DATETIME NOT NULL,
    motivo TEXT NOT NULL,
    observaciones TEXT,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    PRIMARY KEY (id_cita),
    FOREIGN KEY (id_paciente) REFERENCES PACIENTES(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES MEDICOS(id_medico)
);

-- Creación de la tabla citas_diagnosticos (tabla intermedia)
CREATE TABLE CITAS_DIAGNOSTICOS (
    id_cita INT NOT NULL,
    id_diagnostico INT NOT NULL,
    PRIMARY KEY (id_cita, id_diagnostico),
    FOREIGN KEY (id_cita) REFERENCES CITAS(id_cita),
    FOREIGN KEY (id_diagnostico) REFERENCES DIAGNOSTICOS(id_diagnostico)
);

-- Creación de la tabla tratamientos
CREATE TABLE TRATAMIENTOS (
    id_tratamiento INT NOT NULL AUTO_INCREMENT,
    instrucciones TEXT NOT NULL,
    id_diagnostico INT NOT NULL,
    PRIMARY KEY (id_tratamiento),
    FOREIGN KEY (id_diagnostico) REFERENCES DIAGNOSTICOS(id_diagnostico)
);

-- Creación de la tabla medicamentos
CREATE TABLE MEDICAMENTOS (
    id_medicamento INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    dosis VARCHAR(50) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_medicamento)
);

-- Creación de la tabla tratamientos_medicamentos (tabla intermedia)
CREATE TABLE TRATAMIENTOS_MEDICAMENTOS (
    id_tratamiento INT NOT NULL,
    id_medicamento INT NOT NULL,
    PRIMARY KEY (id_tratamiento, id_medicamento),
    FOREIGN KEY (id_tratamiento) REFERENCES TRATAMIENTOS(id_tratamiento),
    FOREIGN KEY (id_medicamento) REFERENCES MEDICAMENTOS(id_medicamento)
);

-- Creación de la tabla hospitalizaciones
CREATE TABLE HOSPITALIZACIONES (
    id_hospitalizacion INT NOT NULL AUTO_INCREMENT,
    fecha_ingreso DATETIME NOT NULL,
    fecha_salida DATETIME,
    id_habitacion INT NOT NULL,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    id_diagnostico INT NOT NULL,
    PRIMARY KEY (id_hospitalizacion),
    FOREIGN KEY (id_habitacion) REFERENCES HABITACIONES(id_habitacion),
    FOREIGN FOREIGN KEY (id_paciente) REFERENCES PACIENTES(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES MEDICOS(id_medico),
    FOREIGN KEY (id_diagnostico) REFERENCES DIAGNOSTICOS(id_diagnostico)
);

-- Creación de la tabla historia_clinica
CREATE TABLE HISTORIA_CLINICA (
    id_historia INT NOT NULL AUTO_INCREMENT,
    id_paciente INT NOT NULL,
    antecedentes_familia TEXT,
    enfermedades_previas TEXT,
    notas_evolutivas TEXT,
    PRIMARY KEY (id_historia),
    FOREIGN KEY (id_paciente) REFERENCES PACIENTES(id_paciente)
);