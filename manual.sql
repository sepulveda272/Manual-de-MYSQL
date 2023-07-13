-- Active: 1688868892717@@127.0.0.1@3306
//--Sentencia para crear una base de datos
CREATE DATABASE  nombre_de_la_tabla_de_datos;

//--Necesitaremos la base de datos mundo
CREATE DATABASE IF NOT EXISTS mundo;

//--Para borrar la base de datos
DROP DATABASE nombre_de_la_tabla_de_datos;

//--O tambien así
DROP DATABASE IF EXISTS nombre_de_la_tabla_de_datos

//--crear tablas de datos
CREATE TABLE nombre_de_la_tabla(
    columna tipo_de_dato1,
    columna tipo_de_dato2,
    columna tipo_de_dato3,
    ...
);

//--O tambien 
CREATE TABLE IF NOT EXISTS nombre_de_la_tabla(
    columna tipo_de_dato1,
    columna tipo_de_dato2,
    columna tipo_de_dato3,
    ...
);

//-- Ahora crearemos la tabla llamada pais 

USE mundo; //--La sentencia Use indica que la base de datos se va trabajar

CREATE TABLE IF NOT EXISTS pais(
    id int,
    nombre Varchar(20),
    continente Varchar(50),
    poblacion int
);

//--Existen varios tipos de Datos  : 

INT	Número entero
VARCHAR(size)	Cadena de texto de longitud variable, especificada por "size"
CHAR(size)	Cadena de texto de longitud fija, especificada por "size"
TEXT	Texto de longitud variable
DATE	Fecha (formato: 'YYYY-MM-DD')
TIME	Hora (formato: 'HH:MM:SS')
DATETIME	Fecha y hora (formato: 'YYYY-MM-DD HH:MM:SS')
FLOAT	Número decimal de precisión simple
DOUBLE	Número decimal de precisión doble
DECIMAL(p, s)	Número decimal con precisión y escala específicas
BOOLEAN	Valor booleano (0 o 1)
ENUM(val1, val2)	Enumeración de valores específicos
SET(val1, val2)	Conjunto de valores específicos
BLOB	Datos binarios largos


//--Se puede borrar tablas usando
DROP TABLE nombre_de_la_tabla;

//--El ejemplo para crear y borrar una tabla de datos llamada Temp es 

CREATE TABLE Temp(
    id integer,
    dato VARCHAR(20)
);

Drop Table Temp;

//--Creación de llaves primrias en tablas
CREATE TABLE nombre_de_la_tabla(
    columna tipo_de_dato1 PRIMARY KEY,
    columna tipo_de_dato2,
    columna tipo_de_dato3,
    ..
);

//--así qudaria en nuestra tabla 
CREATE TABLE IF NOT EXISTS pais (
    id int PRIMARY KEY,
    nombre varchar(20),
    continente varchar(50),
    población int
);

//--Definimos la lave primaria
ALTER TABLE nombre_de_la_tabla //--Nos permite poder cambiar la estructura de una tabla
ADD PRIMARY KEY (columna1); //--Coge la llave primaria

//--El ejemplo serí así
ALTER TABLE pais
ADD PRIMARY KEY (id);

//--Sentencia de datos
//--(insert,delete,update),

INSERT INTO nombre_de_la_tabla(columna1,columna2,columna3,...)
Values (valor1,valor2,valor3,...);

//--para insertar valores en la tabla sería asi 
INSERT INTO pais(id,nombre,continente,poblacion)
VALUES (101, "colombia","Sur América", 5000000000);

INSERT INTO pais (id, nombre, continente, poblacion)
VALUES (102, "Ecuador", "Sur América", 17000000);

INSERT INTO pais (id, nombre, continente, poblacion)
VALUES (103, "Guatemala", "Centro América", 17000000);

INSERT INTO pais (id, nombre, continente, poblacion)
VALUES (104, "México", "Centro América", 126000000);

INSERT INTO pais (id, nombre, continente, poblacion)
VALUES (105, "Estados Unidos", "Norte América", 331000000);

INSERT INTO pais (id, nombre, continente, poblacion)
VALUES (106, "Canada", "Centro América", 38000000);

//--Para poder modificar un valor se usando
UPDATE nombre_de_la_tabla
SET columna1= valor1,columna2= valor2, ...
Where condicion; //--es una cláusula opcional que especifica la condición que deben cumplir las filas 

