/* comenzar a grabar */
/* entrar a la terminal */
/* ingresar al cliente de postgreSQL */
/* crear una base de datos llamada desafio_daniel_sanjuan_034 */
CREATE DATABASE desafio_daniel_sanjuan_034;
/* \l para verificar que la base se creó */
/* \c para conectar con la base de datos */
 \c desafio_daniel_sanjuan_034
/* SERIAL PRIMARY KEY = CLAVE PRIMARIA SERIAL*/
/* insert into = insertar en*/


CREATE TABLE clients(
   id_members SERIAL PRIMARY KEY,
   email VARCHAR(50) NOT NULL,
   name VARCHAR,
   phone VARCHAR(16),
   company VARCHAR(50),
   priority SMALLINT
);

/* seleccionar la tabla */
SELECT * from clients;

/* insertar los 5 clientes */
insert into clients(email, name, phone, company, priority)
VALUES (
'danielsanjuan034@gmail.com',
	'daniel',
	'65960893',
	'unioncoop',
	8),('fernandomuñoz@gmail.com',
	'fernando',
	'64484562',
	'armada',
	5),('enzomonsalves@gmail.com',
	'enzo',
	'85242448',
	'ibm',
	6),('cristianvenegas@gmail.com',
	'cristian',
	'59547288',
	'intel',
	3),('consueloanguita@gmail.com',
	'consuelo',
	'71345582',
	'google',
	6);

/* seleccionar los 3 clientes de mayor prioridad */

SELECT * from clients ORDER BY priority DESC limit 3;

/* seleccionar una prioridad o una empresa de forma que devuelva 2 registros */

SELECT * from clients where priority = 5 or company = 'google';