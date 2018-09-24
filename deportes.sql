-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 23-09-2018 a las 18:39:27
-- Versión del servidor: 10.1.14-MariaDB
-- Versión de PHP: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
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
-- Estructura de tabla para la tabla `tcupos`
--

CREATE TABLE `tcupos` (
  `id` int(11) UNSIGNED NOT NULL,
  `lunes` int(2) UNSIGNED NOT NULL DEFAULT '0',
  `martes` int(2) UNSIGNED NOT NULL DEFAULT '0',
  `miercoles` int(2) UNSIGNED NOT NULL DEFAULT '0',
  `jueves` int(2) UNSIGNED NOT NULL DEFAULT '0',
  `viernes` int(2) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `testudiantes`
--

CREATE TABLE `testudiantes` (
  `reserva` int(11) UNSIGNED DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `codigo` int(10) UNSIGNED DEFAULT NULL,
  `carrera` varchar(100) DEFAULT NULL,
  `semestre` int(2) UNSIGNED DEFAULT NULL,
  `email` varchar(100) NOT NULL COMMENT 'correo de la escuela',
  `documento` int(11) UNSIGNED DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `bloqueado` tinyint(1) DEFAULT '0' COMMENT '0: false. si esta bloqueado ',
  `observacion` varchar(300) DEFAULT NULL COMMENT 'observaciones al estudiante',
  `fallas` int(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'fallas total del periodo'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Disparadores `testudiantes`
--
DELIMITER $$
CREATE TRIGGER `D_email` AFTER DELETE ON `testudiantes` FOR EACH ROW DELETE FROM thorarios_2018_2_i
WHERE email = OLD.email
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `I_email` AFTER INSERT ON `testudiantes` FOR EACH ROW INSERT INTO thorarios_2018_2_i(email) VALUES (NEW.email)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `U_email` AFTER UPDATE ON `testudiantes` FOR EACH ROW UPDATE thorarios_2018_2_i SET email=NEW.email WHERE email=OLD.email
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `thistorial`
--

CREATE TABLE `thistorial` (
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `codigo` int(10) UNSIGNED DEFAULT NULL,
  `carrera` int(100) DEFAULT NULL,
  `semestre` int(2) UNSIGNED DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `documento` int(11) UNSIGNED DEFAULT NULL,
  `bloqueado` tinyint(1) DEFAULT '0' COMMENT '0: false. si esta bloqueado',
  `observacion` varchar(300) DEFAULT NULL,
  `fallas` int(2) UNSIGNED DEFAULT '0' COMMENT 'fallas del periodo',
  `dia1` varchar(10) DEFAULT 'N/A' COMMENT 'lunes, martes, ..',
  `dia2` varchar(10) DEFAULT 'N/A' COMMENT 'lunes, martes, ..',
  `dia3` varchar(10) DEFAULT 'N/A' COMMENT 'lunes, martes, ..',
  `id_periodo` varchar(10) DEFAULT NULL,
  `id_nombre` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `thorarios`
--

CREATE TABLE `thorarios` (
  `email` varchar(100) NOT NULL,
  `dia1` varchar(10) NOT NULL DEFAULT 'N/A' COMMENT 'lunes...sabado',
  `dia2` varchar(10) NOT NULL DEFAULT 'N/A' COMMENT 'lunes...sabado',
  `dia3` varchar(10) NOT NULL DEFAULT 'N/A' COMMENT 'lunes...sabado',
  `hora1` varchar(6) NOT NULL DEFAULT 'N/A' COMMENT '07:00...17:00-07:00...17:00',
  `hora2` varchar(6) NOT NULL DEFAULT 'N/A' COMMENT '07:00...17:00-07:00...17:00',
  `hora3` varchar(6) NOT NULL DEFAULT 'N/A' COMMENT '07:00...17:00-07:00...17:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tperiodos`
--

CREATE TABLE `tperiodos` (
  `id_periodo` varchar(10) NOT NULL COMMENT 'periodo: 2018-i, 2018-2',
  `id_nombre` varchar(60) NOT NULL COMMENT 'nombre: Periodo 2018-i'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tcupos`
--
ALTER TABLE `tcupos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `testudiantes`
--
ALTER TABLE `testudiantes`
  ADD PRIMARY KEY (`email`),
  ADD UNIQUE KEY `correo` (`email`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `thistorial`
--
ALTER TABLE `thistorial`
  ADD PRIMARY KEY (`email`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `ignore_email` (`email`);

--
-- Indices de la tabla `thorarios`
--
ALTER TABLE `thorarios`
  ADD PRIMARY KEY (`email`),
  ADD KEY `email` (`email`);

--
-- Indices de la tabla `tperiodos`
--
ALTER TABLE `tperiodos`
  ADD PRIMARY KEY (`id_periodo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tcupos`
--
ALTER TABLE `tcupos`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
