DECLARE 
/*Cambiar todos los textos de opiniones para la película 
con ID 4. Modificar concatenando el nombre del usuario 
delante del texto. Ej: "Juan: Aquí iría la opinión del usuario".
Imprimir cuantas filas fueron afectadas utilizando cursor implícito.*/

CURSOR opiniones IS 
SELECT o.*, p.titulo, u.apodo
FROM opinion o, pelicula p, usuario u
WHERE p.idpelicula = 4 AND p.idpelicula = o.idpelicula AND o.idusuario = u.idusuario
FOR UPDATE; 
v_new_opinion VARCHAR(50);
v_row_count NUMBER := 0;

BEGIN
    FOR op IN opiniones LOOP
        v_new_opinion := 'Nueva opinion';
        DBMS_OUTPUT.PUT_LINE('| '||op.apodo||': "'||op.opinion||'" |');
        UPDATE opinion SET opinion = v_new_opinion WHERE idopinion = op.idopinion;
        v_row_count := v_row_count + SQL%ROWCOUNT;
        DBMS_OUTPUT.PUT_LINE('Filas afectadas: '||v_row_count);
    END LOOP;
    COMMIT;
END;