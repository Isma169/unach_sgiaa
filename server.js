const express = require("express");
const mysql = require("mysql2");
const app = express();

const PORT = process.env.PORT || 8080;

app.use(express.json());

// ✅ MySQL POOL (esto arregla el timeout)
const pool = mysql.createPool({
  host: process.env.MYSQL_HOST,
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASSWORD,
  database: process.env.MYSQL_DATABASE,
  port: process.env.MYSQL_PORT,
  waitForConnections: true,
  connectionLimit: 5,
  queueLimit: 0
});

// ✅ Test simple (Railway necesita respuesta rápida)
app.get("/", (req, res) => {
  res.send("Servidor OK 🚀");
});

// ✅ Test DB SEGURO (nunca cuelga)
app.get("/test-db", async (req, res) => {
  pool.query("SELECT 1", (err) => {
    if (err) {
      console.error("DB error:", err.message);
      return res.status(500).json({ ok: false });
    }
    res.json({ ok: true });
  });
});

// 🚀 IMPORTANTE: escuchar en PORT
app.listen(PORT, "0.0.0.0", () => {
  console.log(`🚀 Server running on port ${PORT}`);
});
