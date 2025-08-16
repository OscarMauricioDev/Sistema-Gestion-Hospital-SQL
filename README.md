# Sistema de Gestión de Base de Datos para Hospital Pediátrico

*Proyecto académico de base de datos que abarca desde el diseño conceptual y lógico hasta la implementación y consulta de un sistema de información clínica. Desarrollado en colaboración con https://github.com/DanielRestrepoGaleano.*

---

## 🌟 Descripción del Proyecto

Este proyecto simula la creación de un sistema de información para un hospital pediátrico. El objetivo fue diseñar una base de datos relacional normalizada y eficiente en **MariaDB/MySQL** para gestionar de forma centralizada toda la operativa clínica: pacientes, personal médico, citas, hospitalizaciones, diagnósticos y tratamientos.

Este repositorio contiene toda la documentación del proceso, desde los diagramas de diseño hasta los scripts SQL funcionales.

## 🎨 Diseño y Estructura de la Base de Datos

El diseño se realizó siguiendo un enfoque estructurado, comenzando con una visión de alto nivel y finalizando con un esquema físico detallado listo para la implementación.

### Modelo Conceptual
Define las entidades principales y sus relaciones (1:N, N:M), mostrando la lógica de negocio del sistema.

![Modelo Conceptual](2_Diseno_Base_de_Datos/mo<img width="1853" height="1923" alt="modelo_conceptual png" src="https://github.com/user-attachments/assets/228224ec-0e18-49c3-a6f1-ba940c53d0bb" />
delo_conceptual.png)

### Diagrama Entidad-Relación (Modelo Lógico/Físico)
El plano detallado de la base de datos implementada, mostrando tablas, columnas, tipos de datos, claves primarias (PK) y foráneas (FK).

![Diagrama Entidad-Relación]<img width="2511" height="1473" alt="diagrama_entidad_relacion png" src="https://github.com/user-attachments/assets/ef4a8d09-bbed-41da-aa8a-b15f017c05c3" />

## 💻 Tecnologías y Herramientas

*   **SGBD:** MariaDB / MySQL
*   **Lenguaje:** SQL (DDL, DML, DQL)
*   **Herramientas:** XAMPP, Consola de MariaDB, Dbdiagram.io
*   **Control de Versiones:** Git, GitHub

## ✨ Características Principales y Consultas Destacadas

Se desarrollaron múltiples consultas y procedimientos para extraer información de valor y gestionar los datos de manera eficiente.

### 1. Consulta de Pacientes Hospitalizados Actualmente
*Esencial para la gestión de camas en tiempo real. Utiliza `JOIN` para cruzar información y `WHERE` para filtrar por pacientes sin fecha de alta.*
```sql
SELECT
    p.nombre AS Nombre_Paciente,
    h.fecha_ingreso AS Fecha_Ingreso,
    ha.numero AS Numero_Habitacion
FROM hospitalizaciones h
JOIN pacientes p ON h.id_paciente = p.id_paciente
JOIN habitaciones ha ON h.id_habitacion = ha.id_habitacion
WHERE h.fecha_salida IS NULL; 
```
### 2. Conteo de Citas por Médico con Filtro Agregado
*Consulta de análisis que utiliza `GROUP BY`  y  `HAVING`  para identificar a los médicos con mayor carga de trabajo en un período determinado.*
```sql
SELECT
    m.nombre AS Nombre_Medico,
    COUNT(c.id_cita) AS Total_Citas_2024
FROM citas c
JOIN medicos m ON c.id_medico = m.id_medico
WHERE YEAR(c.fecha) = 2024
GROUP BY m.nombre
HAVING COUNT(c.id_cita) > 2;
```
### 3. Implementación de Procedimientos Almacenados (CRUD)
*Se crearon procedimientos para encapsular la lógica de negocio, como la eliminación segura de un acudiente, manejando las restricciones de clave foránea.*
```sql
CREATE PROCEDURE eliminar_acudiente(IN id_eliminar INT)
BEGIN
  -- Primero se eliminan los registros dependientes en la tabla intermedia
  DELETE FROM pacientes_acudientes WHERE id_acudiente = id_eliminar;
  -- Luego, se elimina el registro principal
  DELETE FROM acudientes WHERE id_acudiente = id_eliminar;
END;



 
