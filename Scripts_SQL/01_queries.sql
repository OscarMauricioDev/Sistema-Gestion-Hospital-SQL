-- Consulta 1: Visualizar pacientes con sus acudientes
-- Une las tablas pacientes, pacientes_acudientes y acudientes para mostrar los nombres correspondientes.
SELECT
    p.nombre AS Nombre_Paciente,
    a.nombre AS Nombre_Acudiente
FROM pacientes p
JOIN pacientes_acudientes pa ON p.id_paciente = pa.id_paciente
JOIN acudientes a ON pa.id_acudiente = a.id_acudiente;

-- Consulta 2: Listar las citas con información del paciente y del médico
-- Combina las tablas citas, pacientes y medicos para obtener detalles de las citas.
SELECT
    c.fecha AS Fecha_Cita,
    c.motivo AS Motivo_Cita,
    p.nombre AS Nombre_Paciente,
    m.nombre AS Nombre_Medico
FROM citas c
JOIN pacientes p ON c.id_paciente = p.id_paciente
JOIN medicos m ON c.id_medico = m.id_medico;

-- Consulta 3: Ver pacientes hospitalizados actualmente (sin fecha de salida)
-- Filtra las hospitalizaciones para mostrar solo aquellas donde la fecha de salida es NULL.
SELECT
    p.nombre AS Nombre_Paciente,
    h.fecha_ingreso AS Fecha_Ingreso,
    h.fecha_salida AS Fecha_Salida
FROM hospitalizaciones h
JOIN pacientes p ON h.id_paciente = p.id_paciente
WHERE h.fecha_salida IS NULL;

-- Consulta 4: Obtener los tratamientos con sus medicamentos asociados
-- Une las tablas tratamientos, tratamientos_medicamentos y medicamentos para ver qué medicamentos componen cada tratamiento.
SELECT
    t.instrucciones AS Instrucciones_Tratamiento,
    m.nombre AS Nombre_Medicamento
FROM tratamientos t
JOIN tratamientos_medicamentos tm ON t.id_tratamiento = tm.id_tratamiento
JOIN medicamentos m ON tm.id_medicamento = m.id_medicamento;

-- Consulta 5: Visualizar médicos y su especialidad (incluyendo los médicos que no tienen especialidad registrada)
-- Utiliza LEFT JOIN para asegurarse de que se muestren todos los médicos, incluso si no tienen una especialidad asignada.
SELECT
    m.nombre AS Nombre_Medico,
    e.nombre AS Nombre_Especialidad
FROM medicos m
LEFT JOIN especialidades e ON m.id_especialidad = e.id_especialidad;

-- Consulta 6: Contar citas médicas en el año 2024
-- Utiliza COUNT y WHERE con la función YEAR() para contar las citas del año especificado.
SELECT COUNT(*) AS Total_Citas_2024
FROM citas
WHERE YEAR(fecha) = 2024;

-- Consulta 7: Mostrar cuántas citas ha tenido cada médico en 2024, y solo mostrar los que han atendido más de 2 citas
-- Combina JOIN, WHERE, GROUP BY y HAVING para contar citas por médico y filtrar por un mínimo de citas.
SELECT
    m.nombre AS Nombre_Medico,
    COUNT(c.id_cita) AS Total_Citas_2024
FROM citas c
JOIN medicos m ON c.id_medico = m.id_medico
WHERE YEAR(c.fecha) = 2024
GROUP BY m.nombre
HAVING COUNT(c.id_cita) > 2;