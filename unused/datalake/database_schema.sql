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

INSERT INTO mytable(ciudad,cuantia_media_arrendamiento,indice_ipc,tasa_de_criminalidad,profesionales_de_atencion_primaria,temperatura,cultura,deporte,altitud_respecto_marr,km_centro_playa,porcentajes_zv,bares,temperatura_rank,cma_rank,ipc_rank,criminalidad_rank,prof_ap_rank,cultura_rank,deporte_rank,zonas_verdes_rank,distancia_playa_rank,bares_rank) VALUES ('Palma de Mallorca',687,'104,9','62,7','1,47','16,8',74,'0,18',24,'17,5','9,95','19','0,666666667','0,5','0,333333333','0,916666667','0,166666667','0,333333333','0,166666667','0,833333333','0,666666667','1');
INSERT INTO mytable(ciudad,cuantia_media_arrendamiento,indice_ipc,tasa_de_criminalidad,profesionales_de_atencion_primaria,temperatura,cultura,deporte,altitud_respecto_marr,km_centro_playa,porcentajes_zv,bares,temperatura_rank,cma_rank,ipc_rank,criminalidad_rank,prof_ap_rank,cultura_rank,deporte_rank,zonas_verdes_rank,distancia_playa_rank,bares_rank) VALUES ('Barcelona',769,'105,81','62,7','2,03','16,5',483,'0,88',13,'1,8','4,42','14,1','0,5','0,833333333','1','0,916666667','1','0,916666667','0,666666667','0,5','0,333333333','0,833333333');
INSERT INTO mytable(ciudad,cuantia_media_arrendamiento,indice_ipc,tasa_de_criminalidad,profesionales_de_atencion_primaria,temperatura,cultura,deporte,altitud_respecto_marr,km_centro_playa,porcentajes_zv,bares,temperatura_rank,cma_rank,ipc_rank,criminalidad_rank,prof_ap_rank,cultura_rank,deporte_rank,zonas_verdes_rank,distancia_playa_rank,bares_rank) VALUES ('San Sebastian',730,'105,41','41,5','1,87','14,5',46,'0,96',12,'0,75','10,87','10,7','0,333333333','0,666666667','0,833333333','0,333333333','0,666666667','0,166666667','0,833333333','1','0,166666667','0,666666667');
INSERT INTO mytable(ciudad,cuantia_media_arrendamiento,indice_ipc,tasa_de_criminalidad,profesionales_de_atencion_primaria,temperatura,cultura,deporte,altitud_respecto_marr,km_centro_playa,porcentajes_zv,bares,temperatura_rank,cma_rank,ipc_rank,criminalidad_rank,prof_ap_rank,cultura_rank,deporte_rank,zonas_verdes_rank,distancia_playa_rank,bares_rank) VALUES ('Madrid',819,'105,29','59,2','1,52','13,7',483,'2,01',655,'370','3,8','10,6','0,166666667','1','0,666666667','0,666666667','0,333333333','0,916666667','1','0,166666667','1','0,5');
INSERT INTO mytable(ciudad,cuantia_media_arrendamiento,indice_ipc,tasa_de_criminalidad,profesionales_de_atencion_primaria,temperatura,cultura,deporte,altitud_respecto_marr,km_centro_playa,porcentajes_zv,bares,temperatura_rank,cma_rank,ipc_rank,criminalidad_rank,prof_ap_rank,cultura_rank,deporte_rank,zonas_verdes_rank,distancia_playa_rank,bares_rank) VALUES ('Sevilla',456,'104,8','39,8','1,79','18,6',96,'0,45',11,'97,7','9,41','3','1','0,166666667','0,166666667','0,166666667','0,5','0,5','0,333333333','0,666666667','0,833333333','0,333333333');
INSERT INTO mytable(ciudad,cuantia_media_arrendamiento,indice_ipc,tasa_de_criminalidad,profesionales_de_atencion_primaria,temperatura,cultura,deporte,altitud_respecto_marr,km_centro_playa,porcentajes_zv,bares,temperatura_rank,cma_rank,ipc_rank,criminalidad_rank,prof_ap_rank,cultura_rank,deporte_rank,zonas_verdes_rank,distancia_playa_rank,bares_rank) VALUES ('Valencia',556,'104,98','46,8','1,9','17,4',148,'0,56',15,'7','4,07','2,1','0,833333333','0,333333333','0,5','0,5','0,833333333','0,666666667','0,5','0,333333333','0,5','0,166666667');