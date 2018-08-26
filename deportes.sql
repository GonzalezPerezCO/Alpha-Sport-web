-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 26-08-2018 a las 10:45:59
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
(1, 12, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 1, 0, 5, 8, 2, 0, 5, 0, 0, 0, 0, 0, 11, 0, 0, 0, 0, 0, 0, 0, 1, 9, 0, 0, 0, 0, 0, 0, 0, 1),
(2, 12, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 1, 0, 5, 8, 2, 0, 5, 0, 0, 0, 0, 0, 11, 0, 0, 0, 0, 0, 0, 0, 1, 9, 0, 0, 0, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `testudiantes`
--

CREATE TABLE `testudiantes` (
  `id` int(11) NOT NULL,
  `hora` time DEFAULT NULL COMMENT 'hora de inscripcion',
  `hora2` time NOT NULL DEFAULT '00:00:00',
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

INSERT INTO `testudiantes` (`id`, `hora`, `hora2`, `reserva`, `nombre`, `apellido`, `codigo`, `carrera`, `semestre`, `email`, `documento`, `ultimo_periodo`, `password`, `bloqueado`, `observacion`) VALUES
(1, '00:00:01', '23:59:59', NULL, 'Nombre Prueba', 'Apellido Prueba', 10101, 'Ingeniería de Sistemas', 99, 'prueba', NULL, NULL, '000', 0, NULL),
(46, '07:37:00', '07:10:00', 76672, 'CRISTIAN NICOLAS', 'CARDENAS HINCAPIE', 2125268, 'IngenierÃ­a Civil', 6, 'cristian.cardenas-h@mail.escuelaing.edu.co', 1026296500, NULL, 'CNCH@2008', 0, NULL),
(47, '07:10:00', '07:20:00', 76682, 'SANTIAGO ANDRES', 'VEGA CARRILLO', 2145829, 'IngenierÃ­a civil', 3, 'Santiago.vega-c@mail.escuelaing.edu.co', 1192784168, NULL, 'TAYSON2000', 0, NULL),
(48, '07:20:00', '07:30:00', 76684, 'JUAN ANDRES', 'CAVIEDES NUÑEZ', 2161656, 'Matematicas', 2, 'Juan.caviedes@mail.escuelaing.edu.co', 1000696996, NULL, 'Ju1656ca', 0, NULL),
(49, '07:30:00', '07:40:00', 76698, 'JUAN DAVID', 'BURGOS FRANCO', 2141640, 'Ingenieria Mecanica', 5, 'juan.burgos-f@mail.escuelaing.edu.co', 1233904191, NULL, 'HESOYAM13200108', 0, NULL),
(50, '07:40:00', '07:50:00', 76700, 'LEIDY JILLYANA', 'POVEDA CELIS', 76700, 'ingenieria industrial', 4, 'leidy.poveda@mail.escuelaing.edu.co', 1000576745, NULL, 'Sebastianpoveda0621', 0, NULL),
(51, '07:50:00', '08:00:00', 76706, 'ERICK', 'NARANJO ROJAS', 2161462, 'IngenierÃ­a electrÃ³nica ', 2, 'erick.naranjo@mail.escuelaing.edu.co', 1000851003, NULL, 'Er1462na', 0, NULL),
(52, '08:00:00', '08:10:00', 76740, 'ANDRES FERNANDO', 'CUELLAR HUERFANO', 2096521, 'ingenieria industrial', 4, 'andres.cuellar@mail.escuelaing.edu.co', 1071630360, NULL, '310782america', 0, NULL),
(53, '08:10:00', '08:20:00', 76742, 'DAVID SANTIAGO', 'HERNANDEZ SEPULVEDA', NULL, NULL, NULL, '76742', NULL, NULL, '76742', 0, NULL),
(54, '08:20:00', '08:30:00', 76743, 'NICOLLE VALENTINA', 'TORRES PINILLA', 2124974, 'IngenierÃ­a civil', 5, 'nicolle.torres@mail.escuelaing.edu.co', 1022438051, NULL, 'Nicolvaletp09', 0, NULL),
(55, '08:30:00', '08:40:00', 76747, 'EDUARD FELIPE', 'ALVAREZ HERNANDEZ', 76747, 'IngenierÃ­a Civil', 2, 'eduard.alvarez@mail.escuelaing.edu.co', 1010011490, NULL, '1808Pipe', 0, NULL),
(56, '08:40:00', '08:50:00', 76748, 'ANDRES GUILLERMO', 'ROCHA MENDEZ', 2147562, 'IngenierÃ­a de Sistemas', 4, 'andres.rocha@mail.escuelaing.edu.co', 1000076035, NULL, 'campeong12', 0, NULL),
(57, '08:50:00', '09:00:00', 76753, 'CESAR DAVID', 'VILLAMIL RAMOS', 2120166, 'Ingenieria de sistemas', 5, 'cesar.villamil@mail.escuelaing.edu.co ', 1016102219, NULL, 'nicolleycesar0912', 0, NULL),
(58, '09:00:00', '09:10:00', 76779, 'ASTRID MILENA', 'ROZO CARRILLO', NULL, NULL, NULL, '76779', NULL, NULL, '76779', 0, NULL),
(59, '09:10:00', '09:20:00', 76781, 'ERESMITH', 'VERGEL VILLERO', 2120221, 'INCI', 4, 'astrid.rozo@mail.escuelaing.edu.co', 1072712530, NULL, 'Astrid2309', 0, NULL),
(60, '09:20:00', '09:30:00', 76784, 'DANIEL SMITHSON', 'CHAPARRO CARAUCHE', 2150813, 'IngenierÃ­a civil ', 4, 'daniel.chaparro-c@mail.escuelaing', 1018512132, NULL, '1234danielgym', 0, NULL),
(61, '09:30:00', '09:40:00', 76793, 'JHOHAN MIGUEL', 'ROJAS PALACIOS', 2128219, 'ingenieria civil', 5, 'Jhohan.rojas@mail.escuelaing.edu.co', 1015480906, NULL, 'Ingenieria99', 0, NULL),
(62, '09:40:00', '09:50:00', 76800, 'FORTUNATO JOSE', 'CHADID MENDEZ', NULL, NULL, NULL, '76800', NULL, NULL, '76800', 0, NULL),
(63, '09:50:00', '10:00:00', 76803, 'CAMILO ANDRES ', 'GONZALEZ BERNAL', NULL, NULL, NULL, '76803', NULL, NULL, '76803', 0, NULL),
(64, '10:00:00', '10:10:00', 76815, 'ANDERSON', 'VIVAS MORENO', NULL, NULL, NULL, '76815', NULL, NULL, '76815', 0, NULL),
(65, '10:10:00', '10:20:00', 76819, 'KAREN SOFIA', 'UÑATE GONZALEZ', NULL, NULL, NULL, '76819', NULL, NULL, '76819', 0, NULL),
(66, '10:20:00', '10:30:00', 76828, 'MARIA JOSE', 'VILA VIZCANO', 2106904, 'IngenierÃ­a mecÃ¡nica ', 8, 'maria.vila@mail.escuelaing.edu.co', 1032488937, NULL, 'majo', 0, NULL),
(67, '10:30:00', '10:40:00', 76834, 'PAULA ANDREA', 'PULIDO SUAREZ', 76834, 'ingenieria industrial', 6, 'paula.pulido@mail.escuelaing.edu.co', 1030692931, NULL, '12345', 0, NULL),
(68, '10:40:00', '10:50:00', 76836, 'JUAN CAMILO', 'LOZANO MONTOYA', 2162831, 'especializacion estructuras', 1, 'juan.lozano-mo@mail.escuelaing.edu.co', 1110507486, NULL, '13j05C28l', 0, NULL),
(69, '10:50:00', '11:00:00', 76853, 'JUAN SEBASTIAN', 'CADVID PERALTA', 2161311, 'Sistemas', 2, 'juan.cadavid-p@mail.escuelaing.edu.co', 1000238552, NULL, 'JuA1000238552n', 0, NULL),
(70, '11:00:00', '11:10:00', 76856, 'JAIRO	hora', 'PINEDA RIAÑO', 2103203, 'ingenierÃ­a industrial ', 10, 'jairo.pineda@mail.escuelaing.edu.co', 1030658880, NULL, 'JAIROluna<3', 0, NULL),
(71, '11:10:00', '11:20:00', 76866, 'NICOLAS YESID', 'VARGAS LEMUS', 2129677, 'IngenierÃ­a civil', 5, 'nicolas.vargas-l@mail.escuelaing.edu.co', 1015477518, NULL, 'Relajado741', 0, NULL),
(72, '11:20:00', '11:30:00', 76876, 'JHON ALEJANDRO', 'LASSO BUESAQUILLO', 2132422, 'IngenierÃ­a Industrial', 6, 'jhon.lasso@mail.escuelaing.edu.co', 1024596429, NULL, 'algodontierno28', 0, NULL),
(73, '11:30:00', '11:40:00', 76877, 'JAIRO ANDRES', 'AVILA BUITRAGO', NULL, NULL, NULL, '76877', NULL, NULL, '76877', 0, NULL),
(74, '11:40:00', '11:50:00', 76878, 'RODNEY YULIAN', 'FLOREZ TELLEZ', 2155132, 'IngenierÃ­a Ambiental ', 3, 'rodney.florez@mail.escuelaing.edu.co', 1018510141, NULL, 'rodneyrey123', 0, NULL),
(75, '11:50:00', '12:00:00', 76883, 'GUSTAVO ANDRES', 'BOHORQUEZ BENITEZ', 2108089, 'INGENIERIA CIVIL', 8, 'gustavo.bohorquez@mail.escuelaing.edu.co', 1020830157, NULL, '1020830157', 0, NULL),
(76, '12:00:00', '12:10:00', 76885, 'ANDRES MATEO', 'JIMENEZ HERRERA', 2155156, 'IngenierÃ­a ElÃ©ctrica ', 4, 'andres.jimenez-h@mail.escuelaing.edu.co', 1075690356, NULL, 'Mateojim.9', 0, NULL),
(77, '12:10:00', '12:20:00', 76886, 'ANDRES FELIPE', 'MARIN MOSQUERA', 2156333, 'IngenierÃ­a ElÃ©ctrica', 3, 'andres.marin-m@mail.escuelaing.edu.co', 1001089748, NULL, '3162213247A', 0, NULL),
(78, '12:20:00', '12:30:00', 76887, 'LISANDRO', 'RESTREPO VAZQUEZ', 2109429, 'ING civil', 6, 'lizandro.restrepo@mail.escueling.edu.co', 1077089842, NULL, 'andresrestrepo', 0, NULL),
(79, '12:30:00', '12:40:00', 76888, 'LUIS FELIPE', 'CABRERA LOPEZ', 2163321, 'ingenieria industrial', 1, 'luis.cabrera-l@mail.escuelaing.edu.co', 1010121275, NULL, 'Felipe10', 0, NULL),
(80, '12:40:00', '12:50:00', 76895, 'LEONARDO DAVID', 'OSPINO REALES', 2138856, 'IngenierÃ­a Industrial', 5, 'leonardo.ospino@mail.escuelaing.edu.co', 1065633009, NULL, 'nuncajamas2015', 0, NULL),
(81, '12:50:00', '13:00:00', 76901, 'JOHAN SEBASTIAN', 'TORRES MARTINEZ', 2121677, 'ingenieria civil', 7, 'johan.torres-ma@mail.escuelaing.edu.co', 1032503935, NULL, 'SebastianTorres', 0, NULL),
(82, '13:00:00', '13:10:00', 76903, 'SERGIO NICOLAS', 'RAMOS MOYA', 2134996, 'ingenierÃ­a mecÃ¡nica', 6, 'sergio.ramos-m@mail.escuelaing.edu.co', 1075876655, NULL, 'rememberthedream', 0, NULL),
(83, '13:10:00', '13:20:00', 76913, 'JOHAN SEBASTIAN', 'HERRERA ORTEGA', NULL, NULL, NULL, '76913', NULL, NULL, '76913', 0, NULL),
(84, '13:20:00', '13:30:00', 76916, 'DIEGO ALEJANDRO', 'GOMEZ HERNANDEZ', 2130033, 'IngenierÃ­a Industrial', 3, 'diego.gomez-he@mail.escuelaing.edu.co', 1121955813, NULL, 'Diego3005686018', 0, NULL),
(85, '13:30:00', '13:40:00', 76928, 'MIGUEL ANGEL ', 'MARTINEZ MORALES', 2161745, 'IngenierÃ­a Civil', 2, 'miguel.martinez@mail.escuelaing.edu.co', 1121957292, NULL, 'miguelmartinez123', 0, NULL),
(86, '13:40:00', '13:50:00', 76931, 'MICHAEL STIVEN', 'GAMBOA SUESCA', 76931, 'Ingenieria Industrial', 4, 'michael.gamboa@mail.escuelaing.edu.co', 1002393615, NULL, '1002393615', 0, NULL);

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
(45, 'cristian.cardenas-h@mail.escuelaing.edu.co', 'Miercoles', 'Jueves', 'Viernes', '14', '16', '14'),
(46, 'Santiago.vega-c@mail.escuelaing.edu.co', 'Martes', 'Miercoles', 'Jueves', '14', '15', '15'),
(47, 'Juan.caviedes@mail.escuelaing.edu.co', 'Miercoles', 'N/A', 'N/A', '8', 'N/A', 'N/A'),
(48, 'juan.burgos-f@mail.escuelaing.edu.co', 'Miercoles', 'Viernes', 'N/A', '9', '16', 'N/A'),
(49, 'leidy.poveda@mail.escuelaing.edu.co', 'Martes', 'Miercoles', 'Jueves', '15', '15', '15'),
(50, 'erick.naranjo@mail.escuelaing.edu.co', 'Martes', 'Miercoles', 'Jueves', '14', '15', '14'),
(51, 'andres.cuellar@mail.escuelaing.edu.co', 'Martes', 'Jueves', 'Viernes', '14', '16', '14'),
(52, '76742', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(53, 'nicolle.torres@mail.escuelaing.edu.co', 'Miercoles', 'Jueves', 'Viernes', '16', '14', '16'),
(54, 'eduard.alvarez@mail.escuelaing.edu.co', 'Lunes', 'Miercoles', 'Viernes', '8', '8', '8'),
(55, 'andres.rocha@mail.escuelaing.edu.co', 'Miercoles', 'Jueves', 'N/A', '11', '16', 'N/A'),
(56, 'cesar.villamil@mail.escuelaing.edu.co ', 'Viernes', 'Miercoles', 'N/A', '16', '11', 'N/A'),
(57, '76779', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(58, 'astrid.rozo@mail.escuelaing.edu.co', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(59, 'daniel.chaparro-c@mail.escuelaing', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(60, 'Jhohan.rojas@mail.escuelaing.edu.co', 'Lunes', 'Miercoles', 'N/A', '16', '15', 'N/A'),
(61, '76800', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(62, '76803', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(63, '76815', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(64, '76819', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(65, 'maria.vila@mail.escuelaing.edu.co', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(66, 'paula.pulido@mail.escuelaing.edu.co', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(67, 'juan.lozano-mo@mail.escuelaing.edu.co', 'Lunes', 'Martes', 'Jueves', '16', '14', '14'),
(68, 'juan.cadavid-p@mail.escuelaing.edu.co', 'Jueves', 'Viernes', 'N/A', '16', '16', 'N/A'),
(69, 'jairo.pineda@mail.escuelaing.edu.co', 'Martes', 'Jueves', 'N/A', '15', '15', 'N/A'),
(70, 'nicolas.vargas-l@mail.escuelaing.edu.co', 'N/A', 'Jueves', 'Miercoles', 'N/A', '14', '16'),
(71, 'jhon.lasso@mail.escuelaing.edu.co', 'Lunes', 'N/A', 'Jueves', '16', 'N/A', '15'),
(72, '76877', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(73, 'rodney.florez@mail.escuelaing.edu.co', 'Martes', 'Jueves', 'Viernes', '14', '8', '8'),
(74, 'gustavo.bohorquez@mail.escuelaing.edu.co', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(75, 'andres.jimenez-h@mail.escuelaing.edu.co', 'N/A', 'Jueves', 'N/A', 'N/A', '14', 'N/A'),
(76, 'andres.marin-m@mail.escuelaing.edu.co', 'Lunes', 'Martes', 'Jueves', '8', '14', '14'),
(77, 'lizandro.restrepo@mail.escueling.edu.co', 'Martes', 'Miercoles', 'Jueves', '14', '8', '15'),
(78, 'luis.cabrera-l@mail.escuelaing.edu.co', 'N/A', 'Jueves', 'Viernes', 'N/A', '16', '16'),
(79, 'leonardo.ospino@mail.escuelaing.edu.co', 'Martes', 'Miercoles', 'Jueves', '8', '8', '8'),
(80, 'johan.torres-ma@mail.escuelaing.edu.co', 'Martes', 'Jueves', 'N/A', '16', '16', 'N/A'),
(81, 'sergio.ramos-m@mail.escuelaing.edu.co', 'Miercoles', 'N/A', 'N/A', '15', 'N/A', 'N/A'),
(82, '76913', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(83, 'diego.gomez-he@mail.escuelaing.edu.co', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(84, 'miguel.martinez@mail.escuelaing.edu.co', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(85, 'michael.gamboa@mail.escuelaing.edu.co', 'Jueves', 'Miercoles', 'Martes', '16', '9', '8');

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;