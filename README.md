# Equipo KIRIBATI 
* [Lluis LLoret](https://github.com/luisllll)
* [Marco Colapietro](https://github.com/Marcolapietro)
* [Gonzalo  Alberola](https://github.com/GonzaloAP97)
* [Marta Álvarez](https://github.com/maalal)
* [Borja Ponz](https://github.com/fbponz)

# kiribati-dp1
Edem Kiribati-dp1

Una start up capaz de elegir la ciudad ideal para el cliente en función de criterios objetivos y personales. 

Un match entre tú y la ciudad que mejor encaja contigo. 

Para ejecutar el sistema del MVP es necesario descargar el repositorio y mediante el uso de la terminal consola, Lanzar el siguiente comando, debemos esperar unos minutos hasta que el sistema acabe de inicializar.

    $ docker-compose up -d

Una vez se ha terminado de trabajar se recomienda parar el contenedor haciendo un 

    $ docker-compose down

En caso de que tengas una versión previa se recomienda hacer despues de cada pull el siguiente comando

    $ docker-compose build

<br>

# Solución MVP
Para dar solución al MVP de este data project 1, se ha planteado implementar un formulario en una pagina web y ser capaces de proponer una ciudad al usuario. 

La información necesaria para acceder a cada uno de los elementos que componen este MVP están detallados a continuación.
<br>

## Arquitectura 
La pagina web escribe los datos sobre una base datos (postgreSQL), se espera que se modifique poco a lo largo del proyecto. <br>
Después se ha implementado un panel de bussines intelligence utilizando la herramienta metabase, con el objetivo de poder ofrecer datos interesantes al gestor del negocio.
Nuestra solución contiene los siguientes elementos
<br>
<img src="images/arquitecutraDP1_Kiribati.png"/>
<br>

## Pagina web

Se puede acceder a la pagina web desde el navegador mediante la siguiente dirección http://localhost:80
<br>
<br>

## Esquema base de datos
Para la implementación de la base de datos se ha elegido postgreSQL, el motivo principal de esta elección es que debido a que nuestros datos de entrada, provienen de un formulario definido por nosotros
Para la solución implentada se ha utilizado el siguiente esquema de base de datos.
<br>
<img src="images/Database_Tables.png"/>

<br><br>

## Base de datos 
la base de datos postgreSQL está mapeada en el puerto 5432
<br>
| Base de datos |  kiriweb|
| :------------- | -----------: |
| Usuario      | kiriuser     |
|  Contraseña | kiripass    |
<br>
<br>

## Pgadmin panel
Para acceder al gestor de la base de datos PGADMIN debe hacer desde el navegador en la siguiente dirección <http://localhost:5050>
<br>
| E-mail      | kiribati@kiriweb.org    |
| :------------- | -----------: |
| Password | Kiripass |   
<br>
<br>


## Panel de Business Intelligence
Para acceder al panel de business Intelligence se utilizar la siguiente dirección desde el navegador http://localhost:3000
<br>
| E-mail      | kiribati@kiriweb.org    |
| :------------- | -----------: |
| Password | kiripass1 |   

<br>

# Kiribati Team
