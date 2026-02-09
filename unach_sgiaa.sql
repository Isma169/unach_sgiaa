create database unach_sgiaa
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-02-2026 a las 20:56:50
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `unach_sgiaa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `creditos` int(11) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `semestre` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`id`, `nombre`, `codigo`, `creditos`, `descripcion`, `semestre`) VALUES
(19, 'COMUNICACIÓN EFECTIVA', 'TIB023212', 0, NULL, 1),
(20, 'CÁLCULO EN UNA VARIABLE', 'TIB631017', 0, NULL, 1),
(21, 'FÍSICA BÁSICA', 'TIB631019', 0, NULL, 1),
(22, 'ÁLGEBRA LINEAL', 'TIB120111', 0, NULL, 1),
(23, 'SISTEMAS DIGITALES', 'TIB330424', 0, NULL, 1),
(24, 'PROGRAMACIÓN l', 'TIB120326', 0, NULL, 1),
(25, 'HABILIDADES PARA LA VIDA', 'TIB003123', 0, NULL, 2),
(26, 'ECUACIONES DIFERENCIALES', 'TIB120231', 0, NULL, 2),
(27, 'ESTRUCTURA DE DATOS', 'TIB120332', 0, NULL, 2),
(28, 'SISTEMAS OPERATIVOS', 'TIB330434', 0, NULL, 2),
(29, 'PROGRAMACIÓN ll', 'TIB120335', 0, NULL, 2),
(30, 'SISTEMAS DE COMUNICACIÓN', 'TIB332536', 0, NULL, 2),
(31, 'FUNDAMENTOS DE METODOLOGÍA DE LA INVESTIGACIÓN', 'TIB332537', 0, NULL, 3),
(32, 'MÉTODOS NUMÉRICOS', 'TIB120641', 0, NULL, 3),
(33, 'FUNDAMENTOS DE REDES', 'TIP332543', 0, NULL, 3),
(34, 'PROBABILIDAD Y ESTADÍSTICA', 'TIP120337', 0, NULL, 3),
(35, 'SISTEMAS INTERACTIVOS Y MULTIMEDIA', 'TIP220945', 0, NULL, 3),
(36, 'FUNDAMENTOS DE BASE DE DATOS', 'TIP120346', 0, NULL, 3),
(37, 'APLICACIONES WEB', 'TIP120351', 0, NULL, 4),
(38, 'INGENIERÍA EN SOFTWARE', 'TIP120352', 0, NULL, 4),
(39, 'CONMUTACIÓN Y ENRUTAMIENTO', 'TIP332553', 0, NULL, 4),
(40, 'GESTIÓN DE SERVIDORES', 'TIP330474', 0, NULL, 4),
(41, 'ADMINISTRACIÓN DE BASE DE DATOS', 'TIP120356', 0, NULL, 4),
(42, 'INTEROPERABILIDAD DE PLATAFORMAS', 'TIP120361', 0, NULL, 5),
(43, 'ESCALABILIDAD DE REDES', 'TIP332563', 0, NULL, 5),
(44, 'INTELIGENCIA ARTIFICIAL Y GESTIÓN DEL CONOCIMIENTO', 'TIP120357', 0, NULL, 5),
(45, 'INTELIGENCIA DE NEGOCIOS', 'TIP120365', 0, NULL, 5),
(46, 'EMPRENDIMIENTO PARA EL DESARROLLO INTEGRAL DEL PROFESIONAL', 'TIP041752', 0, NULL, 5),
(47, 'TÉCNICAS DE SIMULACIÓN', 'TIP120371', 0, NULL, 6),
(48, 'VIRTUALIZACIÓN', 'TIP330472', 0, NULL, 6),
(49, 'APLICACIONES PARA LA GESTIÓN DE REDES', 'TIP332581', 0, NULL, 6),
(50, 'COMPUTACIÓN MÓVIL', 'TIP330473', 0, NULL, 6),
(51, 'BASE DE DATOS AVANZADAS', 'TIP120375', 0, NULL, 6),
(52, 'AUDITORÍA INFORMÁTICA', 'TIP330486', 0, NULL, 7),
(53, 'APLICACIONES DE SOFTWARE EMPRESARIAL', 'TIP120382', 0, NULL, 7),
(54, 'SISTEMAS DE INFORMACIÓN GEOGRÁFICA', 'TIP120392', 0, NULL, 7),
(55, 'PLANIFICACIÓN DE INTEGRACIÓN CURRICULAR', 'TIC560578', 0, NULL, 7),
(56, 'INGENIERÍA DE FACTORES HUMANOS', 'TIP630794', 0, NULL, 8),
(57, 'GESTIÓN DE PROYECTOS DE TI', 'TIP531184', 0, NULL, 8),
(58, 'SEGURIDAD DE TI', 'TIP330483', 0, NULL, 8),
(59, 'TECNOLOGÍAS DE LA INFORMACIÓN', 'TIP330489', 0, NULL, 8),
(60, 'EJECUCIÓN DE INTEGRACIÓN CURRICULAR', 'TIC330488', 0, NULL, 8),
(61, 'PRÁCTICAS LABORALES', 'TIP061371', 0, NULL, 7),
(62, 'PRÁCTICAS DE SERVICIO COMUNITARIO', 'TIP061364', 0, NULL, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repositorio`
--