//--Vamos a usa el update para modificar el id=101 que contiene el valor 50887423

UPDATE pais
SET poblacion = 50887423
WHERE id=101;

//--DELETE permite borrar uno o varios registros en la tabla

DELETE FROM nombre_de_la_tabla;

//-- Truncate permite eliminar los registros de una tabla 

TRUNCATE nombre_de_la_tabla;//--Se le puede agregar un límite de registros
//--En este caso se eliminará cierta cantidad de filas 

DELETE FROM mi_tabla
WHERE condicion
LIMIT cantidad_registros;

//--SELECT ayudará a seleccionar una seleccion en la base de datos

SELECT nombre_de_los_campos
FROM nombre_de_las_tablas
WHERE condición;

   SELECT se listan los campos (columnas) que se quieren extraer en la consulta
	FROM son la tabla (o tablas) donde están los datos
	WHERE son los filtros o condiciones que deben cumplir los registros para ser seleccionados.

//--Un claro ejemplo de select :
SELECT id, nombre, continente, poblacion 
FROM pais;

//--Para consultar todos lo campos de una tabla se usa 
SELECT * 
FROM pais;
WHERE poblacion <= 100000000;//-- Aquí seleccionó os nombre de los paises con menos de 100 millones de habitantes

//--En la cláusulas de WHERE se puede usae varios operadores como lo son : 
1.	Operadores de comparación:

	"=": Igual a.
	"<>": Diferente de.
	"<": Menor que.
	">": Mayor que.
	"<=": Menor o igual que.
	">=": Mayor o igual que

2.	Operadores lógicos:
	"AND": Evalúa dos condiciones y devuelve verdadero si ambas son verdaderas.
	"OR": Evalúa dos condiciones y devuelve verdadero si al menos una de ellas es verdadera.
	"NOT": Niega una condición y devuelve verdadero si la condición es falsa.

//--A la sintaxis basica que se dió más arriba se le puede agregar el limite y la ordenación 
SELECT nombre_de_los_campos
FROM nombre_de_las_tablas
WHERE condición
ORDER BY especificacion_de_ordenacion
LIMIT límite_registros_devueltos

//--Ejemplo de nombres de los 100 milones de habitantes pero en listado alfabetico
SELECT nombre 
FROM pais
WHERE poblacion <= 100000000
ORDER BY nombre;

//----Para usar un operador de mayor a menor se usa DESC 
SELECT nombre 
FROM pais
ORDER BY nombre DESC;

//---- Seleccionar los nombres de los países ordenados alfabéticamente de forma ascendente
SELECT nombre 
FROM pais
ORDER BY nombre ASC;

-- Seleccionar los dos primeros nombres de los países con menos de 100 millones de habitantes, ordenados alfabéticamente
SELECT nombre 
FROM pais
WHERE poblacion < 100000000
ORDER BY nombre
LIMIT 2;

-- Crear una tabla nueva llamada "tempPais" con los nombres y poblaciones de los países que tienen menos de 100 millones de habitantes
CREATE TABLE tempPais
AS
SELECT nombre, poblacion
FROM pais
WHERE poblacion < 100000000;

-- Obtener la estructura de la tabla "tempPais"
DESCRIBE tempPais;

-- Crear la tabla "ciudad" con una llave foránea que referencia al campo "id" de la tabla "pais"
CREATE TABLE ciudad (
    id int PRIMARY KEY,
    nombre varchar(20),
    id_pais int,
    FOREIGN KEY (id_pais)
    REFERENCES pais (id)
);

-- Seleccionar los nombres de los países con un alias "nombre_pais"
SELECT nombre AS nombre_pais
FROM pais;

-- Seleccionar los nombres de los países y sus ciudades correspondientes con alias de tablas
SELECT p.nombre AS nombre_pais, c.nombre AS nombre_ciudad
FROM pais AS p
JOIN ciudad AS c ON p.id = c.id_pais;

-- Concatenar los nombres y apellidos de los clientes en un solo campo con alias "nombre_completo"
SELECT CONCAT(nombre, ' ', apellido) AS nombre_completo
FROM clientes;

-- Asignar la categoría "Alto" o "Bajo" a los productos según su precio
SELECT nombre, precio, IF(precio > 100, 'Alto', 'Bajo') AS categoria_precio
FROM productos;

