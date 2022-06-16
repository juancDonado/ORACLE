/*Se debe retornar nombre de la película, la calificación 
promedio numérica y calificación en texto (Entre 1 y 2: Mala 
- entre 3 y 4: Buena - Mayor a 4: Excelente) y el número 
de calificaciones, todo en un mismo texto.*/
CREATE OR REPLACE FUNCTION evaluacion_pelicula(p_idpelicula NUMBER) RETURN VARCHAR2 IS
/*CURSOR peliculas IS 
SELECT p.idpelicula, o.idpelicula, o.puntuacion
FROM pelicula p, opinion o
WHERE o.idpelicula = p.idpelicula;*/

v_cal_promedio NUMBER;
v_count NUMBER;
v_name VARCHAR(50);
v_res VARCHAR2(100);

BEGIN
    SELECT AVG(ALL puntuacion), COUNT(puntuacion)
    INTO v_cal_promedio, v_count
    FROM opinion
    WHERE idpelicula = p_idpelicula;
    
    SELECT p.titulo
    INTO v_name
    FROM pelicula p
    WHERE p.idpelicula = p_idpelicula;
    
    IF v_cal_promedio >= 1 AND v_cal_promedio <= 2 THEN 
        v_res := 'Mala';
    ELSIF v_cal_promedio >= 3 AND v_cal_promedio <= 4 THEN 
        v_res := 'Buena';
    ELSIF v_cal_promedio = 5 THEN
        v_res := 'Excelente';
    ELSE
        RETURN 'Valor no valido';
    END IF;
    
    v_res := v_name||' - Calificacion: '||v_res||'('||v_cal_promedio||') - Basada en '||v_count||' puntuaciones';
    
    RETURN v_res;
END;