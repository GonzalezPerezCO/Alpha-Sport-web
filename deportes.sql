-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 18-08-2018 a las 05:32:42
-- Versión del servidor: 5.7.23-0ubuntu0.16.04.1
-- Versión de PHP: 7.0.30-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `deportes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `GLOBAL`
--

CREATE TABLE `GLOBAL` (
  `id` int(11) NOT NULL,
  `MAX_ESTUDIANTES` int(11) NOT NULL,
  `MAX_NUEVOS` int(11) NOT NULL,
  `MAX_ANTIGUOS` int(11) NOT NULL,
  `MAX_TURNOS_DIA` int(11) NOT NULL,
  `cant_d1` int(11) NOT NULL DEFAULT '0',
  `cant_d2` int(11) NOT NULL DEFAULT '0',
  `cant_d3` int(11) NOT NULL DEFAULT '0',
  `cant_nuevos` int(11) NOT NULL DEFAULT '0',
  `cant_antiguos` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `GLOBAL`
--

INSERT INTO `GLOBAL` (`id`, `MAX_ESTUDIANTES`, `MAX_NUEVOS`, `MAX_ANTIGUOS`, `MAX_TURNOS_DIA`, `cant_d1`, `cant_d2`, `cant_d3`, `cant_nuevos`, `cant_antiguos`) VALUES
(1, 350, 175, 175, 20, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcupos`
--

