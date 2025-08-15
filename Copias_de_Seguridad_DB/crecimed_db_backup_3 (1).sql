-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: crecimed_db_backup2
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acudientes`
--

DROP TABLE IF EXISTS `acudientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acudientes` (
  `id_acudiente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  PRIMARY KEY (`id_acudiente`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acudientes`
--

LOCK TABLES `acudientes` WRITE;
/*!40000 ALTER TABLE `acudientes` DISABLE KEYS */;
INSERT INTO `acudientes` VALUES (1,'Pedro Torres','123456789','555-1234','Calle 23 #45-67, Ciudad Central'),(2,'Laura Pérez','999888777','555-0000','Avenida 5 #67-89'),(3,'Carlos Gómez','456789123','555-3456','Carrera 56 #78-90, Villa Hermosa'),(5,'Fernando Morales','321654987','555-5678','Avenida Central 45, Barrio Sur'),(6,'Mónica Herrera','654987321','555-6789','Carrera 90 #12-34, Residencial Las Palmas'),(7,'Andrés Jiménez','987321654','555-7890','Calle 34 #56-78, Conjunto Los Pinos'),(8,'Carolina Ortiz','321987654','555-8901','Avenida Los Robles 67, Barrio El Paraíso'),(9,'Roberto López','654321987','555-9012','Carrera 12 #34-56, Urbanización Las Flores'),(10,'Patricia Martínez','789456123','555-0123','Calle 45 #67-89, Conjunto Residencial El Bosque'),(11,'Ana Torres','123987456','555-4321','Calle 12 #34-56, Ciudad Nueva');
/*!40000 ALTER TABLE `acudientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citas`
--

DROP TABLE IF EXISTS `citas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citas` (
  `id_cita` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `motivo` text NOT NULL,
  `observaciones` text DEFAULT NULL,
  `id_paciente` int(11) NOT NULL,
  `id_medico` int(11) NOT NULL,
  PRIMARY KEY (`id_cita`),
  KEY `id_paciente` (`id_paciente`),
  KEY `id_medico` (`id_medico`),
  CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`),
  CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id_medico`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citas`
--

