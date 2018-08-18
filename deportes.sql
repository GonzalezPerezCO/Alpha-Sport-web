-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 18-08-2018 a las 01:25:58
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
(1, 'prueba', 'Lunes', 'Martes', 'Miercoles', '8', '9', '9'),
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
-- AUTO_INCREMENT de la tabla `thorarios`
--
ALTER TABLE `thorarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;