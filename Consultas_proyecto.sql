SELECT 
    d.nombre_departamento,
    p.nombre_programa,
    AVG(a.frecuencia_uso_internet) AS promedio_uso_internet,
    AVG(a.frecuencia_uso_celular) AS promedio_uso_celular,
    AVG(a.frecuencia_uso_computador) AS promedio_uso_computador,
    CASE 
        WHEN AVG(a.frecuencia_uso_internet) > 4 THEN 'Alta'
        WHEN AVG(a.frecuencia_uso_internet) BETWEEN 2 AND 4 THEN 'Media'
        ELSE 'Baja'
    END AS categoria_uso_internet
FROM 
    aprovechamiento a
JOIN 
    departamentos d ON a.id_departamento = d.id_departamento
JOIN 
    programas_digitales p ON a.id_programa = p.id_programa
GROUP BY 
    a.id_departamento, d.nombre_departamento, a.id_programa, p.nombre_programa;


 



SELECT 
    d.nombre_departamento,
    p.nombre_programa,
    MAX(a.frecuencia_uso_internet) AS max_uso_internet,
    MIN(a.frecuencia_uso_internet) AS min_uso_internet,
    AVG(a.frecuencia_uso_internet) AS avg_uso_internet,
    MAX(a.frecuencia_uso_celular) AS max_uso_celular,
    MIN(a.frecuencia_uso_celular) AS min_uso_celular,
    AVG(a.frecuencia_uso_celular) AS avg_uso_celular,
    MAX(a.frecuencia_uso_computador) AS max_uso_computador,
    MIN(a.frecuencia_uso_computador) AS min_uso_computador,
    AVG(a.frecuencia_uso_computador) AS avg_uso_computador
FROM 
    aprovechamiento a
JOIN 
    departamentos d ON a.id_departamento = d.id_departamento
JOIN 
    programas_digitales p ON a.id_programa = p.id_programa
GROUP BY 
    a.id_departamento, d.nombre_departamento, a.id_programa, p.nombre_programa;



SELECT 
    a.id_departamento,
    d.nombre_departamento,
    AVG(a.frecuencia_uso_celular) / NULLIF(AVG(a.frecuencia_uso_internet), 0) AS proporcion_celular_internet,
    AVG(a.frecuencia_uso_computador) / NULLIF(AVG(a.frecuencia_uso_internet), 0) AS proporcion_computador_internet
FROM 
    aprovechamiento a
JOIN 
    departamentos d ON a.id_departamento = d.id_departamento
GROUP BY 
    a.id_departamento, d.nombre_departamento;

SELECT 
    d.nombre_departamento,
    d.PIB_per_capita,
    AVG(bd.nivel_brecha) as nivel_brecha_promedio,
    AVG(am.acceso_internet_hogar) as promedio_acceso_internet_hogar,
    (
        SELECT COUNT(*)
        FROM infraestructura_digital id
        WHERE id.id_departamento = d.id_departamento
        AND id.cobertura_territorial > (
            SELECT AVG(cobertura_territorial)
            FROM infraestructura_digital
        )
    ) as zonas_alta_cobertura
FROM departamentos d
LEFT JOIN brecha_digital bd ON d.id_departamento = bd.id_departamento
LEFT JOIN material am ON d.id_departamento = am.id_departamento
GROUP BY d.id_departamento, d.nombre_departamento, d.PIB_per_capita;

SELECT 
    d.nombre_departamento,
    AVG(m.no_usan_internet_costo) as barrera_costo,
    AVG(m.no_usan_internet_interes) as barrera_interes,
    AVG(m.no_usan_internet_no_saber_usarlo) as barrera_conocimiento,
    AVG(bd.nivel_brecha) as nivel_brecha,
    CASE 
        WHEN AVG(bd.nivel_brecha) > 30 THEN 'Crítica'
        WHEN AVG(bd.nivel_brecha) > 20 THEN 'Alta'
        WHEN AVG(bd.nivel_brecha) > 10 THEN 'Media'
        ELSE 'Baja'
    END as clasificacion_brecha
FROM departamentos d
JOIN brecha_digital bd ON d.id_departamento = bd.id_departamento
JOIN motivacion m ON d.id_departamento = m.id_departamento
GROUP BY d.nombre_departamento;



SELECT 
    nf.nivel_formacion,
    ie.nombre_institucion,
    d.nombre_departamento,
    (
        SELECT AVG(ap.frecuencia_uso_internet)
        FROM aprovechamiento ap
        WHERE ap.id_departamento = d.id_departamento
    ) as uso_promedio_internet_departamento,
    (
        SELECT AVG(ap.frecuencia_uso_computador)
        FROM aprovechamiento ap
        WHERE ap.id_departamento = d.id_departamento
    ) as uso_promedio_computador_departamento,
    (
        SELECT AVG(am.acceso_internet_publico)
        FROM material am
        WHERE am.id_departamento = d.id_departamento
    ) as acceso_promedio_departamento
FROM nivel_formacion nf
JOIN instituciones_educativas ie ON nf.id_institucion = ie.id_institucion
JOIN departamentos d ON ie.id_departamento = d.id_departamento
GROUP BY nf.nivel_formacion, ie.nombre_institucion, d.nombre_departamento
HAVING uso_promedio_internet_departamento > (
    SELECT AVG(frecuencia_uso_internet)
    FROM aprovechamiento
)  
ORDER BY `uso_promedio_internet_departamento` ASC

 

 





