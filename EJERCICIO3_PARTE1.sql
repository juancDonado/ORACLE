--Obtener e imprimir todas las opiniones para la película con ID 5.

DECLARE 
CURSOR opinion_pelicula IS 
SELECT o.* , p.titulo
FROM opinion o, pelicula p
WHERE o.idpelicula = 5 AND o.idpelicula = p.idpelicula;

BEGIN

    FOR opiniones IN opinion_pelicula LOOP
        DBMS_OUTPUT.PUT_LINE('Pelicula: '||opiniones.titulo||' "'||opiniones.opinion||'" '||opiniones.puntuacion||' estrellas.');
    END LOOP;

END;