const express = require("express");
const path = require("path");
const mysql = require("mysql2");

const app = express();
const PORT = process.env.PORT || 3000;

// Middlewares
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, "public")));

// MySQL connection (Railway)
const db = mysql.createConnection({
  host: process.env.MYSQL_HOST,
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASSWORD,
  database: process.env.MYSQL_DATABASE,
  port: process.env.MYSQL_PORT
});

db.connect(err => {
  if (err) {
    console.error("MySQL connection error:", err.message);
  } else {
    console.log("Connected to MySQL");
  }
});

app.get("/", (req, res) => {
  res.send("Servidor funcionando correctamente en Railway");
});

app.get("/test-db", (req, res) => {
  db.query("SELECT 1", err => {
    if (err) return res.status(500).json({ ok: false, error: err.message });
    res.json({ ok: true });
  });
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
