module.exports = {
    HOST: "localhost",
    USER: "kiriuser",
    PASSWORD: "kiripass",
    DB: "kiriweb",
    dialect: "mysql",
    pool: {
      max: 5,
      min: 0,
      acquire: 30000,
      idle: 10000
    }
  };
