DECLARE
v_email VARCHAR(50);
v_id_usuario NUMBER;
v_apodo VARCHAR(50);
v_count NUMBER;
v_exception EXCEPTION;
v_aux VARCHAR(2);

BEGIN

    v_email := &email;
    v_aux := INSTR(v_email, '@');
    
    IF v_aux = '@' THEN
        SELECT u.idusuario, u.apodo
        INTO v_id_usuario, v_apodo
        FROM usuario u
        WHERE u.email = v_email;
        DBMS_OUTPUT.PUT_LINE(v_id_usuario||'. '||v_apodo);
    ELSE
        RAISE v_exception;
    END IF;
    

EXCEPTION
    /*
    EJERICIO 1
    
    Utilizando el email, buscar e imprimir ID 
    y apodo de un usuario. Lanzar una exception e 
    imprimir un mensaje si no se encuentra ningún 
    usuario con ese email.*/
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('NO HAY UN USUARIO CON ESE CORREO');
    
    /*
    EJECICIO 2
    
    Continuando con el punto anterior, lanzar una exception 
    e imprimir un mensaje si hay más de un usuario con el mismo email.*/
    WHEN TOO_MANY_ROWS THEN
    SELECT COUNT(*)
    INTO v_count
    FROM usuario u
    WHERE u.email = v_email;
    DBMS_OUTPUT.PUT_LINE('HAY MAS DE UN USUARIO CON EL CORREO INGRESADO: '||v_count);
    
    /*
    EJERCICIO 3
    
    Continuando con el punto anterior, crear una exception personalizada 
    e imprimir un mensaje en caso de que el mail ingresado no tenga un "@" 
    en alguna parte del texto.*/
    WHEN v_exception THEN
        DBMS_OUTPUT.PUT_LINE('ESTE CORREO NO TIENE (@)');
    
END;