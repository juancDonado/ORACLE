DECLARE 
v_max_year NUMBER := 1999;
v_coco_description VARCHAR2(400);
v_movie pelicula%ROWTYPE;
v_year_movie NUMBER;
v_description VARCHAR(1000);
v_short_description VARCHAR(50);
v_movie_id NUMBER;

BEGIN

--PRIMER EJERCICIO
--Traer e imprimir el a�o de estreno mas alto
SELECT MAX(A�O) INTO v_max_year FROM pelicula; 

--PRIMER EJERCICIO
--Traer descripcion de la pelicula COCO
SELECT NVL(DESCRIPCION, 'SERA QUE YA?') INTO v_coco_description FROM pelicula WHERE idpelicula = 6;

v_movie_id := &idmovie ; 
--TERCER EJERCICIO
/*Armar e imprimir una descripci�n corta 
de cualquier pel�cula con el siguiente 
formato: (a�o de estreno) - Primeros 40 
caracteres de la descripci�n...
*/
SELECT A�O, DESCRIPCION INTO v_year_movie, v_description FROM PELICULA WHERE idpelicula = v_movie_id;

v_short_description := SUBSTR(v_description, 1, 40);


dbms_output.put_line(v_max_year);
dbms_output.put_line(v_coco_description);
dbms_output.put_line('('||v_year_movie||') '||v_short_description||'...');



END;