-- Combinar los nombres de los países y sus ciudades correspondientes utilizando INNER JOIN
SELECT p.nombre AS nombre_pais, c.nombre AS nombre_ciudad
FROM pais AS p
INNER JOIN ciudad AS c ON p.id = c.id_pais;
WHERE pais.nombre = "México"

LEFT JOIN:
//--La sintaxis de los LEFT JOIN es la siguiente:
SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;

//--Un ejemplo de uso de LEFT JOIN es listar todos los países y las ciudades que estén en la base de datos. La consulta SQL sería la siguiente:
SELECT pais.nombre AS pais, ciudad.nombre AS ciudad
FROM pais
LEFT JOIN ciudad
ON pais.id = ciudad.id_pais;

//--RIGHT JOIN:
//--La cláusula RIGHT JOIN devuelve todos los registros de la tabla derecha y los registros coincidentes de la tabla izquierda. El resultado es NULL en el lado izquierdo si no hay coincidencia.
//--La sintaxis de los RIGHT JOIN es la siguiente:
SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;

    //--Un ejemplo de uso de RIGHT JOIN es listar todas las ciudades y los países a los que pertenecen. La consulta SQL sería la siguiente:
SELECT pais.nombre AS pais, ciudad.nombre AS ciudad
FROM pais
RIGHT JOIN ciudad
ON pais.id = ciudad.id_pais;


//--RIGHT JOIN:
//--La cláusula RIGHT JOIN devuelve todos los registros de la tabla derecha y los registros coincidentes de la tabla izquierda. El resultado es NULL en el lado izquierdo si no hay coincidencia.
//--La sintaxis de los RIGHT JOIN es la siguiente:
SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;


//--Un ejemplo de uso de RIGHT JOIN es listar todas las ciudades y los países a los que pertenecen. La consulta SQL sería la siguiente:
SELECT pais.nombre AS pais, ciudad.nombre AS ciudad
FROM pais
RIGHT JOIN ciudad
ON pais.id = ciudad.id_pais;

//-- Ejemplo 1: Crear un procedimiento almacenado que lista las ciudades de un país por nombre
DELIMITER $$
//-- Crea el procedimiento almacenado llamado "listar_ciudades_nom_pais"
CREATE PROCEDURE listar_ciudades_nom_pais(IN nom_pais VARCHAR(50))
BEGIN
    //-- Sentencia SQL para obtener las ciudades del país especificado
    SELECT C.nombre
    FROM país AS P
    INNER JOIN ciudad AS C ON P.id = C.id_pais
    WHERE P.nombre = nom_pais;
END
$$
DELIMITER ;

//-- Ejemplo 2: Crear un procedimiento almacenado que cuenta la cantidad de ciudades de un país
DELIMITER $$
//-- Crea el procedimiento almacenado llamado "contar_ciudades_nom_pais"
CREATE PROCEDURE contar_ciudades_nom_pais(IN nom_pais VARCHAR(50), OUT total INT UNSIGNED)
BEGIN
    //-- Consulta SQL para contar las ciudades del país especificado
    SELECT COUNT(*) INTO total
    FROM país AS P
    INNER JOIN ciudad AS C ON P.id = C.id_pais
    WHERE P.nombre = nom_pais;
END
$$
DELIMITER ;

//-- Llamadas a los procedimientos almacenados

//-- Ejemplo de llamada al procedimiento "listar_ciudades_nom_pais"
DELIMITER ;
//-- Llama al procedimiento "listar_ciudades_nom_pais" pasando el parámetro "Colombia"
CALL listar_ciudades_nom_pais('Colombia');
//-- Restaura el delimitador de comandos a ";"
DELIMITER ;

//-- Ejemplo de llamada al procedimiento "contar_ciudades_nom_pais"
DELIMITER ;
//-- Llama al procedimiento "contar_ciudades_nom_pais" pasando el parámetro "Colombia" y muestra el resultado usando una variable de usuario
CALL contar_ciudades_nom_pais('Colombia', @total);
//-- Muestra el valor almacenado en la variable de usuario "@total"
SELECT @total;
//-- Restaura el delimitador de comandos a ";"
DELIMITER ;

//-- Estructuras de control

