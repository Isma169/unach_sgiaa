const express = require("express");
const path = require("path");
const mysql = require("mysql2");

const app = express();
const PORT = process.env.PORT || 8080;

// Middlewares
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, "public")));

// ===============================
// MySQL connection (Railway)
// ===============================

if (!process.env.MYSQL_URL) {
  console.error("MYSQL_URL is not defined");
} 

const db = mysql.createConnection(process.env.MYSQL_URL);

db.connect((err) => {
  if (err) {
    console.error("MySQL connection error:", err.message);
  } else {
    console.log("Connected to MySQL");
  }
});

// ===============================
// Routes
// ===============================

app.get("/", (req, res) => {
  res.send("Servidor funcionando correctamente en Railway");
});

app.get("/test-db", (req, res) => {
  db.query("SELECT 1", (err) => {
    if (err) {
      return res.status(500).json({
        ok: false,
        error: err.message
      });
    }
    res.json({ ok: true });
  });
});

// ===============================
// Start server
// ===============================

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
