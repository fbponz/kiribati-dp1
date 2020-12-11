module.exports = (sequelize, Sequelize) => {
  const consulta = sequelize.define("consulta", {
    nombre: {
      type: Sequelize.STRING
    },
    apellidos: {
      type: Sequelize.STRING
    },
    edad: {
      type: Sequelize.INTEGER
    },
    genero: {
      type: Sequelize.STRING
    },
    email: {
      type: Sequelize.STRING
    },
    profesion: {
      type: Sequelize.STRING
    },
    ciudad: {
      type: Sequelize.STRING
    },
    renta_total: {
      type: Sequelize.INTEGER
    },
    disponible_alquiler: {
      type: Sequelize.INTEGER
    },
    entorno_ciudad: {
      type: Sequelize.STRING
    },
    preferencia_clima: {
      type: Sequelize.STRING
    },
    preferencia_costevida: {
      type: Sequelize.STRING
    },
    seguro_salud: {
      type: Sequelize.INTEGER
    },
    actividad_aire_libre: {
      type: Sequelize.INTEGER
    },
    importancia_seguridad: {
      type: Sequelize.INTEGER
    },
    importancia_ocio: {
      type: Sequelize.INTEGER
    },
  });

  return consulta;
};