//-- Ejemplo de estructura IF-THEN-ELSE
DELIMITER $$
//-- Procedimiento almacenado que verifica si existen idiomas que no se hablan en ningún país
CREATE PROCEDURE verificar_idiomas_sin_pais()
BEGIN
    DECLARE num_idiomas_sin_pais INT;
    
    //-- Contar el número de idiomas que no se hablan en ningún país
    SELECT COUNT(*) INTO num_idiomas_sin_pais
    FROM idioma
    WHERE id NOT IN (SELECT id_idioma FROM idioma_pais);
    
    //-- Verificar si hay o no hay idiomas sin país y mostrar el resultado
    IF num_idiomas_sin_pais > 0 THEN
        //-- Si hay idiomas sin país, mostrar el mensaje correspondiente
        SELECT CONCAT('Existen ', num_idiomas_sin_pais, ' idiomas que no se hablan en ningún país.') AS mensaje;
    ELSE
        //-- Si no hay idiomas sin país, mostrar otro mensaje
        SELECT 'No hay idiomas que no se hablen en ningún país.' AS mensaje;
    END IF;
END
$$
DELIMITER ;

//-- Ejemplo de estructura CASE
DELIMITER $$
//-- Procedimiento almacenado que muestra información de una ciudad según su ID
CREATE PROCEDURE obtener_info_ciudad(IN ciudad_id INT)
BEGIN
    DECLARE ciudad_nombre VARCHAR(20);
    DECLARE pais_nombre VARCHAR(20);
    DECLARE continente_nombre VARCHAR(50);
    DECLARE poblacion INT;
    DECLARE info VARCHAR(100);
    
    //-- Obtener información de la ciudad y su país usando la estructura CASE
    SELECT C.nombre, P.nombre, P.continente, P.poblacion
    INTO ciudad_nombre, pais_nombre, continente_nombre, poblacion
    FROM ciudad AS C
    INNER JOIN pais AS P ON C.id_pais = P.id
    WHERE C.id = ciudad_id;
    
    //-- Construir el mensaje de información usando la estructura CASE
    SET info = CASE
        WHEN poblacion > 1000000 THEN CONCAT(ciudad_nombre, ' es una gran ciudad en ', continente_nombre, '.')
        WHEN poblacion > 500000 THEN CONCAT(ciudad_nombre, ' es una ciudad de tamaño mediano en ', continente_nombre, '.')
        ELSE CONCAT(ciudad_nombre, ' es una pequeña ciudad en ', continente_nombre, '.')
    END;
    
    //-- Mostrar la información
    SELECT CONCAT('La ciudad de ', ciudad_nombre, ' se encuentra en el país de ', pais_nombre, '. ', info) AS información;
END
$$
DELIMITER ;

//-- Estructuras repetitivas

//-- Ejemplo de bucle LOOP
DELIMITER $$
//-- Procedimiento almacenado que utiliza un bucle LOOP para incrementar un contador hasta que se cumpla una condición
CREATE PROCEDURE cicloloop(p1 INT, OUT x INT)
BEGIN
    label1: LOOP
       SET p1 = p1 + 1;

       IF p1 < 10 THEN
          ITERATE label1;
       END IF;

       LEAVE label1;
    END LOOP label1;

    SET x = p1;
END
$$
DELIMITER ;

//-- Ejemplo de bucle REPEAT
DELIMITER $$
//-- Procedimiento almacenado que utiliza un bucle REPEAT para calcular la suma de los números del 1 al valor especificado por el parámetro "tope"
CREATE PROCEDURE ejemplo_bucle_repeat(IN tope INT, OUT suma INT)
BEGIN
    DECLARE contador INT;
    SET contador = 1;
    SET suma = 0;

    REPEAT
        SET suma = suma + contador;
        SET contador = contador + 1;
    UNTIL contador > tope;
END
$$
DELIMITER ;

//-- Ejemplo de bucle WHILE
DELIMITER $$
//-- Procedimiento almacenado que utiliza un bucle WHILE para calcular la suma de los números del 1 al valor especificado por el parámetro "tope"
CREATE PROCEDURE ejemplo_bucle_while(IN tope INT, OUT suma INT)
BEGIN
    DECLARE contador INT;
    SET contador = 1;
    SET suma = 0;

    WHILE contador <= tope DO
        SET suma = suma + contador;
        SET contador = contador + 1;
    END WHILE;
END
$$
DELIMITER ;
CALL ejemplo_bucle_while(10, @resultado);
SELECT @resultado;

