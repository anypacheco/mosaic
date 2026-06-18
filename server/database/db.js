const Database = require("better-sqlite3");

const db = new Database("mosaic.db");

module.exports = db;