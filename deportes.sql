-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 12-08-2018 a las 12:59:56
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
  `MAX_TURNOS_DIA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `GLOBAL`
--

INSERT INTO `GLOBAL` (`id`, `MAX_ESTUDIANTES`, `MAX_NUEVOS`, `MAX_ANTIGUOS`, `MAX_TURNOS_DIA`) VALUES
(1, 350, 175, 175, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `testudiantes`
--

CREATE TABLE `testudiantes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `codigo` int(11) DEFAULT NULL,
  `carrera` varchar(1000) DEFAULT NULL,
  `semestre` int(11) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `email` varchar(100) NOT NULL COMMENT 'correo de la escuela',
  `ultimo_periodo` varchar(50) DEFAULT NULL COMMENT 'e.j: 2018-2, 2018-i',
  `password` varchar(100) NOT NULL,
  `bloqueado` tinyint(1) DEFAULT '0' COMMENT 'si esta bloqueado ',
  `observacion` varchar(3000) DEFAULT NULL COMMENT 'observaciones al estudiante'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `testudiantes`
--

INSERT INTO `testudiantes` (`id`, `nombre`, `apellido`, `codigo`, `carrera`, `semestre`, `activo`, `email`, `ultimo_periodo`, `password`, `bloqueado`, `observacion`) VALUES
(1, 'Nombre1 Nombre2', 'Apellido1 Apellido2', 99699699, 'Ingeniería de Sistemas', 12, 1, 'mama', NULL, '000', 0, NULL),
(2, 'Manuel Sergio', 'Pérez Espitia', 2095112, 'Ingeniería de Sistemas', 10, 1, 'manuel.perez-e@mail.escuelaing.edu.co', NULL, '000', 0, 'Ninguna Ob--');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `thorarios`
--

CREATE TABLE `thorarios` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `done` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'si ya hizo horario',
  `dia1` varchar(15) NOT NULL DEFAULT '---' COMMENT 'lunes...sabado',
  `dia2` varchar(15) NOT NULL DEFAULT '---' COMMENT 'lunes...sabado',
  `dia3` varchar(15) NOT NULL DEFAULT '---' COMMENT 'lunes...sabado',
  `hora1` varchar(20) NOT NULL DEFAULT '---' COMMENT '07:00...17:00-07:00...17:00',
  `hora2` varchar(20) NOT NULL DEFAULT '---' COMMENT '07:00...17:00-07:00...17:00',
  `hora3` varchar(20) NOT NULL DEFAULT '---' COMMENT '07:00...17:00-07:00...17:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `thorarios`
--

INSERT INTO `thorarios` (`id`, `email`, `done`, `dia1`, `dia2`, `dia3`, `hora1`, `hora2`, `hora3`) VALUES
(1, 'manuel.perez-e@mail.escuelaing.edu.co', 0, '---', '---', '---', '---', '---', '---'),
(2, 'mama', 0, '---', '---', '---', '---', '---', '---');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `GLOBAL`
--
ALTER TABLE `GLOBAL`
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
-- AUTO_INCREMENT de la tabla `testudiantes`
--
ALTER TABLE `testudiantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `thorarios`
--
ALTER TABLE `thorarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;