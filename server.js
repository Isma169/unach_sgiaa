const express = require("express");
const path = require("path");
const mysql = require("mysql2");

const app = express();
const PORT = process.env.PORT || 3000;

// =====================
// Middlewares
// =====================
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, "public")));

// =====================
// Conexión MySQL (Railway)
// =====================
const db = mysql.createConnection({
  host: process.env.MYSQL_HOST,
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASSWORD,
  database: process.env.MYSQL_DATABASE,
  port: process.env.MYSQL_PORT
});

// Conectar SIN romper la app
db.connect((err) => {
  if (err) {
    console.error("❌ Error conectando a MySQL:", err.message);
  } else {
    console.log("✅ Conectado a MySQL correctamente");
  }
});

// =====================
// Rutas
// =====================
app.get("/", (req, res) => {
  res.send("🚀 Servidor funcionando en Railway");
});

// Ruta de prueba BD
app.get("/test-db", (req, res) => {
  db.query("SELECT 1", (err, results) => {
    if (err) {
      return res.status(500).json({
        ok: false,
        error: err.message
      });
    }
    res.json({
      ok: true,
      message: "Conexión a MySQL OK"
    });
  });
});

// =====================
// Iniciar servidor
// =====================
app.listen(PORT, () => {
  console.log(`✅ Servidor corriendo en puerto ${PORT}`);
});