LOCK TABLES `citas` WRITE;
/*!40000 ALTER TABLE `citas` DISABLE KEYS */;
INSERT INTO `citas` VALUES (1,'2024-05-10 09:00:00','Control de asma','Revisión de medicación actual',1,5),(2,'2024-05-10 10:30:00','Dolor de cabeza recurrente','Evaluar posible migraña',2,2),(3,'2024-05-10 12:00:00','Revisión postoperatoria','Control de herida quirúrgica',3,10),(4,'2024-05-11 09:30:00','Fiebre y dolor abdominal',NULL,4,4),(5,'2024-05-11 11:00:00','Control de diabetes','Ajuste de dosis de insulina',5,6),(6,'2024-05-12 08:30:00','Dolor de oído','Posible otitis',6,1),(7,'2024-05-12 10:00:00','Tos persistente','Evaluación respiratoria',7,5),(8,'2024-05-13 09:00:00','Control rutinario',NULL,8,1),(9,'2024-05-13 11:30:00','Erupción cutánea','Sospecha de dermatitis atópica',9,1),(10,'2024-05-14 10:00:00','Dolor en extremidad','Evaluación de fractura',10,10);
/*!40000 ALTER TABLE `citas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citas_diagnosticos`
--

DROP TABLE IF EXISTS `citas_diagnosticos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citas_diagnosticos` (
  `id_cita` int(11) NOT NULL,
  `id_diagnostico` int(11) NOT NULL,
  PRIMARY KEY (`id_cita`,`id_diagnostico`),
  KEY `id_diagnostico` (`id_diagnostico`),
  CONSTRAINT `citas_diagnosticos_ibfk_1` FOREIGN KEY (`id_cita`) REFERENCES `citas` (`id_cita`),
  CONSTRAINT `citas_diagnosticos_ibfk_2` FOREIGN KEY (`id_diagnostico`) REFERENCES `diagnosticos` (`id_diagnostico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citas_diagnosticos`
--

LOCK TABLES `citas_diagnosticos` WRITE;
/*!40000 ALTER TABLE `citas_diagnosticos` DISABLE KEYS */;
INSERT INTO `citas_diagnosticos` VALUES (1,1),(2,7),(3,10),(4,3),(5,8),(6,2),(7,5),(8,1),(9,6),(10,10);
/*!40000 ALTER TABLE `citas_diagnosticos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnosticos`
--

DROP TABLE IF EXISTS `diagnosticos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diagnosticos` (
  `id_diagnostico` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `codigo_cie10` varchar(10) NOT NULL,
  PRIMARY KEY (`id_diagnostico`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosticos`
--

LOCK TABLES `diagnosticos` WRITE;
/*!40000 ALTER TABLE `diagnosticos` DISABLE KEYS */;
INSERT INTO `diagnosticos` VALUES (1,'Asma bronquial infantil','Trastorno respiratorio crónico caracterizado por episodios recurrentes de disnea','J45'),(2,'Otitis media aguda','Inflamación del oído medio con acumulación de líquido','H65'),(3,'Gastroenteritis viral','Inflamación del tracto gastrointestinal causada por virus','A08'),(4,'Amigdalitis aguda','Inflamación de las amígdalas palatinas','J03'),(5,'Bronquiolitis','Infección respiratoria que causa inflamación de las vías respiratorias pequeñas','J21'),(6,'Dermatitis atópica','Enfermedad inflamatoria crónica de la piel caracterizada por picazón y sequedad','L20'),(7,'Migraña infantil','Cefalea recurrente con o sin aura','G43'),(8,'Diabetes mellitus tipo 1','Trastorno metabólico caracterizado por hiperglucemia crónica','E10'),(9,'Neumonía bacteriana','Infección del parénquima pulmonar causada por bacterias','J15'),(10,'Fractura de antebrazo','Ruptura completa o incompleta del radio y/o cúbito','S52');
/*!40000 ALTER TABLE `diagnosticos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidades`
--

DROP TABLE IF EXISTS `especialidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `especialidades` (
  `id_especialidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_especialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidades`
--

LOCK TABLES `especialidades` WRITE;
/*!40000 ALTER TABLE `especialidades` DISABLE KEYS */;
INSERT INTO `especialidades` VALUES (1,'Pediatría General'),(2,'Neuropediatría'),(3,'Cardiología Infantil'),(4,'Gastroenterología Pediátrica'),(5,'Neumología Pediátrica'),(6,'Endocrinología Pediátrica'),(7,'Nefrología Pediátrica'),(8,'Oncología Pediátrica'),(9,'Infectología Pediátrica'),(10,'Cirugía Pediátrica');
/*!40000 ALTER TABLE `especialidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitaciones`
--

DROP TABLE IF EXISTS `habitaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habitaciones` (
  `id_habitacion` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(10) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `estado` varchar(20) NOT NULL,
  PRIMARY KEY (`id_habitacion`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitaciones`
--

LOCK TABLES `habitaciones` WRITE;
/*!40000 ALTER TABLE `habitaciones` DISABLE KEYS */;
INSERT INTO `habitaciones` VALUES (1,'101','Individual','Disponible'),(2,'102','Individual','Ocupada'),(3,'103','Doble','Disponible'),(4,'104','Doble','Ocupada'),(5,'105','UCI Pediátrica','Disponible'),(6,'106','UCI Pediátrica','Ocupada'),(7,'201','Individual','Disponible'),(8,'202','Individual','Ocupada'),(9,'203','Doble','Disponible'),(10,'204','Aislamiento','Disponible');
/*!40000 ALTER TABLE `habitaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historia_clinica`
--

DROP TABLE IF EXISTS `historia_clinica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historia_clinica` (
  `id_historia` int(11) NOT NULL AUTO_INCREMENT,
  `id_paciente` int(11) NOT NULL,
  `antecedentes_familia` text DEFAULT NULL,
  `enfermedades_previas` text DEFAULT NULL,
  `notas_evolutivas` text DEFAULT NULL,
  PRIMARY KEY (`id_historia`),
  KEY `id_paciente` (`id_paciente`),
  CONSTRAINT `historia_clinica_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historia_clinica`
--

LOCK TABLES `historia_clinica` WRITE;
/*!40000 ALTER TABLE `historia_clinica` DISABLE KEYS */;
INSERT INTO `historia_clinica` VALUES (1,1,'Padre y abuelo paterno con asma. Madre con rinitis alérgica.','Dermatitis atópica a los 6 meses. Bronquiolitis a los 11 meses.','Diagnóstico de asma a los 2 años. Control adecuado con medicación. Última crisis hace 3 meses.'),(2,2,'Madre con migraña. Tía materna con epilepsia.','Infecciones respiratorias recurrentes. Otitis media a los 18 meses.','Inicio de cefaleas a los 3 años. Evaluada por Neurología con diagnóstico de migraña infantil. Buena respuesta al tratamiento.'),(3,3,'Sin antecedentes familiares relevantes.','Apendicectomía a los 4 años.','Fractura de radio y cúbito tras caída jugando fútbol. Reducción e inmovilización exitosa. Evolución favorable.'),(4,4,'Padre con enfermedad celíaca.','Bronquiolitis a los 8 meses. Varicela a los 2 años.','Episodios recurrentes de dolor abdominal y diarrea. Evaluación por gastroenterología en curso.'),(5,5,'Abuela materna con diabetes tipo 2. Tío materno con diabetes tipo 1.','Varicela a los 3 años.','Diagnóstico de diabetes tipo 1 a los 4 años. Control metabólico adecuado con insulina. Última HbA1c: 7.2%.'),(6,6,'Sin antecedentes familiares relevantes.','Infecciones respiratorias altas recurrentes.','Episodios recurrentes de otitis media. Valorada por otorrinolaringología para posible colocación de tubos de ventilación.'),(7,7,'Padre y hermano mayor con asma.','Bronquiolitis a los 6 meses.','Episodios recurrentes de sibilancias. En estudio por posible asma. Respuesta positiva a broncodilatadores.'),(8,8,'Madre con psoriasis. Padre con hipertensión.','Varicela a los 2 años. Escarlatina a los 3 años.','Desarrollo psicomotor adecuado. Control pediátrico regular sin hallazgos relevantes.'),(9,9,'Abuelo paterno con enfermedad coronaria.','Dermatitis atópica desde los 4 meses.','Brotes recurrentes de dermatitis principalmente en pliegues. Buena respuesta a tratamiento tópico. Exacerbación con estrés y cambios climáticos.'),(10,10,'Madre con escoliosis. Tía materna con osteogénesis imperfecta.','Sin enfermedades previas relevantes.','Fractura de antebrazo tras caída de bicicleta. Primera fractura. Densitometría ósea normal para la edad.');
/*!40000 ALTER TABLE `historia_clinica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospitalizaciones`
--

DROP TABLE IF EXISTS `hospitalizaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospitalizaciones` (
  `id_hospitalizacion` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_ingreso` datetime NOT NULL,
  `fecha_salida` datetime DEFAULT NULL,
  `id_habitacion` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `id_medico` int(11) NOT NULL,
  `id_diagnostico` int(11) NOT NULL,
  PRIMARY KEY (`id_hospitalizacion`),
  KEY `id_habitacion` (`id_habitacion`),
  KEY `id_paciente` (`id_paciente`),
  KEY `id_medico` (`id_medico`),
  KEY `id_diagnostico` (`id_diagnostico`),
  CONSTRAINT `hospitalizaciones_ibfk_1` FOREIGN KEY (`id_habitacion`) REFERENCES `habitaciones` (`id_habitacion`),
  CONSTRAINT `hospitalizaciones_ibfk_2` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`),
  CONSTRAINT `hospitalizaciones_ibfk_3` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id_medico`),
  CONSTRAINT `hospitalizaciones_ibfk_4` FOREIGN KEY (`id_diagnostico`) REFERENCES `diagnosticos` (`id_diagnostico`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospitalizaciones`
--

LOCK TABLES `hospitalizaciones` WRITE;
/*!40000 ALTER TABLE `hospitalizaciones` DISABLE KEYS */;
INSERT INTO `hospitalizaciones` VALUES (1,'2024-04-15 14:30:00','2024-04-20 11:00:00',2,3,10,10),(2,'2024-04-18 08:45:00','2024-04-25 10:30:00',4,5,6,8),(3,'2024-04-22 16:20:00','2024-04-26 09:15:00',6,7,5,5),(4,'2024-04-25 11:10:00',NULL,2,4,4,3),(5,'2024-04-28 13:40:00','2024-05-03 12:00:00',8,9,1,1),(6,'2024-05-01 09:30:00','2024-05-08 14:45:00',4,1,5,1),(7,'2024-05-05 15:20:00',NULL,6,10,8,9),(8,'2024-05-07 12:10:00','2024-05-10 10:30:00',8,2,2,7),(9,'2024-05-09 08:45:00',NULL,2,6,1,2),(10,'2024-05-11 14:30:00',NULL,4,8,10,10);
/*!40000 ALTER TABLE `hospitalizaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamentos`
--

DROP TABLE IF EXISTS `medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicamentos` (
  `id_medicamento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `dosis` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`id_medicamento`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentos`
--

LOCK TABLES `medicamentos` WRITE;
/*!40000 ALTER TABLE `medicamentos` DISABLE KEYS */;
INSERT INTO `medicamentos` VALUES (1,'Salbutamol','100 mcg/inhalación','Broncodilatador'),(2,'Amoxicilina','250mg/5ml','Antibiótico'),(3,'Paracetamol','500mg','Analgésico/Antipirético'),(4,'Ibuprofeno','400mg','Antiinflamatorio'),(5,'Prednisolona','15mg/5ml','Corticoesteroide'),(6,'Insulina Regular','100 UI/ml','Hormona'),(7,'Amoxicilina/Clavulánico','875/125mg','Antibiótico'),(8,'Cetirizina','10mg','Antihistamínico'),(9,'Loratadina','10mg','Antihistamínico'),(10,'Betametasona crema','0.05%','Corticoesteroide tópico');
/*!40000 ALTER TABLE `medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicos`
--

DROP TABLE IF EXISTS `medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicos` (
  `id_medico` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `contacto` varchar(100) NOT NULL,
  `id_especialidad` int(11) NOT NULL,
  PRIMARY KEY (`id_medico`),
  KEY `id_especialidad` (`id_especialidad`),
  CONSTRAINT `medicos_ibfk_1` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidades` (`id_especialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicos`
--

LOCK TABLES `medicos` WRITE;
/*!40000 ALTER TABLE `medicos` DISABLE KEYS */;
INSERT INTO `medicos` VALUES (1,'Dr. Carlos Ramírez','carlos.ramirez@hospital.org - Ext. 1001',1),(2,'Dra. Ana María López','ana.lopez@hospital.org - Ext. 1002',2),(3,'Dr. Javier Mendoza','javier.mendoza@hospital.org - Ext. 1003',3),(4,'Dra. Luisa Fernández','luisa.fernandez@hospital.org - Ext. 1004',4),(5,'Dr. Miguel Sánchez','miguel.sanchez@hospital.org - Ext. 1005',5),(6,'Dra. Patricia Jiménez','patricia.jimenez@hospital.org - Ext. 1006',6),(7,'Dr. Roberto González','roberto.gonzalez@hospital.org - Ext. 1007',7),(8,'Dra. Sofía Torres','sofia.torres@hospital.org - Ext. 1008',8),(9,'Dr. Eduardo Vargas','eduardo.vargas@hospital.org - Ext. 1009',9),(10,'Dra. Isabel Martínez','isabel.martinez@hospital.org - Ext. 1010',10);
/*!40000 ALTER TABLE `medicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pacientes` (
  `id_paciente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` varchar(10) NOT NULL,
  `alergias` text DEFAULT NULL,
  `grupo_sanguineo` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes`
--

LOCK TABLES `pacientes` WRITE;
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
INSERT INTO `pacientes` VALUES (1,'Juan Pablo Torres','2018-05-12','Masculino','Penicilina','O+'),(2,'María Fernanda Rodríguez','2019-08-23','Femenino',NULL,'A+'),(3,'Daniel Alejandro Gómez','2017-03-15','Masculino','Maní, lácteos','B+'),(4,'Valentina Sánchez','2020-11-07','Femenino',NULL,'O-'),(5,'Sebastián Morales','2016-07-19','Masculino','Ibuprofeno','AB+'),(6,'Camila Herrera','2021-01-30','Femenino',NULL,'A-'),(7,'Nicolás Jiménez','2019-04-25','Masculino','Polen','O+'),(8,'Gabriela Ortiz','2018-12-03','Femenino','Sulfamidas','B-'),(9,'Santiago López','2020-06-14','Masculino',NULL,'A+'),(10,'Isabella Martínez','2017-09-28','Femenino','Frutos secos','O+');
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacientes_acudientes`
--

DROP TABLE IF EXISTS `pacientes_acudientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pacientes_acudientes` (
  `id_paciente` int(11) NOT NULL,
  `id_acudiente` int(11) NOT NULL,
  PRIMARY KEY (`id_paciente`,`id_acudiente`),
  KEY `id_acudiente` (`id_acudiente`),
  CONSTRAINT `pacientes_acudientes_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`),
  CONSTRAINT `pacientes_acudientes_ibfk_2` FOREIGN KEY (`id_acudiente`) REFERENCES `acudientes` (`id_acudiente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes_acudientes`
--

LOCK TABLES `pacientes_acudientes` WRITE;
/*!40000 ALTER TABLE `pacientes_acudientes` DISABLE KEYS */;
INSERT INTO `pacientes_acudientes` VALUES (1,1),(1,2),(2,2),(3,3),(5,5),(5,6),(6,6),(7,7),(7,8),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `pacientes_acudientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tratamientos`
--

