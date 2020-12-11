const db = require("../models");
const Consulta = db.consultas;
const Op = db.Sequelize.Op;

// Create and Save a new consulta
exports.create = (req, res) => {

  // Create a consulta
  const consulta = {
    nombre: req.body.nombre,
    apellidos: req.body.apellidos,
    edad: req.body.edad,
    genero: req.body.genero,
    email: req.body.email,
    profesion: req.body.profesion,
    ciudad: req.body.ciudad,
    renta_total: req.body.renta_total,
    disponible_alquiler: req.body.disponible_alquiler,
    entorno_ciudad: req.body.entorno_ciudad,
    preferencia_clima: req.body.preferencia_clima,
    preferencia_costevida: req.body.preferencia_costevida,
    seguro_salud: req.body.seguro_salud,
    actividad_aire_libre: req.body.actividad_aire_libre,
    importancia_seguridad: req.body.importancia_seguridad,
    importancia_ocio: req.body.importancia_ocio
  };

  // Save consulta in the database
  Consulta.create(consulta)
    .then(data => {
      res.send(data);
    })
    .catch(err => {
      res.status(500).send({
        message:
          err.message || "Some error occurred while creating the consulta."
      });
    });
};

// Find a single consulta with an id
exports.findOne = (req, res) => {
  const id = req.params.id;

  Consulta.findByPk(id)
    .then(data => {
      res.send(data);
    })
    .catch(err => {
      res.status(500).send({
        message: "Error retrieving consulta with id=" + id
      });
    });
};

// Update a Tutorial by the id in the request
exports.update = (req, res) => {
  const id = req.params.id;

  Consulta.update(req.body, {
    where: { id: id }
  })
    .then(num => {
      if (num == 1) {
        res.send({
          message: "Tutorial was updated successfully."
        });
      } else {
        res.send({
          message: `Cannot update Tutorial with id=${id}. Maybe Tutorial was not found or req.body is empty!`
        });
      }
    })
    .catch(err => {
      res.status(500).send({
        message: "Error updating Tutorial with id=" + id
      });
    });
};
