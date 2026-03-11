-- 1. En la tabla de Informes de la escena del crimen, por medio del recuerdo de la fecha y ciudad, encontré 3 crimenes que 
--    podrian estar relacionados, centrandome en el asesinato, y evidenciando que tenemos 2 testigos.
SELECT * FROM crime_scene_report
WHERE city LIKE "%SQL City%" AND date = 20180115


-- 2. Encontré información importante del segundo testigo, como lo es el ID el cual es fundamental para encontrar más información.
SELECT * FROM person 
WHERE name LIKE "%Annabel%" and address_street_name LIKE "%Franklin%"


-- 3. Despues de estar navegando por la información suministrada gracias a los datos encontrados de la señora Anabbel (Testigo), 
--    llegué a una entrevista en la cual descubrí que ella reconocio a el asesino en el gimnasio el pasado 9 de enero de 2018.
SELECT * FROM interview
WHERE person_id = 16371


-- 4. Encontré las personas que estuvieron en el gimnasio el 9 de enero de 2018, y esto me permitió buscar más información por
--    medio de su membership_id.
SELECT * FROM get_fit_now_check_in
WHERE check_in_date = 20180109;


--    Identifique como la columna de membership_id de la tabla de get_fit_now_check_in, se relaciona con la columna id de la tabla get_fit_now_member
SELECT * FROM get_fit_now_member
WHERE id LIKE "X0643"


-- 5. Esto me permitió ver más información de las personas que estuvieron ese dia en el gimnasio, teniendo en cuenta cosas como
--    el id, el nombre, y la hora de check_in y de salida del gimnasio
SELECT * FROM get_fit_now_member 
JOIN get_fit_now_check_in 
ON get_fit_now_member.id = get_fit_now_check_in.membership_id
WHERE get_fit_now_check_in.check_in_date = 20180109;


-- 5_2.Gracias a la hora de entrada y de salida (Las personas que estuvieron mas tarde en el gimnasio), pude observar que la señora 
--     Annabel (Testigo) solo se cruzo con las ultimas 3 personas que fueron al gimnasio ese día, entonces lo que hice fue centrarme 
--     especificamente en la informacion de esas 3 personas 
SELECT * FROM get_fit_now_member 
JOIN get_fit_now_check_in 
ON get_fit_now_member.id = get_fit_now_check_in.membership_id
WHERE get_fit_now_check_in.check_in_date = 20180109
ORDER BY check_in_time DESC
LIMIT 3;


-- 6. Antes de verificar el nombre del asesino, decidí primero consultar la entrevista de ambas personas, y encontré que el principal 
--    sospechoso es la persona con id: 67318, gracias a que el lo revela y tambien teniendo en cuenta que la otra persona no contaba con entrevista
SELECT * FROM interview
WHERE person_id = 67318


-- 7. Consulté la información de esta persona
SELECT * FROM person
WHERE id = 67318


-- 8. Descubrí que Jeremy Bowers es el asesino
INSERT INTO solution VALUES (1, 'Jeremy Bowers');
SELECT value FROM solution;


-- 8_2. Para mirar quien lo contrato (Terminar el reto), busque la entrevista (De nuevo) y encontré datos que nos conducen con la sospechosa
SELECT * FROM interview
WHERE person_id = 67318


-- 9. Gracias a la información obtenido en la entrevista, encontré el nombre de la sospechosa
SELECT p.name
FROM person p
JOIN drivers_license d 
ON p.license_id = d.id
JOIN facebook_event_checkin f 
ON p.id = f.person_id
WHERE d.gender = "female"
AND d.hair_color = "red"
AND d.height BETWEEN 65 AND 67
AND d.car_model = "Model S"
AND f.event_name = "SQL Symphony Concert"
AND f.date BETWEEN 20171201 AND 20171231;


-- 10. Confirmé quien es el cerebro detras de este asesinato y cerré el caso
INSERT INTO solution VALUES (1, 'Miranda Priestly');
SELECT value FROM solution;







