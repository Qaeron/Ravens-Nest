--1. Crear una consulta de inserci�n de la informaci�n en una tabla cualquiera.
INSERT INTO USERS
VALUES (11, 'Manuel', 'Burrell Osanz', 'miemail@gmail.no', 'asdfg')
; 

--2. Crear una consulta de actualizaci�n de la informaci�n de una tabla cualquiera.
UPDATE USERS
SET user_name = 'Roberto', user_password = 'zxcv'
WHERE user_surname= 'Garcia Orondo'
;

--3. Crear una consulta que muestre un listado agrupado de toda o parte de la informaci�n almacenada.
SELECT * FROM REVIEWS
GROUP BY review_rating;

--4. Crear una consulta que muestre, mediante una combinaci�n externa, un listado con toda la informaci�n de una tabla principal que no tenga informaci�n relacionada en una tabla secundaria.
SELECT * FROM AUTHORS d
LEFT JOIN BOOKS e
ON d.id_author = e.id_author
;

--5. Crear una consulta que muestre un listado de registros que contengan una determinada cadena en un campo de tu elecci�n.
SELECT * FROM USERS
WHERE user_surname LIKE '%Rubio%'
;
