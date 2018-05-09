/*
 para mejorar la percepción de los clientes se ha decidido que
en la tabla Departments se añada una nueva columna que almacenara elementos de tipo blob y en
esa columna se almacene la imagen de la bandera del país en la que se encuentra el departamento
de acuerdo a lo ingresado en la tabla Locations.
*/

Select * from LOCATIONS;


ALTER TABLE DEPARTMENTS
ADD BANDERA BLOB;

SELECT * FROM DEPARTMENTS;

CREATE OR REPLACE DIRECTORY IMG AS 'C:\sql_files\img\';
GRANT READ, WRITE ON DIRECTORY IMG TO HR;
COMMIT;



SET SERVEROUTPUT ON;
DECLARE 
    CURSOR C_DEPARTAMENTOS IS SELECT LOCATIONS.COUNTRY_ID AS PAIS, DEPARTMENTS.DEPARTMENT_ID 
                            FROM DEPARTMENTS 
                            JOIN LOCATIONS
                            ON DEPARTMENTS.LOCATION_ID = LOCATIONS.LOCATION_ID;
    V_IMAGEN BLOB;
    V_ARCHIVO BFILE;
    MENSAJE VARCHAR2(100);
    V_IDDEPTO NUMBER;
BEGIN
    
    FOR FILA IN C_DEPARTAMENTOS LOOP
    
       IF(FILA.PAIS = 'US') THEN       
            V_ARCHIVO := BFILENAME('IMG','US.PNG');
            dbms_output.put_line(FILA.PAIS);
       ELSIF (FILA.PAIS = 'CA') THEN
            V_ARCHIVO := BFILENAME('IMG','CA.PNG');
            dbms_output.put_line(FILA.PAIS);
         ELSIF (FILA.PAIS = 'DE') THEN
            V_ARCHIVO := BFILENAME('IMG','DE.PNG');
            dbms_output.put_line(FILA.PAIS);
        ELSIF (FILA.PAIS = 'UK') THEN
            V_ARCHIVO := BFILENAME('IMG','UK.PNG');
            dbms_output.put_line(FILA.PAIS);
        END IF; 
         
         V_IDDEPTO := FILA.DEPARTMENT_ID;
           
        UPDATE  DEPARTMENTS 
        SET BANDERA = EMPTY_BLOB()
        WHERE DEPARTMENT_ID = V_IDDEPTO
        RETURNING BANDERA  INTO V_IMAGEN;
       
        DBMS_LOB.FILEOPEN(V_ARCHIVO, DBMS_LOB.LOB_READONLY);
        DBMS_LOB.LOADFROMFILE(V_IMAGEN, V_ARCHIVO, DBMS_LOB.GETLENGTH(V_ARCHIVO));
        DBMS_LOB.FILECLOSE(V_ARCHIVO);
        COMMIT;
       
    END LOOP;
    
    
EXCEPTION
WHEN OTHERS THEN --Encuentra cualquier error
    MENSAJE := SQLERRM;
    DBMS_OUTPUT.PUT_LINE(MENSAJE);
    DBMS_LOB.FILECLOSE(V_ARCHIVO);    
END;
/
    
    
    SELECT * FROM DEPARTMENTS;
    

        SELECT *
        FROM DEPARTMENTS 
        JOIN LOCATIONS
        ON DEPARTMENTS.LOCATION_ID = LOCATIONS.LOCATION_ID;