DROP TABLE IF EXISTS `tratamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tratamientos` (
  `id_tratamiento` int(11) NOT NULL AUTO_INCREMENT,
  `instrucciones` text NOT NULL,
  `id_diagnostico` int(11) NOT NULL,
  PRIMARY KEY (`id_tratamiento`),
  KEY `id_diagnostico` (`id_diagnostico`),
  CONSTRAINT `tratamientos_ibfk_1` FOREIGN KEY (`id_diagnostico`) REFERENCES `diagnosticos` (`id_diagnostico`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratamientos`
--

LOCK TABLES `tratamientos` WRITE;
/*!40000 ALTER TABLE `tratamientos` DISABLE KEYS */;
INSERT INTO `tratamientos` VALUES (1,'Usar inhalador de salbutamol 2 puff cada 6 horas. Mantener ambiente libre de alérgenos.',1),(2,'Amoxicilina 250mg/5ml, 5ml cada 8 horas por 7 días. Analgésicos para dolor.',2),(3,'Solución de rehidratación oral. Dieta blanda. Reposo.',3),(4,'Amoxicilina 500mg cada 8 horas por 10 días. Paracetamol para fiebre y dolor.',4),(5,'Inhalador de salbutamol según necesidad. Paracetamol si hay fiebre.',5),(6,'Crema hidratante diaria. Evitar baños muy calientes. Corticoide tópico en brotes.',6),(7,'Paracetamol para dolor. Evitar desencadenantes. Mantener horarios regulares de sueño.',7),(8,'Insulina según esquema personalizado. Control de glucemia 4 veces al día. Dieta específica.',8),(9,'Amoxicilina/Clavulánico 875/125mg cada 12 horas por 7 días. Reposo y abundante hidratación.',9),(10,'Inmovilización con yeso por 4 semanas. Analgésicos para dolor. Elevación del miembro.',10);
/*!40000 ALTER TABLE `tratamientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tratamientos_medicamentos`
--

DROP TABLE IF EXISTS `tratamientos_medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tratamientos_medicamentos` (
  `id_tratamiento` int(11) NOT NULL,
  `id_medicamento` int(11) NOT NULL,
  PRIMARY KEY (`id_tratamiento`,`id_medicamento`),
  KEY `id_medicamento` (`id_medicamento`),
  CONSTRAINT `tratamientos_medicamentos_ibfk_1` FOREIGN KEY (`id_tratamiento`) REFERENCES `tratamientos` (`id_tratamiento`),
  CONSTRAINT `tratamientos_medicamentos_ibfk_2` FOREIGN KEY (`id_medicamento`) REFERENCES `medicamentos` (`id_medicamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratamientos_medicamentos`
--

LOCK TABLES `tratamientos_medicamentos` WRITE;
/*!40000 ALTER TABLE `tratamientos_medicamentos` DISABLE KEYS */;
INSERT INTO `tratamientos_medicamentos` VALUES (1,1),(2,2),(2,3),(3,3),(4,2),(4,3),(5,1),(5,3),(6,10),(7,3),(8,6),(9,7),(10,4);
/*!40000 ALTER TABLE `tratamientos_medicamentos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-23 19:45:58
