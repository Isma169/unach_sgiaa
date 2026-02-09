const express = require("express");
const mysql = require("mysql2");

const app = express();
const PORT = process.env.PORT || 8080;

// Middleware básico
app.use(express.json());

// 🔍 LOG PARA CONFIRMAR REQUESTS
app.use((req, res, next) => {
  console.log("➡️ Request:", req.method, req.url);
  next();
});

// MySQL
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
    console.log("✅ Connected to MySQL");
  }
});

// RUTA RAÍZ (CRÍTICA)
app.get("/", (req, res) => {
  res.status(200).send("🚀 SGIAAIR backend funcionando correctamente");
});

// TEST DB
app.get("/test-db", (req, res) => {
  db.query("SELECT 1", (err) => {
    if (err) {
      return res.status(500).json({ ok: false, error: err.message });
    }
    res.json({ ok: true });
  });
});

// LISTEN (OBLIGATORIO ASÍ)
app.listen(PORT, "0.0.0.0", () => {
  console.log(`🚀 Server running on port ${PORT}`);
});