CREATE TABLE `tcupos` (
  `id` int(11) NOT NULL,
  `lunesf8` int(11) NOT NULL DEFAULT '0',
  `lunesf9` int(11) NOT NULL DEFAULT '0',
  `lunesf10` int(11) NOT NULL DEFAULT '0',
  `lunesf11` int(11) NOT NULL DEFAULT '0',
  `lunesf12` int(11) NOT NULL DEFAULT '0',
  `lunesf13` int(11) NOT NULL DEFAULT '0',
  `lunesf14` int(11) NOT NULL DEFAULT '0',
  `lunesf15` int(11) NOT NULL DEFAULT '0',
  `lunesf16` int(11) NOT NULL DEFAULT '0',
  `martesf8` int(11) NOT NULL DEFAULT '0',
  `martesf9` int(11) NOT NULL DEFAULT '0',
  `martesf10` int(11) NOT NULL DEFAULT '0',
  `martesf11` int(11) NOT NULL DEFAULT '0',
  `martesf12` int(11) NOT NULL DEFAULT '0',
  `martesf13` int(11) NOT NULL DEFAULT '0',
  `martesf14` int(11) NOT NULL DEFAULT '0',
  `martesf15` int(11) NOT NULL DEFAULT '0',
  `martesf16` int(11) NOT NULL DEFAULT '0',
  `miercolesf8` int(11) NOT NULL DEFAULT '0',
  `miercolesf9` int(11) NOT NULL DEFAULT '0',
  `miercolesf10` int(11) NOT NULL DEFAULT '0',
  `miercolesf11` int(11) NOT NULL DEFAULT '0',
  `miercolesf12` int(11) NOT NULL DEFAULT '0',
  `miercolesf13` int(11) NOT NULL DEFAULT '0',
  `miercolesf14` int(11) NOT NULL DEFAULT '0',
  `miercolesf15` int(11) NOT NULL DEFAULT '0',
  `miercolesf16` int(11) NOT NULL DEFAULT '0',
  `juevesf8` int(11) NOT NULL DEFAULT '0',
  `juevesf9` int(11) NOT NULL DEFAULT '0',
  `juevesf10` int(11) NOT NULL DEFAULT '0',
  `juevesf11` int(11) NOT NULL DEFAULT '0',
  `juevesf12` int(11) NOT NULL DEFAULT '0',
  `juevesf13` int(11) NOT NULL DEFAULT '0',
  `juevesf14` int(11) NOT NULL DEFAULT '0',
  `juevesf15` int(11) NOT NULL DEFAULT '0',
  `juevesf16` int(11) NOT NULL DEFAULT '0',
  `viernesf8` int(11) NOT NULL DEFAULT '0',
  `viernesf9` int(11) NOT NULL DEFAULT '0',
  `viernesf10` int(11) NOT NULL DEFAULT '0',
  `viernesf11` int(11) NOT NULL DEFAULT '0',
  `viernesf12` int(11) NOT NULL DEFAULT '0',
  `viernesf13` int(11) NOT NULL DEFAULT '0',
  `viernesf14` int(11) NOT NULL DEFAULT '0',
  `viernesf15` int(11) NOT NULL DEFAULT '0',
  `viernesf16` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tcupos`
--

INSERT INTO `tcupos` (`id`, `lunesf8`, `lunesf9`, `lunesf10`, `lunesf11`, `lunesf12`, `lunesf13`, `lunesf14`, `lunesf15`, `lunesf16`, `martesf8`, `martesf9`, `martesf10`, `martesf11`, `martesf12`, `martesf13`, `martesf14`, `martesf15`, `martesf16`, `miercolesf8`, `miercolesf9`, `miercolesf10`, `miercolesf11`, `miercolesf12`, `miercolesf13`, `miercolesf14`, `miercolesf15`, `miercolesf16`, `juevesf8`, `juevesf9`, `juevesf10`, `juevesf11`, `juevesf12`, `juevesf13`, `juevesf14`, `juevesf15`, `juevesf16`, `viernesf8`, `viernesf9`, `viernesf10`, `viernesf11`, `viernesf12`, `viernesf13`, `viernesf14`, `viernesf15`, `viernesf16`) VALUES
(1, 14, 0, 0, 0, 0, 0, 0, 0, 3, 12, 0, 0, 0, 0, 0, 8, 2, 6, 12, 4, 0, 7, 0, 0, 1, 5, 2, 13, 0, 0, 0, 0, 0, 6, 5, 8, 11, 0, 0, 0, 0, 0, 2, 0, 6),
(2, 14, 0, 0, 0, 0, 0, 0, 0, 3, 12, 0, 0, 0, 0, 0, 8, 2, 6, 12, 4, 0, 7, 0, 0, 1, 5, 2, 13, 0, 0, 0, 0, 0, 6, 5, 8, 11, 0, 0, 0, 0, 0, 2, 0, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `testudiantes`
--

CREATE TABLE `testudiantes` (
  `id` int(11) NOT NULL,
  `hora` time DEFAULT NULL COMMENT 'hora de inscripcion',
  `reserva` int(11) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `codigo` int(11) DEFAULT NULL,
  `carrera` varchar(1000) DEFAULT NULL,
  `semestre` int(11) DEFAULT NULL,
  `email` varchar(100) NOT NULL COMMENT 'correo de la escuela',
  `documento` int(11) DEFAULT NULL,
  `ultimo_periodo` varchar(50) DEFAULT NULL COMMENT 'e.j: 2018-2, 2018-i',
  `password` varchar(100) NOT NULL,
  `bloqueado` tinyint(1) DEFAULT '0' COMMENT 'si esta bloqueado ',
  `observacion` varchar(3000) DEFAULT NULL COMMENT 'observaciones al estudiante'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `testudiantes`
--

INSERT INTO `testudiantes` (`id`, `hora`, `reserva`, `nombre`, `apellido`, `codigo`, `carrera`, `semestre`, `email`, `documento`, `ultimo_periodo`, `password`, `bloqueado`, `observacion`) VALUES
(1, '03:55:00', NULL, 'Nombre Prueba', 'Apellido Prueba', 10101, 'Ingeniería de Sistemas', 99, 'prueba', NULL, NULL, '000', 0, NULL),
(2, NULL, NULL, 'Manuel Sergio', 'Perez Espitia', 2095112, 'Ingenieria de Sistemas', 10, 'manuel.perez-e@mail.escuelaing.edu.co', NULL, NULL, '000', 0, 'Ninguna Ob--'),
(3, NULL, NULL, 'Juan Francisco', 'Gonzalez Rojas', 2081391, 'Ingeniería de Sistemas', 10, 'juan.gonzales@mail.escuelaing.edu.co', NULL, NULL, '000', 0, 'Ninguna para Juan G.'),
(46, '07:00:00', 76672, 'CRISTIAN NICOLAS', 'CARDENAS HINCAPIE', NULL, NULL, NULL, '76672', NULL, NULL, '76672', 0, NULL),
(47, '07:10:00', 76682, 'SANTIAGO ANDRES', 'VEGA CARRILLO', NULL, NULL, NULL, '76682', NULL, NULL, '76682', 0, NULL),
(48, '07:20:00', 76684, 'JUAN ANDRES', 'CAVIEDES NUÑEZ', NULL, NULL, NULL, '76684', NULL, NULL, '76684', 0, NULL),
(49, '07:30:00', 76698, 'JUAN DAVID', 'BURGOS FRANCO', NULL, NULL, NULL, '76698', NULL, NULL, '76698', 0, NULL),
(50, '07:40:00', 76700, 'LEIDY JILLYANA', 'POVEDA CELIS', NULL, NULL, NULL, '76700', NULL, NULL, '76700', 0, NULL),
(51, '07:50:00', 76706, 'ERICK', 'NARANJO ROJAS', NULL, NULL, NULL, '76706', NULL, NULL, '76706', 0, NULL),
(52, '08:00:00', 76740, 'ANDRES FERNANDO', 'CUELLAR HUERFANO', NULL, NULL, NULL, '76740', NULL, NULL, '76740', 0, NULL),
(53, '08:10:00', 76742, 'DAVID SANTIAGO', 'HERNANDEZ SEPULVEDA', NULL, NULL, NULL, '76742', NULL, NULL, '76742', 0, NULL),
(54, '08:20:00', 76743, 'NICOLLE VALENTINA', 'TORRES PINILLA', NULL, NULL, NULL, '76743', NULL, NULL, '76743', 0, NULL),
(55, '08:30:00', 76747, 'EDUARD FELIPE', 'ALVAREZ HERNANDEZ', NULL, NULL, NULL, '76747', NULL, NULL, '76747', 0, NULL),
(56, '08:40:00', 76748, 'ANDRES GUILLERMO', 'ROCHA MENDEZ', NULL, NULL, NULL, '76748', NULL, NULL, '76748', 0, NULL),
(57, '08:50:00', 76753, 'CESAR DAVID', 'VILLAMIL RAMOS', NULL, NULL, NULL, '76753', NULL, NULL, '76753', 0, NULL),
(58, '09:00:00', 76779, 'ASTRID MILENA', 'ROZO CARRILLO', NULL, NULL, NULL, '76779', NULL, NULL, '76779', 0, NULL),
(59, '09:10:00', 76781, 'ERESMITH', 'VERGEL VILLERO', NULL, NULL, NULL, '76781', NULL, NULL, '76781', 0, NULL),
(60, '09:20:00', 76784, 'DANIEL SMITHSON', 'CHAPARRO CARAUCHE', NULL, NULL, NULL, '76784', NULL, NULL, '76784', 0, NULL),
(61, '09:30:00', 76793, 'JHOHAN MIGUEL', 'ROJAS PALACIOS', NULL, NULL, NULL, '76793', NULL, NULL, '76793', 0, NULL),
(62, '09:40:00', 76800, 'FORTUNATO JOSE', 'CHADID MENDEZ', NULL, NULL, NULL, '76800', NULL, NULL, '76800', 0, NULL),
(63, '09:50:00', 76803, 'CAMILO ANDRES ', 'GONZALEZ BERNAL', NULL, NULL, NULL, '76803', NULL, NULL, '76803', 0, NULL),
(64, '10:00:00', 76815, 'ANDERSON', 'VIVAS MORENO', NULL, NULL, NULL, '76815', NULL, NULL, '76815', 0, NULL),
(65, '10:10:00', 76819, 'KAREN SOFIA', 'UÑATE GONZALEZ', NULL, NULL, NULL, '76819', NULL, NULL, '76819', 0, NULL),
(66, '10:20:00', 76828, 'MARIA JOSE', 'VILA VIZCANO', NULL, NULL, NULL, '76828', NULL, NULL, '76828', 0, NULL),
(67, '10:30:00', 76834, 'PAULA ANDREA', 'PULIDO SUAREZ', NULL, NULL, NULL, '76834', NULL, NULL, '76834', 0, NULL),
(68, '10:40:00', 76836, 'JUAN CAMILO', 'LOZANO MONTOYA', NULL, NULL, NULL, '76836', NULL, NULL, '76836', 0, NULL),
(69, '10:50:00', 76853, 'JUAN SEBASTIAN', 'CADVID PERALTA', NULL, NULL, NULL, '76853', NULL, NULL, '76853', 0, NULL),
(70, '11:00:00', 76856, 'JAIRO	hora', 'PINEDA RIAÑO', NULL, NULL, NULL, '76856', NULL, NULL, '76856', 0, NULL),
(71, '11:10:00', 76866, 'NICOLAS YESID', 'VARGAS LEMUS', NULL, NULL, NULL, '76866', NULL, NULL, '76866', 0, NULL),
(72, '11:20:00', 76876, 'JHON ALEJANDRO', 'LASSO BUESAQUILLO', NULL, NULL, NULL, '76876', NULL, NULL, '76876', 0, NULL),
(73, '11:30:00', 76877, 'JAIRO ANDRES', 'AVILA BUITRAGO', NULL, NULL, NULL, '76877', NULL, NULL, '76877', 0, NULL),
(74, '11:40:00', 76878, 'RODNEY YULIAN', 'FLOREZ TELLEZ', NULL, NULL, NULL, '76878', NULL, NULL, '76878', 0, NULL),
(75, '11:50:00', 76883, 'GUSTAVO ANDRES', 'BOHORQUEZ BENITEZ', NULL, NULL, NULL, '76883', NULL, NULL, '76883', 0, NULL),
(76, '12:00:00', 76885, 'ANDRES MATEO', 'JIMENEZ HERRERA', NULL, NULL, NULL, '76885', NULL, NULL, '76885', 0, NULL),
(77, '12:10:00', 76886, 'ANDRES FELIPE', 'MARIN MOSQUERA', NULL, NULL, NULL, '76886', NULL, NULL, '76886', 0, NULL),
(78, '12:20:00', 76887, 'LISANDRO', 'RESTREPO VAZQUEZ', NULL, NULL, NULL, '76887', NULL, NULL, '76887', 0, NULL),
(79, '12:30:00', 76888, 'LUIS FELIPE', 'CABRERA LOPEZ', NULL, NULL, NULL, '76888', NULL, NULL, '76888', 0, NULL),
(80, '12:40:00', 76895, 'LEONARDO DAVID', 'OSPINO REALES', NULL, NULL, NULL, '76895', NULL, NULL, '76895', 0, NULL),
(81, '12:50:00', 76901, 'JOHAN SEBASTIAN', 'TORRES MARTINEZ', NULL, NULL, NULL, '76901', NULL, NULL, '76901', 0, NULL),
(82, '13:00:00', 76903, 'SERGIO NICOLAS', 'RAMOS MOYA', NULL, NULL, NULL, '76903', NULL, NULL, '76903', 0, NULL),
(83, '13:10:00', 76913, 'JOHAN SEBASTIAN', 'HERRERA ORTEGA', NULL, NULL, NULL, '76913', NULL, NULL, '76913', 0, NULL),
(84, '13:20:00', 76916, 'DIEGO ALEJANDRO', 'GOMEZ HERNANDEZ', NULL, NULL, NULL, '76916', NULL, NULL, '76916', 0, NULL),
(85, '13:30:00', 76928, 'MIGUEL ANGEL ', 'MARTINEZ MORALES', NULL, NULL, NULL, '76928', NULL, NULL, '76928', 0, NULL),
(86, '13:40:00', 76931, 'MICHAEL STIVEN', 'GAMBOA SUESCA', NULL, NULL, NULL, '76931', NULL, NULL, '76931', 0, NULL);

--
-- Disparadores `testudiantes`
--
DELIMITER $$
CREATE TRIGGER `D_email` AFTER DELETE ON `testudiantes` FOR EACH ROW DELETE FROM thorarios
WHERE email = OLD.email
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `I_email` AFTER INSERT ON `testudiantes` FOR EACH ROW INSERT INTO thorarios(email) VALUES (NEW.email)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `U_email` AFTER UPDATE ON `testudiantes` FOR EACH ROW UPDATE thorarios SET email=NEW.email WHERE email=OLD.email
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `thorarios`
--

CREATE TABLE `thorarios` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `dia1` varchar(15) NOT NULL DEFAULT 'N/A' COMMENT 'lunes...sabado',
  `dia2` varchar(15) NOT NULL DEFAULT 'N/A' COMMENT 'lunes...sabado',
  `dia3` varchar(15) NOT NULL DEFAULT 'N/A' COMMENT 'lunes...sabado',
  `hora1` varchar(20) NOT NULL DEFAULT 'N/A' COMMENT '07:00...17:00-07:00...17:00',
  `hora2` varchar(20) NOT NULL DEFAULT 'N/A' COMMENT '07:00...17:00-07:00...17:00',
  `hora3` varchar(20) NOT NULL DEFAULT 'N/A' COMMENT '07:00...17:00-07:00...17:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `thorarios`
--

INSERT INTO `thorarios` (`id`, `email`, `dia1`, `dia2`, `dia3`, `hora1`, `hora2`, `hora3`) VALUES
(1, 'prueba', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(2, 'manuel.perez-e@mail.escuelaing.edu.co', 'Lunes', 'Lunes', 'Lunes', '8', '8', '8'),
(3, 'juan.gonzales@mail.escuelaing.edu.co', 'Martes', 'Miercoles', 'Viernes', '10', '12', '14'),
(45, '76672', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(46, '76682', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(47, '76684', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(48, '76698', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(49, '76700', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(50, '76706', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(51, '76740', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(52, '76742', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(53, '76743', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(54, '76747', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(55, '76748', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(56, '76753', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(57, '76779', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(58, '76781', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(59, '76784', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(60, '76793', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(61, '76800', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(62, '76803', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(63, '76815', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(64, '76819', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(65, '76828', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(66, '76834', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(67, '76836', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(68, '76853', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(69, '76856', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(70, '76866', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(71, '76876', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(72, '76877', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(73, '76878', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(74, '76883', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(75, '76885', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(76, '76886', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(77, '76887', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(78, '76888', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(79, '76895', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(80, '76901', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(81, '76903', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(82, '76913', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(83, '76916', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(84, '76928', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(85, '76931', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `GLOBAL`
--
ALTER TABLE `GLOBAL`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tcupos`
--
ALTER TABLE `tcupos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `testudiantes`
--
ALTER TABLE `testudiantes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`email`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `thorarios`
--
ALTER TABLE `thorarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_2` (`email`),
  ADD KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `GLOBAL`
--
ALTER TABLE `GLOBAL`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tcupos`
--
ALTER TABLE `tcupos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `testudiantes`
--
ALTER TABLE `testudiantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;
--
-- AUTO_INCREMENT de la tabla `thorarios`
--
ALTER TABLE `thorarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;