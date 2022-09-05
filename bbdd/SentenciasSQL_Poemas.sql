--1. Crear una consulta de inserción de la información en una tabla cualquiera.
INSERT INTO USERS
VALUES (11, 'Manuel', 'Burrell Osanz', 'miemail@gmail.no', 'asdfg')
; 

--2. Crear una consulta de actualización de la información de una tabla cualquiera.
UPDATE USERS
SET user_name = 'Roberto', user_password = 'zxcv'
WHERE user_surname= 'Garcia Orondo'
;

--3. Crear una consulta que muestre un listado agrupado de toda o parte de la información almacenada.
SELECT * FROM REVIEWS
GROUP BY review_rating;

--4. Crear una consulta que muestre, mediante una combinación externa, un listado con toda la información de una tabla principal que no tenga información relacionada en una tabla secundaria.
SELECT * FROM AUTHORS d
LEFT JOIN BOOKS e
ON d.id_author = e.id_author
;

--5. Crear una consulta que muestre un listado de registros que contengan una determinada cadena en un campo de tu elección.
SELECT * FROM USERS
WHERE user_surname LIKE '%Rubio%'
;
