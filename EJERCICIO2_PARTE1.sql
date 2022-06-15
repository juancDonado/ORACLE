/*
Dada una determinada opinión, si esta fue de 1 o 2 
puntos llenar una variable con el valor "Mala". 
Si fue de 3 o 4 puntos "Buena" y si fue de 5 puntos 
"Excelente". Luego imprimir el resultado junto al 
título de la película.
*/
DECLARE 
v_opinion opinion%ROWTYPE;
v_id_opinion opinion.idopinion%TYPE;
v_name_movie pelicula.titulo%TYPE;
v_num NUMBER;
v_text VARCHAR(20);

BEGIN

v_num := &v_id_opinion;

SELECT o.idopinion, p.titulo
INTO v_id_opinion, v_name_movie
FROM opinion o, pelicula p
WHERE o.idopinion = v_num AND o.idpelicula = p.idpelicula;

SELECT o.*
INTO v_opinion
FROM opinion o
WHERE o.idopinion = v_id_opinion;

CASE 
WHEN v_opinion.puntuacion IN (1,2) THEN
    v_text := 'Mala';
WHEN v_opinion.puntuacion IN (3,4) THEN
    v_text := 'Buena';
WHEN v_opinion.puntuacion = 5 THEN
    v_text := 'Excelente';
END CASE;

DBMS_OUTPUT.PUT_LINE('La pelicula '||v_name_movie||' tuvo una puntuacion de: '||v_text);



END;