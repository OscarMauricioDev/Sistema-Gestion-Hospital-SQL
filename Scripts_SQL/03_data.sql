-- Inserción de datos para la tabla especialidades
LOCK TABLES `especialidades` WRITE;
INSERT INTO `especialidades` VALUES (1,'Pediatría General'),(2,'Neuropediatría'),(3,'Cardiología Infantil'),(4,'Gastroenterología Pediátrica'),(5,'Neumología Pediátrica'),(6,'Endocrinología Pediátrica'),(7,'Nefrología Pediátrica'),(8,'Oncología Pediátrica'),(9,'Infectología Pediátrica'),(10,'Cirugía Pediátrica');
UNLOCK TABLES;

-- Inserción de datos para la tabla medicos
LOCK TABLES `medicos` WRITE;
INSERT INTO `medicos` VALUES (1,'Dr. Carlos Ramírez','carlos.ramirez@hospital.org - Ext. 1001',1),(2,'Dra. Ana María López','ana.lopez@hospital.org - Ext. 1002',2),(3,'Dr. Javier Mendoza','javier.mendoza@hospital.org - Ext. 1003',3),(4,'Dra. Luisa Fernández','luisa.fernandez@hospital.org - Ext. 1004',4),(5,'Dr. Miguel Sánchez','miguel.sanchez@hospital.org - Ext. 1005',5),(6,'Dra. Patricia Jiménez','patricia.jimenez@hospital.org - Ext. 1006',6),(7,'Dr. Roberto González','roberto.gonzalez@hospital.org - Ext. 1007',7),(8,'Dra. Sofía Torres','sofia.torres@hospital.org - Ext. 1008',8),(9,'Dr. Eduardo Vargas','eduardo.vargas@hospital.org - Ext. 1009',9),(10,'Dra. Isabel Martínez','isabel.martinez@hospital.org - Ext. 1010',10);
UNLOCK TABLES;

-- Inserción de datos para la tabla pacientes
LOCK TABLES `pacientes` WRITE;
INSERT INTO `pacientes` VALUES (1,'Juan Pablo Torres','2018-05-12','Masculino','Penicilina','O+'),(2,'María Fernanda Rodríguez','2019-08-23','Femenino',NULL,'A+'),(3,'Daniel Alejandro Gómez','2017-03-15','Masculino','Maní, lácteos','B+'),(4,'Valentina Sánchez','2020-11-07','Femenino',NULL,'O-'),(5,'Sebastián Morales','2016-07-19','Masculino','Ibuprofeno','AB+'),(6,'Camila Herrera','2021-01-30','Femenino',NULL,'A-'),(7,'Nicolás Jiménez','2019-04-25','Masculino','Polen','O+'),(8,'Gabriela Ortiz','2018-12-03','Femenino','Sulfamidas','B-'),(9,'Santiago López','2020-06-14','Masculino',NULL,'A+'),(10,'Isabella Martínez','2017-09-28','Femenino','Frutos secos','O+');
UNLOCK TABLES;

-- Inserción de datos para la tabla acudientes
LOCK TABLES `acudientes` WRITE;
INSERT INTO `acudientes` VALUES (1,'Pedro Torres','123456789','555-1234','Calle 23 #45-67, Ciudad Central'),(2,'Laura Rodríguez','987654321','555-2345','Avenida Principal 123, Barrio Norte'),(3,'Carlos Gómez','456789123','555-3456','Carrera 56 #78-90, Villa Hermosa'),(4,'Adriana Sánchez','789123456','555-4567','Calle 78 #12-34, Urbanización El Prado'),(5,'Fernando Morales','321654987','555-5678','Avenida Central 45, Barrio Sur'),(6,'Mónica Herrera','654987321','555-6789','Carrera 90 #12-34, Residencial Las Palmas'),(7,'Andrés Jiménez','987321654','555-7890','Calle 34 #56-78, Conjunto Los Pinos'),(8,'Carolina Ortiz','321987654','555-8901','Avenida Los Robles 67, Barrio El Paraíso'),(9,'Roberto López','654321987','555-9012','Carrera 12 #34-56, Urbanización Las Flores'),(10,'Patricia Martínez','789456123','555-0123','Calle 45 #67-89, Conjunto Residencial El Bosque');
UNLOCK TABLES;

-- Inserción de datos para la tabla pacientes_acudientes
LOCK TABLES `pacientes_acudientes` WRITE;
INSERT INTO `pacientes_acudientes` VALUES (1,1),(1,2),(2,2),(3,3),(3,4),(4,4),(5,5),(5,6),(6,6),(7,7),(7,8),(8,8),(9,9),(10,10);
UNLOCK TABLES;

