CREATE OR REPLACE PROCEDURE login_usuario(p_apodo IN VARCHAR, p_pass IN VARCHAR, v_mensaje OUT VARCHAR, 
v_idusuario OUT NUMBER, v_apodo OUT VARCHAR, v_emaIl OUT VARCHAR) IS 

v_pass_hasheado VARCHAR2(255);
v_datos_validos NUMBER(10);

BEGIN
    SELECT u.idusuario
    INTO v_idusuario
    FROM usuario u
    WHERE u.apodo = p_apodo;
    
    SELECT STANDARD_HASH(p_pass, 'MD5')
    INTO v_pass_hasheado
    FROM DUAL;
    
    SELECT COUNT(*)
    INTO v_datos_validos
    FROM usuario u
    WHERE u.idusuario = v_idusuario AND v_pass_hasheado = u.password;
    
    IF v_datos_validos > 0 THEN
        SELECT u.idusuario, u.apodo, u.email
        INTO v_idusuario, v_apodo, v_email
        FROM usuario u
        WHERE u.idusuario = v_idusuario;
        
        v_mensaje := 'LOGIN CORRECTO';
    ELSE
        v_mensaje := 'LOGIN INCORRECTO';
        v_idusuario :=  NULL;
        v_apodo := NULL;
        v_email := NULL; 
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    v_mensaje := 'USUARIO INEXISTENTE';
    v_idusuario :=  NULL;
    v_apodo := NULL;
    v_email := NULL; 
END;

/*
bloque anonimo

DECLARE
v_apodo_p VARCHAR2(20);
v_pass_p VARCHAR(100);

v_mensaje VARCHAR2(255);
v_idusuario NUMBER(10);
v_apodo VARCHAR(50);
v_email VARCHAR2(320);

BEGIN
    v_apodo_p := 'JuanPerez1323';
    v_pass_p := 'abc123';
    
    login_usuario(v_apodo_p, v_pass_p, v_mensaje, v_idusuario, v_apodo, v_email);
    
    DBMS_OUTPUT.PUT_LINE('Mensaje: '||v_mensaje);
    DBMS_OUTPUT.PUT_LINE('ID: '||v_idusuario);
    DBMS_OUTPUT.PUT_LINE('Apodo: '||v_apodo);
    DBMS_OUTPUT.PUT_LINE('Email: '||v_email);
END;
*/