CREATE OR REPLACE PROCEDURE login (p_apodo IN VARCHAR, p_pass IN VARCHAR, p_mensaje OUT VARCHAR2) IS

/*CURSOR inicio_sesion(p_apodo VARCHAR, p_pass VARCHAR) IS
SELECT u.idusuario, u.apodo, u.email
FROM usuario u
WHERE u.apodo = p_apodo AND u.password = p_pass;*/

v_mensaje VARCHAR2(100);
v_id_usuario usuario.idusuario%TYPE;
v_apodo usuario.apodo%TYPE;
v_pass usuario.password%TYPE;
v_email usuario.email%TYPE;

BEGIN 
    SELECT u.idusuario, u.apodo, u.email, u.password
    INTO v_id_usuario, v_apodo, v_email, v_pass
    FROM usuario u
    WHERE u.apodo = p_apodo AND u.password = p_pass;
    
    IF v_apodo != p_apodo THEN
        v_mensaje := 'USUARIO INCORRECTO';
    ELSIF v_pass != p_pass THEN
        v_mensaje := 'CONTRASEÑA INCORRECTA';
    END IF;
    
    v_mensaje := 'LOGIN CORRECTO. INFORMACION: '||v_id_usuario||'. '||v_apodo||' - '||v_email;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    v_mensaje := 'USUARIO NO EXISTENTE';
END;