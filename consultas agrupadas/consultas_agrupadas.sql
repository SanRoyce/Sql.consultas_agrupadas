/*Pregunta Nº 1 ● ¿Cuántos registros hay? */

{Function: SELECT COUNT(*) FROM INSCRITOS;}

'R: 16 registros en la tabla'

/*Pregunta Nº 2 ● ¿Cuántos inscritos hay en total? */

{Function: SELECT sum(cantidad) FROM INSCRITOS;}

'R: 774 inscritos en la total'

/*Pregunta Nº 3 ● ¿Cuál o cuáles son los registros de mayor antigüedad? */

{Function: SELECT fecha FROM INSCRITOS order by fecha ASC;}

'R: los 2 registros más antiguos son en la fecha 01/01/2021'

/*Pregunta Nº 4 ● ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de
ahora en adelante) */

{Function: SELECT DISTINCT(fecha), SUM(cantidad) FROM INSCRITOS GROUP by fecha;}

'R: 01/01/2021 = 100, 01/02/2021 = 120, 01/03/2021 = 103, 01/04/2021 = 93, 01/05/2021 = 88, 01/06/2021 = 30, 01/07/2021 = 58, 01/08/2021 = 182'

/*Pregunta Nº 5 ● ¿Cuántos inscritos hay por fuente? */

{Function: SELECT DISTINCT(fuente), SUM(cantidad) from INSCRITOS GROUP by fuente;}

'R: Blog = 333 y Página = 441'

/*Pregunta Nº 6 ● ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se
inscribieron en ese día? */

{Function: SELECT DISTINCT(fecha), SUM(cantidad) FROM INSCRITOS GROUP by fecha
           ORDER BY SUM(cantidad) DESC LIMIT 3;}

'R: El 01/08/2021 se inscribieron la mayor cantidad de personas con un total de 182'

/*Pregunta Nº 7 ●  ¿Qué días se inscribieron la mayor cantidad de personas utilizando el blog y cuántas
personas fueron? */

{Function: SELECT * FROM INSCRITOS WHERE cantidad = (SELECT MAX(cantidad) FROM INSCRITOS WHERE fuente = 'Blog');}

'R: El 01/08/2021 se inscribieron la mayor cantidad de personas utilizando el blog'

/*Pregunta Nº 8 ● ¿Cuántas personas en promedio se inscriben en un día? */

{Function: SELECT AVG(total_por_dia) FROM (SELECT fecha, SUM(cantidad) as total_por_dia FROM INSCRITOS GROUP by fecha);}

'R: en promedio se inscriben 96.75 personas en un día'

/*Pregunta Nº 9 ● ¿Qué días se inscribieron más de 50 personas? */

{Function: SELECT fecha, SUM(cantidad) FROM INSCRITOS 
           GROUP by fecha 
           HAVING SUM(cantidad) > 50;}

'R: 01/01/2021, 01/02/2021, 01/03/2021, 01/04/2021, 01/05/2021, 01/07/2021, 01/08/2021'

/*Pregunta Nº 10 ● ¿Cuántas personas se registraron en promedio cada día a partir del tercer día? */

{Function: SELECT AVG(cantidad), fecha FROM INSCRITOS WHERE fecha >= '01/03/2021' GROUP BY fecha ORDER BY fecha asc;}

'R: 01/03/2021 = 51.5, 01/04/2021 = 46.5, 01/05/2021 = 44, 01/06/2021 = 15, 01/07/2021 = 29, 01/08/2021 = 91'