module.exports = app => {
    const consultas = require("../controllers/consulta.controller.js");
  
    var router = require("express").Router();
  
    // Create a new consulta
    router.post("/", consultas.create);
  
    // Retrieve a single consulta with id
    router.get("/:id", consultas.findOne);
  
    // Update a Tutorial with id
    router.put("/:id", consultas.update);

    app.use('/api/consultas', router);
  };