CREATE TABLE `repositorio` (
  `id` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `nombre_archivo` varchar(255) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `fecha_subida` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` enum('admin','docente','estudiante') DEFAULT 'estudiante',
  `fecha_registro` datetime DEFAULT current_timestamp(),
  `hoja_vida` text DEFAULT NULL,
  `codigo_verificacion` varchar(6) DEFAULT NULL,
  `es_verificado` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `correo`, `password`, `rol`, `fecha_registro`, `hoja_vida`, `codigo_verificacion`, `es_verificado`) VALUES
(76, 'Jorge Edwin Delgado Altamirano', 'jdelgado@unach.edu.ec', '12345', 'docente', '2026-02-02 13:27:10', '{\"ci\":\"0602759383\",\"fnac\":\"1975-03-04\",\"lugarnac\":\"ECUADOR\",\"domicilio\":\"AYACUCHO 3557 URUGUAY\",\"ciudad\":\"RIOBAMBA\",\"celular\":\"0987590726\",\"tlf_oficina\":\"3830880\",\"email_pers\":\"jorgedelgado75@hotmail.com\",\"formacion\":\"1. MAGISTER EN DIRECCION DE EMPRESAS MENCION PROYECTOS (ESPOCH, 2015)\\n2. INGENIERO EN SISTEMAS (ESPOCH, 2003)\",\"experiencia\":\"4.1 PROFESIONAL:\\n- DIRECTOR CENTRO DE CÓMPUTO (UNACH, 2015)\\n\\n4.3 CAPACITADOR:\\n- FACILITADOR EXCEL INTERMEDIO (2016)\\n- APLICADOR EXAMEN CEAACES (2015)\\n- FACILITADOR URKUND (2014)\\n\\n4.4 ADMINISTRATIVA:\\n- DIRECTOR CENTRO DE TECNOLOGÍAS EDUCATIVAS (2011-Actualidad)\\n- DIRECTOR CENTRO DE CÓMPUTO (2012-2015)\",\"capacitacion\":\"3.1 CURSOS UNACH:\\n- INTERNACIONALIZACIÓN DEL CURRÍCULO (2025)\\n- HERRAMIENTAS DE IA PARA LA DOCENCIA (2025)\\n- FORMACIÓN DE PARES EVALUADORES (2025)\\n- ESTRATEGIAS USO IA ESCRITURA CIENTÍFICA (2025)\\n- IA APLICADA AL DESARROLLO DE SOFTWARE (2024)\\n- ACCESO SEGURO A SISTEMAS (2024)\\n- INTERNET DE LAS COSAS (2024)\\n- BIG DATA TOMA DE DECISIONES (2023)\\n- METODOLOGÍA DE INNOVACIÓN (2023)\\n- POWER BI (2023)\\n- MICROSERVICIOS CON SPRING (2023)\\n- DESARROLLO .NET 6 (2022)\\n- HERRAMIENTAS DIGITALES INVESTIGADORES (2022)\\n- ANALÍTICA DE DATOS (2022)\\n- FORMACIÓN DOCENTE EN LÍNEA (2022)\\n- SEGURIDAD INFORMACIÓN (2021)\\n- METODOLOGÍAS ÁGILES (2020)\\n- BIG DATA (2019)\\n- QLIKTECH (2019)\\n- LATEX Y R STUDIO (2019)\\n\\n3.2 CURSOS EXTERNOS:\\n- TALLER ELABORACIÓN ARTÍCULOS (UNMSM PERÚ)\\n- MACHINE LEARNING (UNMSM PERÚ)\\n- FUNDAMENTOS INVESTIGACIÓN (UNMSM PERÚ)\\n- HP BLADE SYSTEM\\n- PMI ADMINISTRACIÓN PROYECTOS\",\"idiomas\":\"\",\"publicaciones\":\"1. PROGRAMACION BASICA EN C++ (Libro, 2024)\\nLink: https://scholar.google.com/scholar?q=PROGRAMACION+BASICA+EN+C%2B%2B+UNACH\\n\\n2. RENDIMIENTO DE UNA APLICACION WEB SPA UTILIZANDO SERVICIOS REST (2024)\\nLink: https://scholar.google.com/scholar?q=RENDIMIENTO+DE+UNA+APLICACION+WEB+SPA+UTILIZANDO+SERVICIOS+REST\\n\\n3. OBSERVATORIO TURISTICO DE CHIMBORAZO (Libro, 2024)\\nLink: https://scholar.google.com/scholar?q=OBSERVATORIO+TURISTICO+DE+CHIMBORAZO\\n\\n4. POST-PANDEMIC TECHNOSTRESS IN UNIVERSITY PROFESSORS (2023)\\nLink: https://scholar.google.com/scholar?q=POST-PANDEMIC+TECHNOSTRESS+IN+UNIVERSITY+PROFESSORS\\n\\n5. ANALISIS DEL IMPACTO PLATAFORMA OPENCOURSEWARE (2023)\\nLink: https://scholar.google.com/scholar?q=ANALISIS+DEL+IMPACTO+PLATAFORMA+OPENCOURSEWARE\\n\\n6. VISUAL FATIGUE AND TECHNOSTRESS IN AGRO-INDUSTRIES (2023)\\nLink: https://scholar.google.com/scholar?q=VISUAL+FATIGUE+AND+TECHNOSTRESS+IN+AGRO-INDUSTRIES\\n\\n7. DATA ANALYTICS FOR HEALTHCARE INSTITUTIONS (2022)\\nLink: https://scholar.google.com/scholar?q=DATA+ANALYTICS+FOR+HEALTHCARE+INSTITUTIONS\\n\\n8. MATURITY MODEL FOR DATA ANALYTICS (2022)\\nLink: https://scholar.google.com/scholar?q=MATURITY+MODEL+FOR+DATA+ANALYTICS\\n\\n9. VISUAL FATIGUE AND TELEWORK IN UNIVERSITY STAFF (2022)\\nLink: https://scholar.google.com/scholar?q=VISUAL+FATIGUE+AND+TELEWORK+IN+UNIVERSITY+STAFF\\n\\n10. COMPUTER, TELEWORKING AND COVID 19 SYNDROME (2022)\\nLink: https://scholar.google.com/scholar?q=COMPUTER,+TELEWORKING+AND+COVID+19+SYNDROME\\n\\n11. STRESS, TELEWORK AND COVID 19 IN COLLEGE TEACHERS (2021)\\nLink: https://scholar.google.com/scholar?q=STRESS,+TELEWORK+AND+COVID+19+IN+COLLEGE+TEACHERS\\n\\n12. VIRTUAL AND MOBILE APPLICATION EDUCATION IN TELEMEDICINE (2021)\\nLink: https://scholar.google.com/scholar?q=VIRTUAL+AND+MOBILE+APPLICATION+EDUCATION+IN+TELEMEDICINE\\n\\n13. CIUDADES INTELIGENTES Y FOG COMPUTING (Libro, 2021)\\nLink: https://scholar.google.com/scholar?q=CIUDADES+INTELIGENTES+Y+FOG+COMPUTING\\n\\n14. LA COVID-19 EN EL AMBITO DE LA EDUCACION SUPERIOR (2021)\\nLink: https://scholar.google.com/scholar?q=LA+COVID-19+EN+EL+AMBITO+DE+LA+EDUCACION+SUPERIOR\\n\\n15. MODELO FURPS PARA EL ANALISIS DEL RENDIMIENTO JSF (2019)\\nLink: https://scholar.google.com/scholar?q=MODELO+FURPS+PARA+EL+ANALISIS+DEL+RENDIMIENTO+JSF\\n\\n16. CARACTERIZACION DE LOS SINIESTROS VIALES EN EL ECUADOR (2019)\\nLink: https://scholar.google.com/scholar?q=CARACTERIZACION+DE+LOS+SINIESTROS+VIALES+EN+EL+ECUADOR\\n\\n17. UNIVERSITY INDIGENOUS STUDENTS PERCEPTIONS (2018)\\nLink: https://scholar.google.com/scholar?q=UNIVERSITY+INDIGENOUS+STUDENTS+PERCEPTIONS\\n\\n18. FORECASTING OF CO2 EMISSIONS (2017)\\nLink: https://scholar.google.com/scholar?q=FORECASTING+OF+CO2+EMISSIONS\\n\\n19. DETERMINING FACTORS IN ACCEPTANCE OF ICT (2016)\\nLink: https://scholar.google.com/scholar?q=DETERMINING+FACTORS+IN+ACCEPTANCE+OF+ICT\"}', NULL, 1),
(77, 'Ximena Alexandra Quintana Lopez', 'ximena.quintana@unach.edu.ec', '12345', 'docente', '2026-02-02 13:27:10', '{\"ci\":\"0603557612\",\"fnac\":\"1987-11-14\",\"lugarnac\":\"ECUADOR\",\"domicilio\":\"VIENA H3 ROMA\",\"ciudad\":\"RIOBAMBA\",\"celular\":\"0998611271\",\"tlf_oficina\":\"0998611271\",\"email_pers\":\"x.quintana@outlook.com\",\"formacion\":\"1. DOTTORE DI RICERCA IN INFORMATION AND COMMUNICATION ENGINEERING (ITALIA, 2018)\\n2. INGENIERA EN SISTEMAS INFORMATICOS (ESPOCH, 2012)\",\"experiencia\":\"4.1 PROFESIONAL:\\n- MIEMBRO EXPERTO TESIS DOCTORAL ITALIA (2017)\\n- JEFE DE SISTEMAS FMCOMPUSOLUCIONES (2006-2007)\\n\\n4.3 CAPACITADOR:\\n- FACILITADORA SUMMER SCHOOL (2016)\",\"capacitacion\":\"3.1 UNACH:\\n- INNOVASOFT 2019\\n- REALIDAD AUMENTADA CON UNITY (2019)\\n- INTELIGENCIA ARTIFICIAL APLICADA SW (2024)\\n- METODOLOGÍAS ACTIVAS CULTURA DIGITAL (2024)\\n- INTERNET DE LAS COSAS (2024)\\n- POWER BI (2023)\\n- MICROSERVICIOS SPRING (2023)\\n- ESCRITURA ARTÍCULOS CIENTÍFICOS (2022)\\n- PARES EVALUADORES (2022)\\n- ANALÍTICA DE DATOS (2022)\\n- SEGURIDAD INFORMACIÓN (2021)\\n- BIG DATA (2019)\\n\\n3.2 EXTERNOS:\\n- IA APLICADA A EDUCACIÓN (2024)\\n- EDUCAR CON IA (2024)\\n- COMPRAS PÚBLICAS SERCOP (2023)\\n- DIPLOMADO REDACCIÓN CIENTÍFICA (2021)\\n- VIRTUALIZACIÓN VMWARE (2020)\",\"idiomas\":\"ITALIANO: 90% | INGLÉS: 90% | ESPAÑOL: 100%\",\"publicaciones\":\"1. POSTGRADUATE DEGREE IN APPLIED IT (2025)\\nLink: https://scholar.google.com/scholar?q=POSTGRADUATE+DEGREE+IN+APPLIED+IT\\n\\n2. MACHINE LEARNING IN INDUSTRY 4.0: A SYSTEMATIC REVIEW (2024)\\nLink: https://scholar.google.com/scholar?q=MACHINE+LEARNING+IN+INDUSTRY+4.0+SYSTEMATIC+REVIEW\\n\\n3. LA UTILIZACION DE BIG DATA Y BUSINESS INTELLIGENCE (2024)\\nLink: https://scholar.google.com/scholar?q=LA+UTILIZACION+DE+BIG+DATA+Y+BUSINESS+INTELLIGENCE\\n\\n4. IMPLEMENTACION DE UN SISTEMA EXPERTO DE ORIENTACION VOCACIONAL (2024)\\nLink: https://scholar.google.com/scholar?q=IMPLEMENTACION+DE+UN+SISTEMA+EXPERTO+DE+ORIENTACION+VOCACIONAL\\n\\n5. DETERMINACION DE DEPENDENCIA ESTADISTICA RODAMIENTOS (2024)\\nLink: https://scholar.google.com/scholar?q=DETERMINACION+DE+DEPENDENCIA+ESTADISTICA+RODAMIENTOS\\n\\n6. IMPLEMENTACION DE PRONOSTICOS METEOROLOGICOS (2022)\\nLink: https://scholar.google.com/scholar?q=IMPLEMENTACION+DE+PRONOSTICOS+METEOROLOGICOS\"}', NULL, 1),
(78, 'Lorena Paulina Molina Valdiviezo', 'lmolina@unach.edu.ec', '12345', 'docente', '2026-02-02 13:27:10', '{\"ci\":\"0603228156\",\"fnac\":\"1980-04-27\",\"lugarnac\":\"ECUADOR\",\"domicilio\":\"Av. Antonio José de Sucre 3\",\"ciudad\":\"RIOBAMBA\",\"celular\":\"0984844744\",\"tlf_oficina\":\"3730880\",\"email_pers\":\"lopaumoval@gmail.com\",\"formacion\":\"1. DOTTORE DI RICERCA IN INGEGNERIA DEI SISTEMI (ITALIA, 2016)\\n2. MAGISTER EN DOCENCIA Y CURRICULO (UTA, 2012)\\n3. INGENIERA EN SISTEMAS (ESPOCH, 2005)\",\"experiencia\":\"4.1 PROFESIONAL:\\n- SUBDECANA FACULTAD INGENIERÍA\\n- LIDER GRUPO INVESTIGACIÓN MODSIM\\n\\n4.4 ADMINISTRATIVA:\\n- REPRESENTANTE CONSEJO UNIVERSITARIO (2018-2050)\\n- DIRECTORA REVISTA NOVASINERGIA (2021-Actualidad)\",\"capacitacion\":\"3.1 UNACH:\\n- DETECCIÓN CONTENIDO IA (2025)\\n- IA EN GESTIÓN DOCENTE (2024)\\n- ARTÍCULOS CIENTÍFICOS (2024)\\n- ANÁLISIS DATOS PYTHON (2024)\\n- ESTADÍSTICA NO PARAMÉTRICA (2024)\\n- EDUCACIÓN EN LÍNEA (2023)\\n- POWER BI (2023)\\n- MINERÍA DE DATOS (2023)\\n- QLIKTECH (2019)\\n\\n3.2 EXTERNOS:\\n- CISTI 2022 (ESPAÑA)\\n- CLASES INTERACTIVAS ONLINE (2021)\\n- FOUNDATIONS OF SECURITY (ITALIA, 2015)\\n- PROGRAMMING GPUS CUDA (ITALIA, 2015)\",\"idiomas\":\"ITALIANO: 50% | INGLÉS: 50% | ESPAÑOL: 100%\",\"publicaciones\":\"1. SUPPLY CHAIN DESIGN FOR WASTE VALORIZATION (2024)\\nLink: https://scholar.google.com/scholar?q=SUPPLY+CHAIN+DESIGN+FOR+WASTE+VALORIZATION\\n\\n2. FORMACION EN CIENCIA DE DATOS (LIBRO, 2023)\\nLink: https://scholar.google.com/scholar?q=FORMACION+EN+CIENCIA+DE+DATOS+LIBRO\\n\\n3. DOCTORAL PROGRAM IN COMPUTER SCIENCE (2023)\\nLink: https://scholar.google.com/scholar?q=DOCTORAL+PROGRAM+IN+COMPUTER+SCIENCE\\n\\n4. DEMAND AND EMPLOYABILITY COMPUTER SECURITY (2022)\\nLink: https://scholar.google.com/scholar?q=DEMAND+AND+EMPLOYABILITY+COMPUTER+SECURITY\\n\\n5. STUDY OF RELEVANCE DATA SCIENCE (2022)\\nLink: https://scholar.google.com/scholar?q=STUDY+OF+RELEVANCE+DATA+SCIENCE\\n\\n6. SURFACE FLOWS SIMULATION BY CELLULAR AUTOMATA (2022)\\nLink: https://scholar.google.com/scholar?q=SURFACE+FLOWS+SIMULATION+BY+CELLULAR+AUTOMATA\\n\\n7. CREACION MAESTRIA AUDITORIA TI (2020)\\nLink: https://scholar.google.com/scholar?q=CREACION+MAESTRIA+AUDITORIA+TI\\n\\n8. RESEARCH MASTER IN COMPUTER AUDIT (2020)\\nLink: https://scholar.google.com/scholar?q=RESEARCH+MASTER+IN+COMPUTER+AUDIT\\n\\n9. FROM EXAMINATION OF NATURAL EVENTS TO RISK MITIGATION (2020)\\nLink: https://scholar.google.com/scholar?q=FROM+EXAMINATION+OF+NATURAL+EVENTS+TO+RISK+MITIGATION\\n\\n10. LA DIFUSION DE RESULTADOS CIENTIFICOS (2018)\\nLink: https://scholar.google.com/scholar?q=LA+DIFUSION+DE+RESULTADOS+CIENTIFICOS\\n\\n11. FORECASTING CO2 EMISSIONS (2017)\\nLink: https://scholar.google.com/scholar?q=FORECASTING+CO2+EMISSIONS\\n\\n12. SIMULATIONS OF FLOW-LIKE LANDSLIDES (2017)\\nLink: https://scholar.google.com/scholar?q=SIMULATIONS+OF+FLOW-LIKE+LANDSLIDES\\n\\n13. FILTROS MICROSTRIP (2017)\\nLink: https://scholar.google.com/scholar?q=FILTROS+MICROSTRIP\\n\\n14. LEARNING FROM NATURE (2017)\\nLink: https://scholar.google.com/scholar?q=LEARNING+FROM+NATURE\\n\\n15. DIGITAL COMMUNICATION ANALYSIS GENE EXPRESSION (2016)\\nLink: https://scholar.google.com/scholar?q=DIGITAL+COMMUNICATION+ANALYSIS+GENE+EXPRESSION\\n\\n16. DDOS ATTACKS SIMULATION (2016)\\nLink: https://scholar.google.com/scholar?q=DDOS+ATTACKS+SIMULATION\\n\\n17. AUTOMATAS CELULARES MACROSCOPICOS (2016)\\nLink: https://scholar.google.com/scholar?q=AUTOMATAS+CELULARES+MACROSCOPICOS\\n\\n18. EL ENEMIGO MODERNO (2016)\\nLink: https://scholar.google.com/scholar?q=EL+ENEMIGO+MODERNO\\n\\n19. PACIE METHODOLOGY (2015)\\nLink: https://scholar.google.com/scholar?q=PACIE+METHODOLOGY\\n\\n20. MODELLING DEFENSE STRATEGY DDOS (2014)\\nLink: https://scholar.google.com/scholar?q=MODELLING+DEFENSE+STRATEGY+DDOS\"}', NULL, 1),
(79, 'Luis Gonzalo Allauca Peñafiel', 'gallauca@unach.edu.ec', '12345', 'docente', '2026-02-02 13:27:10', '{\"ci\":\"0602363418\",\"fnac\":\"1975-12-30\",\"lugarnac\":\"ECUADOR\",\"domicilio\":\"TORONTO 5 SAN JOSE\",\"ciudad\":\"RIOBAMBA\",\"celular\":\"0992715687\",\"tlf_oficina\":\"0323730880\",\"email_pers\":\"gonzalo_gap8@hotmail.com\",\"formacion\":\"1. MAGISTER EN INTERCONECTIVIDAD DE REDES (ESPOCH, 2012)\\n2. INGENIERO EN SISTEMAS INFORMATICOS (ESPOCH, 2006)\",\"experiencia\":\"4.1 PROFESIONAL:\\n- GESTIÓN ACADÉMICA EVALUADOR (2015-2016)\\n- TÉCNICO INFORMÁTICO ESPOCH (2006-2012)\\n\\n4.4 ADMINISTRATIVA:\\n- COORDINADOR EVALUACIÓN CARRERA ODONTOLOGÍA/MEDICINA (2014-2015)\\n- DIRECTOR DEPARTAMENTO SISTEMAS ESPOCH (2006)\",\"capacitacion\":\"- IA PARA LA DOCENCIA (2025)\\n- INTERNET DE LAS COSAS (2024)\\n- POWER BI (2023)\\n- PLANES ASEGURAMIENTO CALIDAD (2023)\\n- MICROSERVICIOS SPRING (2023)\\n- DESARROLLO .NET 6 (2022)\\n- ANALÍTICA DE DATOS (2022)\\n- SEGURIDAD INFORMACIÓN (2021)\\n- METODOLOGÍAS ÁGILES (2020)\\n- QLIKTECH (2019)\\n- JAVA FOUNDATIONS (ORACLE, 2019)\\n- CCNA ROUTING (2017)\",\"idiomas\":\"INGLÉS: 50% Hablado/Escrito\",\"publicaciones\":\"1. DEMAND AND EMPLOYABILITY FOR ENGINEERING IN COMPUTER SECURITY (2022)\\nLink: https://scholar.google.com/scholar?q=DEMAND+AND+EMPLOYABILITY+FOR+ENGINEERING+IN+COMPUTER+SECURITY\\n\\n2. THE IMPORTANCE OF DIGITAL PRESERVATION (2021)\\nLink: https://scholar.google.com/scholar?q=THE+IMPORTANCE+OF+DIGITAL+PRESERVATION\\n\\n3. SOLUCION WEB INTEGRAL GESTION CAPACITACIONES (2021)\\nLink: https://scholar.google.com/scholar?q=SOLUCION+WEB+INTEGRAL+GESTION+CAPACITACIONES\\n\\n4. APLICACION MOVIL REALIDAD AUMENTADA SINDROME DOWN (2020)\\nLink: https://scholar.google.com/scholar?q=APLICACION+MOVIL+REALIDAD+AUMENTADA+SINDROME+DOWN\\n\\n5. APLICACION METODOLOGIA AGILUS (2018)\\nLink: https://scholar.google.com/scholar?q=APLICACION+METODOLOGIA+AGILUS\\n\\n6. ALTERNATIVAS TEXT TO SPEECH VOIP (2016)\\nLink: https://scholar.google.com/scholar?q=ALTERNATIVAS+TEXT+TO+SPEECH+VOIP\\n\\n7. PROYECTO MI INFORMACION SIEMPRE LIBRE (2016)\\nLink: https://scholar.google.com/scholar?q=PROYECTO+MI+INFORMACION+SIEMPRE+LIBRE\\n\\n8. MODELO REFERENCIAL DETECCION INTRUSOS HONEYNET (2016)\\nLink: https://scholar.google.com/scholar?q=MODELO+REFERENCIAL+DETECCION+INTRUSOS+HONEYNET\\n\\n9. ANALISIS IMPACTO FACEBOOK (2015)\\nLink: https://scholar.google.com/scholar?q=ANALISIS+IMPACTO+FACEBOOK\\n\\n10. ESTUDIO IMPACTO GITHUB (2015)\\nLink: https://scholar.google.com/scholar?q=ESTUDIO+IMPACTO+GITHUB\\n\\n11. FOMENTO DESARROLLO INTEGRAL CHIMBORAZO (2015)\\nLink: https://scholar.google.com/scholar?q=FOMENTO+DESARROLLO+INTEGRAL+CHIMBORAZO\\n\\n12. PROGRAMA GEOCONOCE CHIMBORAZO (2015)\\nLink: https://scholar.google.com/scholar?q=PROGRAMA+GEOCONOCE+CHIMBORAZO\"}', NULL, 1),
(80, 'Pamela Alexandra Buñay Guisñan', 'pbunay@unach.edu.ec', '12345', 'docente', '2026-02-02 13:27:10', '{\"ci\":\"0604246736\",\"fnac\":\"1985-06-11\",\"lugarnac\":\"ECUADOR\",\"domicilio\":\"PASAJE 3 CASA 9 JOSÉ MARÍA URBINA\",\"ciudad\":\"RIOBAMBA\",\"celular\":\"0984421073\",\"tlf_oficina\":\"N/A\",\"email_pers\":\"pamealexabg@hotmail.com\",\"formacion\":\"1. MASTER ING. SOFTWARE Y SISTEMAS (UNIR ESPAÑA, 2019)\\n2. MAGISTER INTERCONECTIVIDAD REDES (ESPOCH, 2013)\\n3. INGENIERA SISTEMAS (ESPOCH, 2009)\",\"experiencia\":\"4.1 PROFESIONAL:\\n- DESARROLLADOR SW INSTITUTO VIGOTSKY (2018)\\n- DESARROLLADOR SW SERIVARSA (2011-2014)\\n- DESARROLLADOR SW SUMAKTECH (2009)\",\"capacitacion\":\"- MACHINE LEARNING (2024)\\n- DISEÑO CLASES ONLINE (2021)\\n- PROYECTOS INVESTIGACIÓN (2021)\\n- MODELO CANVAS (2021)\\n- MARCO LÓGICO (2017)\\n- EDICIÓN TEXTOS LATEX (2016)\\n- ESTADÍSTICA SPSS (2016)\\n- AULAS VIRTUALES (2015)\\n- IA EN GESTIÓN DOCENTE (2024)\\n- ARTÍCULOS CIENTÍFICOS (2024)\\n- IA DESARROLLO SOFTWARE (2024)\\n- METODOLOGÍAS ACTIVAS (2024)\\n- BIG DATA (2023)\\n- POWER BI (2023)\\n- MICROSERVICIOS SPRING (2023)\\n- JAVA FOUNDATIONS (2019)\\n- CIBERSEGURIDAD CISCO (2018)\",\"idiomas\":\"INGLÉS: 40% Hablado / 60% Escrito / 40% Comprensión\",\"publicaciones\":\"1. ARTIFICIAL INTELLIGENCE IN TOURISM BUSINESS (2025)\\nLink: https://scholar.google.com/scholar?q=ARTIFICIAL+INTELLIGENCE+IN+TOURISM+BUSINESS\\n\\n2. SISTEMA EVALUACION SERVICIOS TURISTICOS (2025)\\nLink: https://scholar.google.com/scholar?q=SISTEMA+EVALUACION+SERVICIOS+TURISTICOS\\n\\n3. PREDICTING URBAN TRAFFIC CONGESTION (2025)\\nLink: https://scholar.google.com/scholar?q=PREDICTING+URBAN+TRAFFIC+CONGESTION\\n\\n4. ADICCION REDES SOCIALES Y AUTOESTIMA (2025)\\nLink: https://scholar.google.com/scholar?q=ADICCION+REDES+SOCIALES+Y+AUTOESTIMA\\n\\n5. RAIZ CUADRADA MATRIZ ADYACENCIA (2024)\\nLink: https://scholar.google.com/scholar?q=RAIZ+CUADRADA+MATRIZ+ADYACENCIA\\n\\n6. BLOCKCHAIN PEER REVIEW (2024)\\nLink: https://scholar.google.com/scholar?q=BLOCKCHAIN+PEER+REVIEW\\n\\n7. REGULARIZATION PATTERN DETECTION GITHUB (2024)\\nLink: https://scholar.google.com/scholar?q=REGULARIZATION+PATTERN+DETECTION+GITHUB\\n\\n8. SIMULACION SONIDO CUERDA GUITARRA (2024)\\nLink: https://scholar.google.com/scholar?q=SIMULACION+SONIDO+CUERDA+GUITARRA\\n\\n9. METODOLOGIA DWEP ALERTAS FITOSANITARIAS (2024)\\nLink: https://scholar.google.com/scholar?q=METODOLOGIA+DWEP+ALERTAS+FITOSANITARIAS\\n\\n10. EVALUACION VIDEOJUEGO MITOS ECUADOR (2024)\\nLink: https://scholar.google.com/scholar?q=EVALUACION+VIDEOJUEGO+MITOS+ECUADOR\\n\\n11. REVIEW PROTECTED AREAS ECUADOR (2023)\\nLink: https://scholar.google.com/scholar?q=REVIEW+PROTECTED+AREAS+ECUADOR\\n\\n12. ANALISIS MODELOS PREDICTIVOS ENERGIA (2022)\\nLink: https://scholar.google.com/scholar?q=ANALISIS+MODELOS+PREDICTIVOS+ENERGIA\\n\\n13. SISTEMA GESTION LIGA DEPORTIVA LICAN (2022)\\nLink: https://scholar.google.com/scholar?q=SISTEMA+GESTION+LIGA+DEPORTIVA+LICAN\\n\\n14. COMPARACION SSO WSO2 VS CAS (2022)\\nLink: https://scholar.google.com/scholar?q=COMPARACION+SSO+WSO2+VS+CAS\\n\\n15. SOLUCION WEB CAPACITACIONES ESPOCH (2021)\\nLink: https://scholar.google.com/scholar?q=SOLUCION+WEB+CAPACITACIONES+ESPOCH\\n\\n16. SISTEMA WEB EVIDENCIAS DOCENTES (2021)\\nLink: https://scholar.google.com/scholar?q=SISTEMA+WEB+EVIDENCIAS+DOCENTES\\n\\n17. SISTEMA JELAPP V1.0 (2021)\\nLink: https://scholar.google.com/scholar?q=SISTEMA+JELAPP+V1.0\\n\\n18. SISTEMA RIOPRESERVA V1.0 (2021)\\nLink: https://scholar.google.com/scholar?q=SISTEMA+RIOPRESERVA+V1.0\\n\\n19. MODELO PRESERVACION DIGITAL ADAPTATIVO (2020)\\nLink: https://scholar.google.com/scholar?q=MODELO+PRESERVACION+DIGITAL+ADAPTATIVO\\n\\n20. ESTIMACION SINIESTROS TRANSITO (2020)\\nLink: https://scholar.google.com/scholar?q=ESTIMACION+SINIESTROS+TRANSITO\"}', NULL, 1),
(81, 'Danny Patricio Velasco Silva', 'dvelasco@unach.edu.ec', '12345', 'docente', '2026-02-02 13:27:10', '{\"ci\":\"0602768640\",\"fnac\":\"1976-04-07\",\"lugarnac\":\"ECUADOR\",\"domicilio\":\"CDLA. JUAN MONTALVO\",\"ciudad\":\"RIOBAMBA\",\"celular\":\"N/A\",\"tlf_oficina\":\"N/A\",\"email_pers\":\"dvelasco@unach.edu.ec\",\"formacion\":\"1. MAGISTER EN INTERCONECTIVIDAD DE REDES (ESPOCH, 2012)\\n2. DIPLOMA SUPERIOR TIC (UNL, 2006)\\n3. INGENIERO EN SISTEMAS (ESPOCH, 2002)\",\"experiencia\":\"4.1 PROFESIONAL:\\n- MUNICIPIO RIOBAMBA (2010): Diseño sistema bolsa empleo\\n- PC SERVICE (2004-2006): Jefe Técnico y Desarrollo\\n\\n4.3 DIRECTIVA:\\n- DIRECTOR ACADÉMICO UNACH (2017-2024)\\n- DIRECTOR CARRERA SISTEMAS (2014-2017)\\n- PRESIDENTE COMISIÓN INFORMÁTICA (2010-2011)\",\"capacitacion\":\"- INVESTIGACIÓN FORMATIVA\\n- INNOVACIÓN GESTIÓN DOCENTE\\n- PEDAGOGÍA Y DIDÁCTICA\\n- DISEÑO CURRICULAR\\n- HERRAMIENTAS IA DOCENCIA\\n- MODELO EDUCATIVO UNACH\\n- METODOLOGÍAS ACTIVAS CULTURA DIGITAL\\n- IA EN DESARROLLO SOFTWARE\\n- INTERNET DE LAS COSAS\\n- INVESTIGACIÓN CUALITATIVA ATLAS TI\\n- ESTRATEGIAS ATENCIÓN INCLUSIVA (2023)\\n- IP V6 AVANZADO (2023)\\n- TUTORES EN LÍNEA (2021)\",\"idiomas\":\"INGLÉS: 50%\",\"publicaciones\":\"1. INTEGRATION DOUBLE DIAMOND DESIGN THINKING DEVOPS (2024)\\nLink: https://scholar.google.com/scholar?q=INTEGRATION+DOUBLE+DIAMOND+DESIGN+THINKING+DEVOPS\\n\\n2. EL PROCESO DE FORMACION BASADO EN COMPETENCIAS (2023)\\nLink: https://scholar.google.com/scholar?q=EL+PROCESO+DE+FORMACION+BASADO+EN+COMPETENCIAS\\n\\n3. IDEAS Y PERSPECTIVAS MODELOS EDUCATIVOS (2023)\\nLink: https://scholar.google.com/scholar?q=IDEAS+Y+PERSPECTIVAS+MODELOS+EDUCATIVOS\\n\\n4. DEMAND AND EMPLOYABILITY COMPUTER SECURITY (2022)\\nLink: https://scholar.google.com/scholar?q=DEMAND+AND+EMPLOYABILITY+COMPUTER+SECURITY\\n\\n5. THE IMPORTANCE OF DIGITAL PRESERVATION (2021)\\nLink: https://scholar.google.com/scholar?q=THE+IMPORTANCE+OF+DIGITAL+PRESERVATION\\n\\n6. ANALISIS COMPARATIVO TECNICAS PROTECCION RUTAS (2018)\\nLink: https://scholar.google.com/scholar?q=ANALISIS+COMPARATIVO+TECNICAS+PROTECCION+RUTAS\\n\\n7. A REVIEW OF HONEYNET ARCHITECTURES (2017)\\nLink: https://scholar.google.com/scholar?q=A+REVIEW+OF+HONEYNET+ARCHITECTURES\\n\\n8. TRANSFERENCIA TECNOLOGICA IES (2017)\\nLink: https://scholar.google.com/scholar?q=TRANSFERENCIA+TECNOLOGICA+IES\\n\\n9. ONTOLOGIES FOR NETWORK SECURITY (2017)\\nLink: https://scholar.google.com/scholar?q=ONTOLOGIES+FOR+NETWORK+SECURITY\\n\\n10. ALTERNATIVAS TEXT TO SPEECH VOIP (2016)\\nLink: https://scholar.google.com/scholar?q=ALTERNATIVAS+TEXT+TO+SPEECH+VOIP\\n\\n11. USE OF ELECTRONIC DEVICES PLE (2015)\\nLink: https://scholar.google.com/scholar?q=USE+OF+ELECTRONIC+DEVICES+PLE\\n\\n12. PLATAFORMAS PROPIETARIAS VOIP (2015)\\nLink: https://scholar.google.com/scholar?q=PLATAFORMAS+PROPIETARIAS+VOIP\\n\\n13. PROGRAMA GEOCONOCE CHIMBORAZO (2015)\\nLink: https://scholar.google.com/scholar?q=PROGRAMA+GEOCONOCE+CHIMBORAZO\\n\\n14. ONTOLOGIAS INFORMATICA FORENSE (2014)\\nLink: https://scholar.google.com/scholar?q=ONTOLOGIAS+INFORMATICA+FORENSE\\n\\n15. INCORPORACION DE TIC EN ENSEÑANZA DEL INGLES (2014)\\nLink: http://dspace.unach.edu.ec/handle/51000/8319\"}', NULL, 1),
(82, 'Elba María Bodero Poveda', 'ebodero@unach.edu.ec', '12345', 'docente', '2026-02-02 13:27:10', '{\"ci\":\"0603XXXXXX\",\"fnac\":\"\",\"lugarnac\":\"ECUADOR\",\"domicilio\":\"RIOBAMBA\",\"ciudad\":\"RIOBAMBA\",\"celular\":\"N/A\",\"tlf_oficina\":\"N/A\",\"email_pers\":\"N/A\",\"formacion\":\"1. PhD CIENCIAS INFORMÁTICAS (UNLP ARGENTINA, 2022)\\n2. MAGISTER SCIENTIAE GESTIÓN CREACIÓN INTELECTUAL (VENEZUELA, 2021)\\n3. MASTER EDUCACIÓN A DISTANCIA (CURAZAO, 2014)\\n4. MAGISTER TECNOLOGÍA INFORMACIÓN (UTA, 2010)\\n5. INGENIERA SISTEMAS (ESPOCH, 2004)\",\"experiencia\":\"1. DOCENTE TITULAR UNACH (2005 - Actualidad)\\n2. EDITORA ADJUNTA REVISTA NOVASINERGIA (2023-Actualidad)\\n3. COORDINADORA ACADÉMICA ESPRINT (2022-Actualidad)\\n4. MIEMBRO JUNTA DIRECTIVA ISTEC (2022-2024)\",\"capacitacion\":\"- HP EXPERTONE SERVIDORES Y ALMACENAMIENTO (2014)\\n- HP EXPERTONE CLOUD (2014)\\n- MICROSOFT MTA NETWORKING, SECURITY, DB (2011)\\n- EXPERTO E-LEARNING (FATLA, 2010)\",\"idiomas\":\"N/A\",\"publicaciones\":\"1. Prolonged Power Outages and Air Quality (2025)\\nLink: https://doi.org/10.3390/atmos16030274\\n\\n2. Blockchain and Peer Review: Systematic Review (2024)\\nLink: https://doi.org/10.3390/publications12040040\\n\\n3. Modelo de Madurez Preservación Digital (Libro, 2024)\\nLink: https://doi.org/10.61347/ei-lib.2\\n\\n4. Blockchain dataset Zenodo (2024)\\nLink: https://doi.org/10.5281/zenodo.12802895\\n\\n5. Assessing Modern Physics Education (2024)\\nLink: https://doi.org/10.28991/esj-2024-sied1-01\\n\\n6. ESTÁNDARES NANOCOMUNICACIONES BIOLÓGICAS (2024)\\nLink: https://doi.org/10.48661/3517-9f74\\n\\n7. Aplicación método ARIMA avalúo bienes (2023)\\nLink: https://doi.org/10.61347/psa.v1i1.56\\n\\n8. Modelo madurez preservación digital planificación estratégica (2022)\\nLink: https://doi.org/10.22201/iibi.24488321xe.2023.94.58654\\n\\n9. Tesis Doctoral: Modelo madurez preservación (2022)\\nLink: https://doi.org/10.35537/10915/143481\\n\\n10. Preservación digital a largo plazo: estándares (2022)\\nLink: https://doi.org/10.17533/udea.rib.v45n2e344178\\n\\n11. Técnicas minería datos plusvalía (2022)\\nLink: http://dx.doi.org/10.23857/dc.v8i41.2531\\n\\n12. Flipped Classroom aprendizaje adaptativo (2022)\\nLink: https://scholar.google.com/scholar?q=Flipped+Classroom+aprendizaje+adaptativo\\n\\n13. Preservación digital y planificación estratégica (2021)\\nLink: https://doi.org/10.17993/3ctic.2021.103.17-39\\n\\n14. Evaluación teorías preservación digital (2021)\\nLink: https://scholar.google.com/scholar?q=Evaluacion+teorias+preservacion+digital\\n\\n15. Microplastics in drinking water Riobamba (2019)\\nLink: https://doi.org/10.22630/PNIKS.2019.28.4.59\\n\\n16. Ajuste paramétrico PSO (2019)\\nLink: https://doi.org/10.47189/rcct.v19i22.248\\n\\n17. Analyses institutional Open Access repositories (2019)\\nLink: https://scholar.google.com/scholar?q=Analyses+institutional+Open+Access+repositories\\n\\n18. Efecto coeficientes PSO Red Neuronal (2018)\\nLink: https://doi.org/10.37135/unach.ns.001.01.04\\n\\n19. Adopción Business Intelligence minería texto (2018)\\nLink: https://scholar.google.com/scholar?q=Adopcion+Business+Intelligence+mineria+texto\\n\\n20. Metáfora pedagógica (2017)\\nLink: https://doi.org/10.47189/rcct.v17i14.110\\n\\n21. Formación investigativa interdisciplinaria TIC (2017)\\nLink: https://doi.org/10.18359/ravi.2670\\n\\n22. IA en campañas publicitarias\\nLink: https://scholar.google.com/scholar?q=IA+en+campañas+publicitarias\\n\\n23. Cicatrización mucílago melloco\\nLink: https://scholar.google.com/scholar?q=Cicatrización+mucílago+melloco\\n\\n24. Software libre bien común\\nLink: https://scholar.google.com/scholar?q=Software+libre+bien+común\\n\\n25. Experiencias evaluación institucional\\nLink: https://scholar.google.com/scholar?q=Experiencias+evaluación+institucional\\n\\n26. Google Colaboratory Red Neuronal\\nLink: https://scholar.google.com/scholar?q=Google+Colaboratory+Red+Neuronal\\n\\n27. Incentivos no pigouvianos ingeniería civil\\nLink: https://scholar.google.com/scholar?q=Incentivos+no+pigouvianos\\n\\n28. Redes Neuronales Costos Construcción\\nLink: https://scholar.google.com/scholar?q=Redes+Neuronales+Costos+Construcción\\n\\n29. SIG en ciencias sociales\\nLink: https://scholar.google.com/scholar?q=SIG+en+ciencias+sociales\\n\\n30. Método investigación colaborativa\\nLink: https://scholar.google.com/scholar?q=Método+investigación+colaborativa\\n\\n31. Standards biological nanocommunications\\nLink: https://scholar.google.com/scholar?q=Standards+biological+nanocommunications\\n\\n32. Valuation real estate ARIMA\\nLink: https://scholar.google.com/scholar?q=Valuation+real+estate+ARIMA\"}', NULL, 1),
(83, 'Ana Elizabeth Congacha Aushay', 'acongacha@unach.edu.ec', '12345', 'docente', '2026-02-02 13:27:10', '{\"ci\":\"0603137969\",\"fnac\":\"\",\"lugarnac\":\"ECUADOR\",\"domicilio\":\"RIOBAMBA\",\"ciudad\":\"RIOBAMBA\",\"celular\":\"N/A\",\"tlf_oficina\":\"N/A\",\"email_pers\":\"acongacha@unach.edu.ec\",\"formacion\":\"1. MAGISTER GERENCIA INFORMÁTICA (PUCE, 2015)\\n2. DIPLOMA CURRÍCULO COMPETENCIAS (UNACH, 2009)\\n3. DIPLOMADO MANEJO INFORMACIÓN INTERNET (ESPOCH, 2003)\\n4. INGENIERO SISTEMAS (ESPOCH, 2002)\",\"experiencia\":\"1. DOCENTE TITULAR UNACH\\n2. MIEMBRO COMITÉ CIENTÍFICO CAICTI (2019)\\n3. PAR EVALUADOR SECTEI (2019)\\n4. INVESTIGADOR ADJUNTO RIESGO SÍSMICO (2016-2017)\\n5. COORDINACIÓN CID (2015-2017)\",\"capacitacion\":\"- IA PARA LA DOCENCIA (2025)\\n- IA EN DESARROLLO SOFTWARE (2024)\\n- INTERNET DE LAS COSAS (2024)\\n- DISEÑO PROYECTOS UE (2021)\\n- FORMULACIÓN PROYECTOS (2021)\\n- MACHINE LEARNING (2018)\\n- INVESTIGACIÓN CUALITATIVA (2017)\\n- REDACCIÓN CIENTÍFICA (2016)\\n- MARCO LÓGICO (2014)\",\"idiomas\":\"N/A\",\"publicaciones\":\"1. Enfoque interdisciplinario gestión sustentable agua (2024)\\nLink: https://editorial.unach.edu.ec/index.php/Editorial/catalog/book/245\\n\\n2. Caracterización siniestros viales Ecuador (2019)\\nLink: https://scholar.google.com/citations?user=HFPGWc0AAAAJ\"}', NULL, 1),
(84, 'Fernando Tiverio Molina Granja', 'fmolina@unach.edu.ec', '12345', 'docente', '2026-02-02 13:27:10', '{\"ci\":\"060XXXXXXX\",\"fnac\":\"\",\"lugarnac\":\"ECUADOR\",\"domicilio\":\"RIOBAMBA\",\"ciudad\":\"RIOBAMBA\",\"celular\":\"N/A\",\"tlf_oficina\":\"N/A\",\"email_pers\":\"fmolina@unach.edu.ec\",\"formacion\":\"1. POSTDOCTORAL DEGREE COMPUTER SCIENCE (Digital Evidence)\\n2. PhD SYSTEMS ENGINEERING AND COMPUTER SCIENCE\\n3. MASTER APPLIED COMPUTER SCIENCE\\n4. MASTER DISTANCE EDUCATION (Ongoing)\\n5. SYSTEMS ENGINEER\",\"experiencia\":\"1. PROFESSOR UNACH (+20 Years)\\n2. FOUNDER INSTITUTE COMPUTER FORENSIC RESEARCH ECUADOR\\n3. EX DIRECTOR SCHOOL OF SYSTEMS UNACH\\n4. EX MEMBER POLYTECHNIC COUNCIL ESPOCH\\n5. EX PRESIDENT CIISCCH\",\"capacitacion\":\"- DIGITAL FORENSIC INVESTIGATOR (Latin American Network)\\n- EXPERT E-LEARNING PROCESSES\",\"idiomas\":\"\",\"publicaciones\":\"1. Model for digital evidence preservation in criminal research\\nLink: https://scholar.google.com/citations?user=sD530FgAAAAJ\\n\\n2. Redes sociales y rendimiento académico\\nLink: https://scholar.google.com/citations?user=sD530FgAAAAJ\"}', NULL, 1),
(85, 'Lidia del Roció Castro Cepeda', 'lidia.castro@unach.edu.ec', '123456789', 'docente', '2026-02-06 10:13:05', NULL, NULL, 1),
(86, 'Andrés Santiago Cisneros Barahona', 'ascisneros@unach.edu.ec', '123456789', 'docente', '2026-02-06 10:13:57', NULL, NULL, 1),
(87, 'Carmen Magali Cobeña Ordoñez', 'mcobena@unach.edu.ec', '123456789', 'docente', '2026-02-06 10:14:51', NULL, NULL, 1),
(88, 'Carmen Edith Donoso León', 'edonoso@unach.edu.ec', '123456789', 'docente', '2026-02-06 10:16:13', NULL, NULL, 1),
(89, 'Lady Marieliza Espinoza Tinoco', 'lespinoza@unach.edu.ec', '123456789', 'docente', '2026-02-06 10:17:00', NULL, NULL, 1),
(90, 'Juan José Flores Fiallos', 'juan.flores@unach.edu.ec', '123456789', 'docente', '2026-02-06 10:17:38', NULL, NULL, 1),
(91, 'Jose Luis Jinez Tapia', 'jjinez@unach.edu.ec', '123456789', 'docente', '2026-02-06 10:18:24', NULL, NULL, 1),
(92, 'Miryan Estela Narváez Vilema', 'miryan.narvaez@unach.edu.ec', '123456789', 'docente', '2026-02-06 10:19:54', NULL, NULL, 1),
(93, 'Hugo Humberto Paz León', 'hpaz@unach.edu.ec', '123456789', 'docente', '2026-02-06 10:20:31', NULL, NULL, 1),
(94, 'Silvia Ivette Ramos Samaniego', 'sramos@unach.edu.ec', '123456789', 'docente', '2026-02-06 10:21:18', NULL, NULL, 1),
(95, 'Diego Marcelo Reina Haro', 'dreina@unach.edu.ec', '123456789', 'docente', '2026-02-06 10:21:53', NULL, NULL, 1),
(96, 'Maria Isabel Uvidia Flasser', 'muvidia@unach.edu.ec', '123456789', 'docente', '2026-02-06 10:22:42', NULL, NULL, 1),
(97, 'Paola Gabriela Vinueza Naranjo', 'paolag.vinueza@unach.edu.ec', '123456789', 'docente', '2026-02-06 10:28:46', NULL, NULL, 1),
(98, 'Alexandra Valeria Villagómez Cabezas', 'alexandra.villagomez@unach.edu.ec', '123456789', 'docente', '2026-02-06 10:29:28', NULL, NULL, 1),
(106, 'Administrador General', 'admin@unach.edu.ec', 'admin123', 'admin', '2026-02-06 12:27:49', NULL, NULL, 1),
(113, 'Kevin Ismael Ruiz Martínez', 'opatricio285@gmail.com', '123456789', 'estudiante', '2026-02-06 13:42:51', NULL, '833928', 1),
(114, 'Docente Prueba', 'docente@prueba.com', '12345', 'docente', '2026-02-06 14:06:30', NULL, NULL, 1),
(115, 'Estudiante Prueba', 'estudiante@prueba.com', '12345', 'estudiante', '2026-02-06 14:06:30', NULL, NULL, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `repositorio`
--
ALTER TABLE `repositorio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `repositorio`
--
ALTER TABLE `repositorio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `repositorio`
--
ALTER TABLE `repositorio`
  ADD CONSTRAINT `repositorio_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
