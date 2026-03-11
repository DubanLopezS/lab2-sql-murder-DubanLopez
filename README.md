# lab2-sql-murder-FlorindaMeza


## Datos

* **Detective**: Duban Lopez Sanchez
* **Correo**: duban.lopezs@udea.edu.co


## Resumen del Caso

El asesinato fue cometido por Jeremy Bowers, quien confesó haber sido contratado para llevar a cabo el crimen. Durante la investigación se descubrió que él no actuó por cuenta propia, sino que fue contratado por una mujer adinerada.


## Bitácora de Investigación

### Query 1
```sql
SELECT * FROM crime_scene_report
WHERE city LIKE "%SQL City%" AND date = 20180115
```
**Evidencia**
![Nos centramos en el segundo testigo ya que tenemos información de esa persona](evidencia/1_ReporteAsesinato.png)

> **Conclusión**
> Se buscaron los crimenes relacionados con la fecha y ciudad, y se encontró que habian dos testigos.


### Query 2
```sql
SELECT * FROM person 
WHERE name LIKE "%Annabel%" and address_street_name LIKE "%Franklin%"
```
**Evidencia**
Encontré información personal de esta testigo.
![](evidencia/2_InfTestigo.png)

## Conclusion
Encontré información personal de esta testigo la cual nos permite avanzar en la investigación.