//-- Cambia el delimitador de comandos a "$$" en lugar de ";"
DELIMITER $$

//-- Crea el trigger "before_insert_employee"
CREATE TRIGGER before_insert_employee
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    //-- Acción: Establecer la fecha y hora actual como fecha de creación
    SET NEW.creation_date = NOW();
    //-- Acción: Establecer la fecha y hora actual como fecha de actualización
    SET NEW.updated_date = NOW();
    //-- Acción: Establecer el estado como "Activo"
    SET NEW.status = 'Activo';
END$$

//-- Restaura el delimitador de comandos a ";" por defecto
DELIMITER ;

//-- DELIMITER $$: Cambia el delimitador de comandos a "$$" en lugar del punto y coma ";" para permitir la definición del trigger como un bloque de código independiente.

//-- CREATE TRIGGER before_insert_employee: Crea el trigger llamado "before_insert_employee".

//-- BEFORE INSERT ON employees: Especifica que el trigger se activa antes de cada inserción en la tabla "employees".

//-- FOR EACH ROW: Indica que el trigger se ejecuta para cada fila afectada por la operación de inserción.

//-- BEGIN: Indica el inicio del bloque de código del trigger.

//-- SET NEW.creation_date = NOW();: Establece la columna "creation_date" de la nueva fila que se va a insertar con la fecha y hora actuales utilizando la función NOW().

//-- SET NEW.updated_date = NOW();: Establece la columna "updated_date" de la nueva fila que se va a insertar con la fecha y hora actuales utilizando la función NOW().

//-- SET NEW.status = 'Activo';: Establece la columna "status" de la nueva fila que se va a insertar con el valor "Activo".

//-- END$$: Indica el final del bloque de código del trigger.

//-- DELIMITER ;: Restaura el delimitador de comandos a ";" por defecto.


-- Cambia el delimitador de comandos a "$$" en lugar de ";"
DELIMITER $$

-- Creación del trigger "BEFORE INSERT clientes_BI_TRIGGER"
CREATE TRIGGER clientes_BI_TRIGGER
BEFORE INSERT ON clientes
FOR EACH ROW
BEGIN
    -- Acción: Verificar si el valor de la nota es negativo y establecerlo en 0
    IF NEW.nota < 0 THEN
        SET NEW.nota = 0; -- Establece el valor de la nota en 0
    END IF;

    -- Acción: Verificar si el valor de la nota es mayor que 50 y establecerlo en 50
    IF NEW.nota > 50 THEN
        SET NEW.nota = 50; -- Establece el valor de la nota en 50
    END IF;
END$$


//-- Before INSERT
DELIMITER $$: Se cambia el delimitador de comandos a "$$" en lugar del punto y coma ";" para permitir la definición del trigger como un bloque de código independiente.

CREATE TRIGGER clientes_BI_TRIGGER: Se crea el trigger llamado "clientes_BI_TRIGGER".

BEFORE INSERT ON clientes: Se especifica que el trigger se activará antes de cada inserción en la tabla "clientes".

FOR EACH ROW: Indica que el trigger se ejecutará una vez por cada fila afectada por la operación de inserción.

BEGIN: Marca el inicio del bloque de código que se ejecutará cuando se active el trigger.

IF NEW.nota < 0 THEN: Se verifica si el valor de la columna "nota" en la nueva fila que se va a insertar es menor que 0.

SET NEW.nota = 0;: Si el valor de la columna "nota" es menor que 0, se establece el valor de "nota" en 0.

END IF;: Marca el final de la estructura condicional "IF".

IF NEW.nota > 50 THEN: Se verifica si el valor de la columna "nota" en la nueva fila que se va a insertar es mayor que 50.

SET NEW.nota = 50;: Si el valor de la columna "nota" es mayor que 50, se establece el valor de "nota" en 50.

END IF;: Marca el final de la estructura condicional "IF".

END$$: Indica el final del bloque de código del trigger.

DELIMITER ;: Se restaura el delimitador de comandos a ";" por defecto.

Argumentación:

Este trigger "BEFORE INSERT clientes_BI_TRIGGER" se ejecuta antes de cada inserción en la tabla "clientes" y tiene dos acciones específicas:

Acción: Verificar si el valor de la columna "nota" en la nueva fila es negativo y establecerlo en 0.

