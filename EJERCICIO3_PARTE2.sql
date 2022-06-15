DECLARE
/*Obtener e imprimir todas las opiniones de un usuario 
(enviar id de usuario por parámetro al cursor), 
imprimiendo primero el nombre de la película en mayúsculas y luego la opinión.*/

CURSOR pelicula(v_id_usuario NUMBER) IS 
SELECT u.* , p.titulo, o.opinion
FROM usuario u, pelicula p , opinion o
WHERE u.idusuario = v_id_usuario AND o.idpelicula = p.idpelicula AND o.idusuario = u.idusuario;

v_id_usuario NUMBER;

BEGIN

    v_id_usuario := &idusuario;
    /*OPEN pelicula;
    LOOP
        FETCH pelicula INTO v_user_name, v_movie_name, v_opinion;
        EXIT WHEN pelicula%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_id_usuario||'. '||v_user_name||': '||
        UPPER(v_movie_name)||'-> "'||v_opinion||'".');
    END LOOP;
    CLOSE pelicula;*/
    
    FOR usuario IN pelicula(v_id_usuario) LOOP
        DBMS_OUTPUT.PUT_LINE(usuario.idusuario||'. '||usuario.apodo||
        ' -> Nombre: '||UPPER(usuario.titulo||' "'||usuario.opinion||'"'));
    END LOOP;
    
END;