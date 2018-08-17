-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 17-08-2018 a las 16:15:01
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
  `lunesf7` int(11) NOT NULL DEFAULT '0',
  `lunesf8` int(11) NOT NULL DEFAULT '0',
  `lunesf9` int(11) NOT NULL DEFAULT '0',
  `lunesf10` int(11) NOT NULL DEFAULT '0',
  `lunesf11` int(11) NOT NULL DEFAULT '0',
  `lunesf12` int(11) NOT NULL DEFAULT '0',
  `lunesf13` int(11) NOT NULL DEFAULT '0',
  `lunesf14` int(11) NOT NULL DEFAULT '0',
  `lunesf15` int(11) NOT NULL DEFAULT '0',
  `lunesf16` int(11) NOT NULL DEFAULT '0',
  `martesf7` int(11) NOT NULL DEFAULT '0',
  `martesf8` int(11) NOT NULL DEFAULT '0',
  `martesf9` int(11) NOT NULL DEFAULT '0',
  `martesf10` int(11) NOT NULL DEFAULT '0',
  `martesf11` int(11) NOT NULL DEFAULT '0',
  `martesf12` int(11) NOT NULL DEFAULT '0',
  `martesf13` int(11) NOT NULL DEFAULT '0',
  `martesf14` int(11) NOT NULL DEFAULT '0',
  `martesf15` int(11) NOT NULL DEFAULT '0',
  `martesf16` int(11) NOT NULL DEFAULT '0',
  `miercolesf7` int(11) NOT NULL DEFAULT '0',
  `miercolesf8` int(11) NOT NULL DEFAULT '0',
  `miercolesf9` int(11) NOT NULL DEFAULT '0',
  `miercolesf10` int(11) NOT NULL DEFAULT '0',
  `miercolesf11` int(11) NOT NULL DEFAULT '0',
  `miercolesf12` int(11) NOT NULL DEFAULT '0',
  `miercolesf13` int(11) NOT NULL DEFAULT '0',
  `miercolesf14` int(11) NOT NULL DEFAULT '0',
  `miercolesf15` int(11) NOT NULL DEFAULT '0',
  `miercolesf16` int(11) NOT NULL DEFAULT '0',
  `juevesf7` int(11) NOT NULL DEFAULT '0',
  `juevesf8` int(11) NOT NULL DEFAULT '0',
  `juevesf9` int(11) NOT NULL DEFAULT '0',
  `juevesf10` int(11) NOT NULL DEFAULT '0',
  `juevesf11` int(11) NOT NULL DEFAULT '0',
  `juevesf12` int(11) NOT NULL DEFAULT '0',
  `juevesf13` int(11) NOT NULL DEFAULT '0',
  `juevesf14` int(11) NOT NULL DEFAULT '0',
  `juevesf15` int(11) NOT NULL DEFAULT '0',
  `juevesf16` int(11) NOT NULL DEFAULT '0',
  `viernesf7` int(11) NOT NULL DEFAULT '0',
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

INSERT INTO `tcupos` (`id`, `lunesf7`, `lunesf8`, `lunesf9`, `lunesf10`, `lunesf11`, `lunesf12`, `lunesf13`, `lunesf14`, `lunesf15`, `lunesf16`, `martesf7`, `martesf8`, `martesf9`, `martesf10`, `martesf11`, `martesf12`, `martesf13`, `martesf14`, `martesf15`, `martesf16`, `miercolesf7`, `miercolesf8`, `miercolesf9`, `miercolesf10`, `miercolesf11`, `miercolesf12`, `miercolesf13`, `miercolesf14`, `miercolesf15`, `miercolesf16`, `juevesf7`, `juevesf8`, `juevesf9`, `juevesf10`, `juevesf11`, `juevesf12`, `juevesf13`, `juevesf14`, `juevesf15`, `juevesf16`, `viernesf7`, `viernesf8`, `viernesf9`, `viernesf10`, `viernesf11`, `viernesf12`, `viernesf13`, `viernesf14`, `viernesf15`, `viernesf16`) VALUES
(1, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `testudiantes`
--

CREATE TABLE `testudiantes` (
  `id` int(11) NOT NULL,
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

INSERT INTO `testudiantes` (`id`, `reserva`, `nombre`, `apellido`, `codigo`, `carrera`, `semestre`, `email`, `documento`, `ultimo_periodo`, `password`, `bloqueado`, `observacion`) VALUES
(1, NULL, 'Nombre Prueba', 'Apellido Prueba', 10101, 'Ingeniería de Sistemas', 99, 'prueba', NULL, NULL, '000', 0, NULL),
(2, NULL, 'Manuel Sergio', 'Perez Espitia', 2095112, 'Ingenieria de Sistemas', 10, 'manuel.perez-e@mail.escuelaing.edu.co', NULL, NULL, '000', 0, 'Ninguna Ob--'),
(4, NULL, 'Juan Francisco', 'Gonzalez Rojas', 2081391, 'Ingeniería de Sistemas', 10, 'juan.gonzales@mail.escuelaing.edu.co', NULL, NULL, '000', 0, 'Ninguna para Juan G.');

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
(1, 'manuel.perez-e@mail.escuelaing.edu.co', 'Lunes', 'Lunes', 'Lunes', '7:00', '7:00', '7:00'),
(2, 'prueba', 'Martes', 'Lunes', 'Jueves', '13:00', '9:00', '15:00'),
(3, 'juan.gonzales@mail.escuelaing.edu.co', 'Martes', 'Miercoles', 'Viernes', '10:00', '12:00', '14:00');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `testudiantes`
--
ALTER TABLE `testudiantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `thorarios`
--
ALTER TABLE `thorarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;