-- Inserción de datos para la tabla diagnosticos
LOCK TABLES `diagnosticos` WRITE;
INSERT INTO `diagnosticos` VALUES (1,'Asma bronquial infantil','Trastorno respiratorio crónico caracterizado por episodios recurrentes de disnea','J45'),(2,'Otitis media aguda','Inflamación del oído medio con acumulación de líquido','H65'),(3,'Gastroenteritis viral','Inflamación del tracto gastrointestinal causada por virus','A08'),(4,'Amigdalitis aguda','Inflamación de las amígdalas palatinas','J03'),(5,'Bronquiolitis','Infección respiratoria que causa inflamación de las vías respiratorias pequeñas','J21'),(6,'Dermatitis atópica','Enfermedad inflamatoria crónica de la piel caracterizada por picazón y sequedad','L20'),(7,'Migraña infantil','Cefalea recurrente con o sin aura','G43'),(8,'Diabetes mellitus tipo 1','Trastorno metabólico caracterizado por hiperglucemia crónica','E10'),(9,'Neumonía bacteriana','Infección del parénquima pulmonar causada por bacterias','J15'),(10,'Fractura de antebrazo','Ruptura completa o incompleta del radio y/o cúbito','S52');
UNLOCK TABLES;

-- Inserción de datos para la tabla habitaciones
LOCK TABLES `habitaciones` WRITE;
INSERT INTO `habitaciones` VALUES (1,'101','Individual','Disponible'),(2,'102','Individual','Ocupada'),(3,'103','Doble','Disponible'),(4,'104','Doble','Ocupada'),(5,'105','UCI Pediátrica','Disponible'),(6,'106','UCI Pediátrica','Ocupada'),(7,'201','Individual','Disponible'),(8,'202','Individual','Ocupada'),(9,'203','Doble','Disponible'),(10,'204','Aislamiento','Disponible');
UNLOCK TABLES;

-- Inserción de datos para la tabla citas
LOCK TABLES `citas` WRITE;
INSERT INTO `citas` VALUES (1,'2024-05-10 09:00:00','Control de asma','Revisión de medicación actual',1,5),(2,'2024-05-10 10:30:00','Dolor de cabeza recurrente','Evaluar posible migraña',2,2),(3,'2024-05-10 12:00:00','Revisión postoperatoria','Control de herida quirúrgica',3,10),(4,'2024-05-11 09:30:00','Fiebre y dolor abdominal',NULL,4,4),(5,'2024-05-11 11:00:00','Control de diabetes','Ajuste de dosis de insulina',5,6),(6,'2024-05-12 08:30:00','Dolor de oído','Posible otitis',6,1),(7,'2024-05-12 10:00:00','Tos persistente','Evaluación respiratoria',7,5),(8,'2024-05-13 09:00:00','Control rutinario',NULL,8,1),(9,'2024-05-13 11:30:00','Erupción cutánea','Sospecha de dermatitis atópica',9,1),(10,'2024-05-14 10:00:00','Dolor en extremidad','Evaluación de fractura',10,10);
UNLOCK TABLES;

-- Inserción de datos para la tabla citas_diagnosticos
LOCK TABLES `citas_diagnosticos` WRITE;
INSERT INTO `citas_diagnosticos` VALUES (1,1),(2,7),(3,10),(4,3),(5,8),(6,2),(7,5),(8,1),(9,6),(10,10);
UNLOCK TABLES;

-- Inserción de datos para la tabla historia_clinica
LOCK TABLES `historia_clinica` WRITE;
INSERT INTO `historia_clinica` VALUES (1,1,'Padre y abuelo paterno con asma. Madre con rinitis alérgica.','Dermatitis atópica a los 6 meses. Bronquiolitis a los 11 meses.','Diagnóstico de asma a los 2 años. Control adecuado con medicación. Última crisis hace 3 meses.'),(2,2,'Madre con migraña. Tía materna con epilepsia.','Infecciones respiratorias recurrentes. Otitis media a los 18 meses.','Inicio de cefaleas a los 3 años. Evaluada por Neurología con diagnóstico de migraña infantil. Buena respuesta al tratamiento.'),(3,3,'Sin antecedentes familiares relevantes.','Apendicectomía a los 4 años.','Fractura de radio y cúbito tras caída jugando fútbol. Reducción e inmovilización exitosa. Evolución favorable.'),(4,4,'Padre con enfermedad celíaca.','Bronquiolitis a los 8 meses. Varicela a los 2 años.','Episodios recurrentes de dolor abdominal y diarrea. Evaluación por gastroenterología en curso.'),(5,5,'Abuela materna con diabetes tipo 2. Tío materno con diabetes tipo 1.','Varicela a los 3 años.','Diagnóstico de diabetes tipo 1 a los 4 años. Control metabólico adecuado con insulina. Última HbA1c: 7.2%.'),(6,6,'Sin antecedentes familiares relevantes.','Infecciones respiratorias altas recurrentes.','Episodios recurrentes de otitis media. Valorada por otorrinolaringología para posible colocación de tubos de ventilación.'),(7,7,'Padre y hermano mayor con asma.','Bronquiolitis a los 6 meses.','Episodios recurrentes de sibilancias. En estudio por posible asma. Respuesta positiva a broncodilatadores.'),(8,8,'Madre con psoriasis. Padre con hipertensión.','Varicela a los 2 años. Escarlatina a los 3 años.','Desarrollo psicomotor adecuado. Control pediátrico regular sin hallazgos relevantes.'),(9,9,'Abuelo paterno con enfermedad coronaria.','Dermatitis atópica desde los 4 meses.','Brotes recurrentes de dermatitis principalmente en pliegues. Buena respuesta a tratamiento tópico. Exacerbación con estrés y cambios climáticos.'),(10,10,'Madre con escoliosis. Tía materna con osteogénesis imperfecta.','Sin enfermedades previas relevantes.','Fractura de antebrazo tras caída de bicicleta. Primera fractura. Densitometría ósea normal para la edad.');
UNLOCK TABLES;