Si el valor de "nota" en la nueva fila es menor que 0, se establece el valor de "nota" en 0 para asegurarse de que no haya valores negativos en la columna "nota".
Acción: Verificar si el valor de la columna "nota" en la nueva fila es mayor que 50 y establecerlo en 50.

Si el valor de "nota" en la nueva fila es mayor que 50, se establece el valor de "nota" en 50 para asegurarse de que no haya valores superiores a 50 en la columna "nota".
Estas acciones garantizan que los valores de la columna "nota" estén dentro del rango válido (0 a 50) antes de realizar la inserción en la tabla "clientes".

.........



 //--Límites de uso :
/*El rendimiento de un SGBD puede disminuir cuando hay un aumento en el volumen de peticiones al servidor, la cantidad de usuarios conectados y la ejecución de consultas complejas. Para solucionar este problema, se pueden establecer límites en las peticiones que los usuarios realizan al servidor. Estos límites se definen mediante tres parámetros:

Máximo número de conexiones por hora.
Máximo número de consultas por hora.
Máximo número de actualizaciones por hora.
Aquí se muestra la sintaxis del comando para establecer estos límites para un usuario:*/

sql
Copy code
GRANT USAGE ON *.* TO 'usuario'@'localhost'
  WITH MAX_CONNECTIONS_PER_HOUR <cantidad>
       MAX_QUERIES_PER_HOUR <cantidad>
       MAX_UPDATES_PER_HOUR <cantidad>;
Donde:

'usuario'@'localhost' es el nombre de usuario y la ubicación desde donde se realiza la conexión. Puedes ajustar esto según tus necesidades.
<cantidad> es el número máximo permitido de conexiones, consultas y actualizaciones por hora que deseas establecer para el usuario.
Ejemplo 1:
Si deseas limitar el usuario 'campus'@'localhost' a 100 conexiones por hora, 500 consultas por hora y 200 actualizaciones por hora, el comando sería:

sql
Copy code
GRANT USAGE ON *.* TO 'campus'@'localhost'
  WITH MAX_CONNECTIONS_PER_HOUR 100
       MAX_QUERIES_PER_HOUR 500
       MAX_UPDATES_PER_HOUR 200;
6.4.10. Eliminar privilegios
Para eliminar los privilegios que se han otorgado a un usuario con el comando GRANT, se utiliza el comando REVOKE. La sintaxis del comando REVOKE es la siguiente:

css
Copy code
REVOKE [tipo_privilegio [, ...]] ON objeto
    FROM usuario [, ...];
Donde:

[tipo_privilegio [, ...]] hace referencia a los tipos de privilegios que se desean revocar. Puede ser uno o varios, separados por comas. Si se omite, se revocarán todos los privilegios.
objeto se refiere al objeto de la base de datos al que se aplicará la revocación. Puede ser una tabla, una vista, una base de datos, etc. Si se utiliza ., se aplicará a todos los objetos de todas las bases de datos.
usuario [, ...] son los nombres de usuario a los que se les revocarán los privilegios. Puede ser uno o varios, separados por comas.
Ejemplo 1:
El comando SQL:

sql
Copy code
REVOKE SELECT, INSERT ON idioma
    FROM user1, user2;
Este comando revocaría los privilegios de SELECT e INSERT en la tabla "idioma" para los usuarios "user1" y "user2".

Ejemplo 2:
El comando SQL:

sql
Copy code
REVOKE ALL ON *.*
    FROM visitante@localhost;
Este comando revocaría todos los privilegios de todas las tablas y bases de datos al usuario "visitante". Hay que tener en cuenta que solo revocaría los privilegios cuando este usuario se conecta desde localhost. Si el usuario "visitante" tiene permisos para conectarse desde otro dominio, sus privilegios seguirían intactos después de ejecutar el comando anterior.

6.4.11. Eliminar Usuarios
Para eliminar un usuario, se utiliza el comando DROP USER. La sintaxis del comando es la siguiente:

sql
Copy code
DROP USER [IF EXISTS] usuario [, usuario2, ...];
Donde:

usuario es el nombre del usuario que se desea eliminar.
IF EXISTS es una cláusula opcional que indica que el comando debe ejecutarse solo si el usuario existe.

Ejemplo 1:
Si se quiere eliminar el usuario "visitante", se ejecuta el siguiente comando:
DROP USER IF EXISTS visitante;

 