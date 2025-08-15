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

![Modelo Conceptual](2_Diseno_Base_de_Datos/modelo_conceptual.png)

### Diagrama Entidad-Relación (Modelo Lógico/Físico)
El plano detallado de la base de datos implementada, mostrando tablas, columnas, tipos de datos, claves primarias (PK) y foráneas (FK).

![Diagrama Entidad-Relación](2_Diseno_Base_de_Datos/diagrama_entidad_relacion.png)

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










