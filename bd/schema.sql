DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS consulta;
DROP TABLE IF EXISTS resultado;
DROP TABLE IF EXISTS feedback_resultado;
DROP TABLE IF EXISTS kiribati_dataset;

CREATE DATABASE kiriweb;

CREATE TABLE cliente(
  id_cliente int NOT NULL AUTO_INCREMENT,
  nombre VARCHAR (50),
  apellidos VARCHAR (50),
  edad VARCHAR(3),
  genero VARCHAR(10),
  email VARCHAR(50),
  profesion VARCHAR(50),
  ciudad VARCHAR(50),
  PRIMARY KEY(id_cliente)
);

CREATE TABLE consulta(
  id_consulta INT NOT NULL AUTO_INCREMENT,
  id_cliente INT,
  tiempo_consulta DATETIME,
  renta_total VARCHAR(50),
  disponible_alquiler VARCHAR(50),
  entorno_ciudad VARCHAR(50),
  preferencia_clima VARCHAR(50),
  preferencia_costevida VARCHAR(50),
  seguro_salud VARCHAR(50),
  actividad_aire_libre VARCHAR(50),
  importancia_seguridad VARCHAR(50),
  FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente),
  PRIMARY KEY(id_consulta)
);

CREATE TABLE resultado(
  id_resultado INT NOT NULL AUTO_INCREMENT,
  id_consulta INT,
  tiempo_resultado DATETIME,
  FOREIGN KEY(id_consulta) REFERENCES consulta(id_consulta),
  PRIMARY KEY(id_resultado)
);

CREATE TABLE feedback_resultado(
  id_feedback_resultado INT NOT NULL AUTO_INCREMENT,
  id_resultado INT,
  feedback VARCHAR(50), 
  tiempo_feedback DATETIME,
  FOREIGN KEY(id_resultado) REFERENCES resultado(id_resultado),
  PRIMARY KEY(id_feedback_resultado)
);

CREATE TABLE kiribati_dataset(
   ciudad                             VARCHAR(17) NOT NULL PRIMARY KEY
  ,cuantia_media_arrendamiento        INTEGER  NOT NULL
  ,indice_ipc                         VARCHAR(6) NOT NULL
  ,tasa_de_criminalidad               DATE  NOT NULL
  ,profesionales_de_atencion_primaria VARCHAR(4) NOT NULL
  ,temperatura                        VARCHAR(4) NOT NULL
  ,cultura                            INTEGER  NOT NULL
  ,deporte                            VARCHAR(4) NOT NULL
  ,altitud_respecto_marr              INTEGER  NOT NULL
  ,km_centro_playa                    VARCHAR(4) NOT NULL
  ,porcentajes_zv                     VARCHAR(5) NOT NULL
  ,bares                              VARCHAR(4) NOT NULL
  ,temperatura_rank                   VARCHAR(11) NOT NULL
  ,cma_rank                           VARCHAR(11) NOT NULL
  ,ipc_rank                           VARCHAR(11) NOT NULL
  ,criminalidad_rank                  VARCHAR(11) NOT NULL
  ,prof_ap_rank                       VARCHAR(11) NOT NULL
  ,cultura_rank                       VARCHAR(11) NOT NULL
  ,deporte_rank                       VARCHAR(11) NOT NULL
  ,zonas_verdes_rank                  VARCHAR(11) NOT NULL
  ,distancia_playa_rank               VARCHAR(11) NOT NULL
  ,bares_rank                         VARCHAR(11) NOT NULL
);
