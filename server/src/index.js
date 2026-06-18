const express = require("express");
const cors = require("cors");

// SQLite setup (tables will be added later)
const db = require("../database/db");

const app = express();

app.use(cors());
app.use(express.json());

app.get("/", (req, res) => {
    res.send("Mosaic server is running");
});

app.listen(3000, () => {
    console.log("Server running on http://localhost:3000");
});