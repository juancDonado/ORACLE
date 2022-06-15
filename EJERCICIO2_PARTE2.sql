/*
Calcular la potencia de un número cualquiera e 
imprimir el resultado. Ejemplo: 2^4 = 16.
*/
DECLARE
v_num NUMBER;
v_exponent NUMBER;
v_result NUMBER := 1;
v_count NUMBER := 1;
BEGIN

v_num := &num;
v_exponent := &exponent;


WHILE v_count <= v_exponent LOOP
    v_result := v_result * v_exponent;
    v_count := v_count +1;
    DBMS_OUTPUT.PUT_LINE('Resultado: '||v_result||' Contador: '||v_count);
END LOOP;

DBMS_OUTPUT.PUT_LINE('El resultado es: '||v_result);

END;

