const express = require("express");
const mysql = require("mysql2");

const app = express();
const PORT = process.env.PORT || 8080;

// Middlewares básicos
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Conexión MySQL
const db = mysql.createConnection({
  host: process.env.MYSQL_HOST,
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASSWORD,
  database: process.env.MYSQL_DATABASE,
  port: process.env.MYSQL_PORT,
});

db.connect((err) => {
  if (err) {
    console.error("❌ MySQL error:", err.message);
  } else {
    console.log("✅ Connected to MySQL (Railway)");
  }
});

// RUTA RAÍZ (OBLIGATORIA)
app.get("/", (req, res) => {
  res.status(200).send("Servidor OK 🚀");
});

// Test DB
app.get("/test-db", (req, res) => {
  db.query("SELECT 1", (err) => {
    if (err) {
      return res.status(500).json({ ok: false, error: err.message });
    }
    res.json({ ok: true });
  });
});

app.listen(PORT, () => {
  console.log(`🚀 Server running on port ${PORT}`);
