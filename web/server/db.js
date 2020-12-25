const Pool = require("pg").Pool;

const pool = new Pool({
    user: "kiriuser",
    password: "kiripass",
    host: "postgres",
    port: 5432,
    database: "kiriweb"
});

module.exports = pool;