-- Inserción de datos para la tabla hospitalizaciones
LOCK TABLES `hospitalizaciones` WRITE;
INSERT INTO `hospitalizaciones` VALUES (1,'2024-04-15 14:30:00','2024-04-20 11:00:00',2,3,10,10),(2,'2024-04-18 08:45:00','2024-04-25 10:30:00',4,5,6,8),(3,'2024-04-22 16:20:00','2024-04-26 09:15:00',6,7,5,5),(4,'2024-04-25 11:10:00',NULL,2,4,4,3),(5,'2024-04-28 13:40:00','2024-05-03 12:00:00',8,9,1,1),(6,'2024-05-01 09:30:00','2024-05-08 14:45:00',4,1,5,1),(7,'2024-05-05 15:20:00',NULL,6,10,8,9),(8,'2024-05-07 12:10:00','2024-05-10 10:30:00',8,2,2,7),(9,'2024-05-09 08:45:00',NULL,2,6,1,2),(10,'2024-05-11 14:30:00',NULL,4,8,10,10);
UNLOCK TABLES;

-- Inserción de datos para la tabla medicamentos
LOCK TABLES `medicamentos` WRITE;
INSERT INTO `medicamentos` VALUES (1,'Salbutamol','100 mcg/inhalación','Broncodilatador'),(2,'Amoxicilina','250mg/5ml','Antibiótico'),(3,'Paracetamol','500mg','Analgésico/Antipirético'),(4,'Ibuprofeno','400mg','Antiinflamatorio'),(5,'Prednisolona','15mg/5ml','Corticoesteroide'),(6,'Insulina Regular','100 UI/ml','Hormona'),(7,'Amoxicilina/Clavulánico','875/125mg','Antibiótico'),(8,'Cetirizina','10mg','Antihistamínico'),(9,'Loratadina','10mg','Antihistamínico'),(10,'Betametasona crema','0.05%','Corticoesteroide tópico');
UNLOCK TABLES;

-- Inserción de datos para la tabla tratamientos
LOCK TABLES `tratamientos` WRITE;
INSERT INTO `tratamientos` VALUES (1,'Usar inhalador de salbutamol 2 puff cada 6 horas. Mantener ambiente libre de alérgenos.',1),(2,'Amoxicilina 250mg/5ml, 5ml cada 8 horas por 7 días. Analgésicos para dolor.',2),(3,'Solución de rehidratación oral. Dieta blanda. Reposo.',3),(4,'Amoxicilina 500mg cada 8 horas por 10 días. Paracetamol para fiebre y dolor.',4),(5,'Inhalador de salbutamol según necesidad. Paracetamol si hay fiebre.',5),(6,'Crema hidratante diaria. Evitar baños muy calientes. Corticoide tópico en brotes.',6),(7,'Paracetamol para dolor. Evitar desencadenantes. Mantener horarios regulares de sueño.',7),(8,'Insulina según esquema personalizado. Control de glucemia 4 veces al día. Dieta específica.',8),(9,'Amoxicilina/Clavulánico 875/125mg cada 12 horas por 7 días. Reposo y abundante hidratación.',9),(10,'Inmovilización con yeso por 4 semanas. Analgésicos para dolor. Elevación del miembro.',10);
UNLOCK TABLES;

-- Inserción de datos para la tabla tratamientos_medicamentos
LOCK TABLES `tratamientos_medicamentos` WRITE;
INSERT INTO `tratamientos_medicamentos` VALUES (1,1),(2,2),(2,3),(3,3),(4,2),(4,3),(5,1),(5,3),(6,10),(7,3),(8,6),(9,7),(10,4);
UNLOCK TABLES;