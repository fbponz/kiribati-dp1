# kiribati-dp1
Edem Kiribati-dp1

Una start up capaz de elegir la ciudad ideal para el cliente en función de criterios objetivos y personales. 

Un match entre tú y la ciudad que mejor encaja contigo 

Para ejecutar el sistema del MVP es necesario descargar el repositorio y mediante el uso de la terminal consola, Lanzar el siguiente comando.

    $ docker-compose up -d

Una vez se ha terminado de trabajar se recomienda parar el contenedor haciendo un 

    $ docker-compose down

<br>

## Solución MVP
<br>

### Pagina web

Se puede acceder a la pagina web desde -> http://localhost:80
<br>

### Ingestión datos
se puede acceder al pnale de nifi -> http://localhost:8080
si se desea acceder al fichero que hay que ingestar kiridata_ranks.csv se encuentra en la
ruta local

    /home/nifi/
    
<br>

### Base de datos 
la base de datos postgres está mapeada en el puerto 5432
| Base de datos |  kiriweb|
| :------------- | -----------: |
| Usuario      | kiriuser     |
|  Contraseña | kiripass    |
<br>

### Pgadmin panel
pgadmin -> <http://localhost:5050>
| E-mail      | kiribati@kiriweb.org    |
| :------------- | -----------: |
| Password | Kiripass |   

### Panel de Business Intelligence

metabase -> http://localhost:3000

<br>

## Equipo KIRIBATI 
* Lluis LLoret
* Marco Colapietro
* Gonzalo  Alberola
* Marta Álvarez
* Borja Ponz
