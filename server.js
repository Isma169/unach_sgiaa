// ================= IMPORTS =================
console.log("🔥 SERVER INICIANDO...");

const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");
const multer = require("multer");
const fs = require("fs");
const nodemailer = require("nodemailer");
const path = require("path");

const app = express();
const PORT = process.env.PORT || 3000;

// ================= MIDDLEWARE =================
app.use(cors());
app.use(express.json());

// LOG DE REQUESTS
app.use((req, res, next) => {
  console.log("➡️", req.method, req.url);
  next();
});

// ================= MYSQL (RAILWAY) =================
if (!process.env.MYSQL_URL) {
  console.error("❌ MYSQL_URL no definida en Railway");
  process.exit(1);
}

const db = mysql.createPool(process.env.MYSQL_URL);

db.getConnection((err, conn) => {
  if (err) {
    console.error("❌ MySQL error:", err.message);
  } else {
    console.log("✅ Connected to MySQL (Railway)");
    conn.release();
  }
});

// ================= MAIL =================
const transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: process.env.MAIL_USER,
    pass: process.env.MAIL_PASS,
  },
});

// ================= UPLOADS =================
const publicPath = path.join(__dirname, "public");
const uploadDir = path.join(publicPath, "uploads");

if (!fs.existsSync(uploadDir)) {
  fs.mkdirSync(uploadDir, { recursive: true });
  console.log("📁 Carpeta uploads creada");
}

const storage = multer.diskStorage({
  destination: uploadDir,
  filename: (req, file, cb) =>
    cb(null, Date.now() + "-" + file.originalname),
});
const upload = multer({ storage });

// =================================================
// ===================== API =======================
// =================================================

// ---------- LOGIN ----------
app.post("/api/login", (req, res, next) => {
  const { correo, password } = req.body;

  db.query(
    "SELECT * FROM usuarios WHERE correo=? AND password=?",
    [correo, password],
    (err, r) => {
      if (err) return next(err);
      if (!r.length)
        return res.status(401).json({ mensaje: "Credenciales incorrectas" });

      const u = r[0];
      if (u.rol !== "admin" && u.es_verificado === 0)
        return res.status(401).json({ mensaje: "Cuenta no verificada" });

      res.json({ mensaje: "Login exitoso", usuario: u });
    }
  );
});

// ---------- USUARIOS ----------
app.post("/api/usuarios", (req, res, next) => {
  const { nombre, correo, password, rol } = req.body;
  if (!nombre || !correo || !password || !rol)
    return res.status(400).json({ mensaje: "Datos incompletos" });

  const codigo = Math.floor(100000 + Math.random() * 900000).toString();

  db.query(
    "INSERT INTO usuarios (nombre,correo,password,rol,codigo_verificacion,es_verificado) VALUES (?,?,?,?,?,0)",
    [nombre, correo, password, rol, codigo],
    (err) => {
      if (err) {
        if (err.code === "ER_DUP_ENTRY")
          return res.status(400).json({ mensaje: "Correo ya registrado" });
        return next(err);
      }

      transporter.sendMail(
        {
          from: "SGIAAIR",
          to: correo,
          subject: "Código de Verificación",
          html: `<h3>Tu código es <b>${codigo}</b></h3>`,
        },
        () => {}
      );

      res.json({ mensaje: "Código enviado", correo });
    }
  );
});

app.post("/api/verificar", (req, res, next) => {
  const { correo, codigo } = req.body;

  db.query(
    "SELECT * FROM usuarios WHERE correo=? AND codigo_verificacion=?",
    [correo, codigo],
    (err, r) => {
      if (err) return next(err);
      if (!r.length)
        return res.status(400).json({ mensaje: "Código incorrecto" });

      db.query(
        "UPDATE usuarios SET es_verificado=1 WHERE correo=?",
        [correo],
        () => res.json({ mensaje: "Cuenta verificada" })
      );
    }
  );
});

app.get("/api/usuarios", (req, res, next) => {
  db.query("SELECT * FROM usuarios", (err, r) => {
    if (err) return next(err);
    res.json(r || []);
  });
});

// ---------- MATERIAS ----------
app.get("/api/materias", (req, res, next) => {
  db.query("SELECT * FROM materias", (err, r) => {
    if (err) return next(err);
    res.json(r || []);
  });
});

// ---------- REPOSITORIO ----------
app.get("/api/repositorio", (req, res, next) => {
  db.query(
    `SELECT r.*, IFNULL(u.nombre,'Desconocido') autor
     FROM repositorio r LEFT JOIN usuarios u ON r.usuario_id=u.id
     ORDER BY r.id DESC`,
    (err, r) => {
      if (err) return next(err);
      res.json(r || []);
    }
  );
});

app.post("/api/repositorio", upload.single("archivo"), (req, res, next) => {
  if (!req.file)
    return res.status(400).json({ mensaje: "Archivo requerido" });

  db.query(
    "INSERT INTO repositorio (titulo,nombre_archivo,usuario_id) VALUES (?,?,?)",
    [req.body.titulo, req.file.filename, req.body.usuario_id],
    (err) => {
      if (err) return next(err);
      res.json({ mensaje: "Archivo subido" });
    }
  );
});

// ---------- STATS ----------
app.get("/api/stats", (req, res, next) => {
  db.query(
    "SELECT rol,COUNT(*) total FROM usuarios GROUP BY rol",
    (err, r) => {
      if (err) return next(err);
      const s = { admin: 0, docente: 0, estudiante: 0 };
      if (r) r.forEach((x) => (s[x.rol] = x.total));
      res.json(s);
    }
  );
});

// ================= FRONTEND =================
console.log("📂 Sirviendo frontend desde:", publicPath);
app.use(express.static(publicPath));

app.get("/", (req, res) => {
  res.sendFile(path.join(publicPath, "login.html"));
});

app.get(/^\/(?!api).*/, (req, res) => {
  res.sendFile(path.join(publicPath, "login.html"));
});

// ================= ERROR HANDLER =================
app.use((err, req, res, next) => {
  console.error("🔥 ERROR GLOBAL:", err.message);
  res.status(500).json({
    error: "Error interno del servidor",
    detalle: err.message,
  });
});

// ================= LISTEN =================
app.listen(PORT, "0.0.0.0", () => {
  console.log(`🚀 SGIAAIR corriendo en puerto ${PORT}`);
});
