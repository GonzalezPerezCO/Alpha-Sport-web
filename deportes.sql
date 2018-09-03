SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


DELIMITER $$
CREATE DEFINER=`admin`@`localhost` PROCEDURE `addEstud` (IN `reserva` INT(11), IN `nombre` VARCHAR(100), IN `apellido` VARCHAR(100), IN `codigo` INT(11), IN `carrera` VARCHAR(100), IN `semestre` INT(11), IN `email` VARCHAR(100), IN `docu` INT(11), IN `passw` VARCHAR(100), IN `bloq` TINYINT(1), IN `obser` VARCHAR(300))  MODIFIES SQL DATA
INSERT INTO deportes.testudiantes
(`reserva`, `nombre`, `apellido`, `codigo`, `carrera`, `semestre`, `email`, `documento`, `password`, `bloqueado`, `observacion`) 
VALUES 
(reserva, nombre, apellido, codigo, carrera, semestre, email, docu, passw, bloq, obser)$$

CREATE DEFINER=`admin`@`localhost` PROCEDURE `addHorar` (IN `email` VARCHAR(100), IN `dia1` VARCHAR(15), IN `dia2` VARCHAR(15), IN `dia3` VARCHAR(15), IN `hora1` VARCHAR(20), IN `hora2` VARCHAR(20), IN `hora3` VARCHAR(20))  MODIFIES SQL DATA
SELECT * FROM tcupos WHERE id = 1$$

CREATE DEFINER=`admin`@`localhost` PROCEDURE `showCupos` ()  READS SQL DATA
    DETERMINISTIC
SELECT * FROM tcupos$$

CREATE DEFINER=`admin`@`localhost` PROCEDURE `showEstud` (IN `idEstud` INT(11))  READS SQL DATA
    DETERMINISTIC
SELECT * FROM deportes.testudiantes WHERE id = idEstud$$

DELIMITER ;

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

INSERT INTO `GLOBAL` (`id`, `MAX_ESTUDIANTES`, `MAX_NUEVOS`, `MAX_ANTIGUOS`, `MAX_TURNOS_DIA`, `cant_d1`, `cant_d2`, `cant_d3`, `cant_nuevos`, `cant_antiguos`) VALUES
(1, 350, 175, 175, 20, 0, 0, 0, 0, 0);

CREATE TABLE `testudiantes` (
  `id` int(11) NOT NULL,
  `reserva` int(11) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `codigo` int(11) DEFAULT NULL,
  `carrera` varchar(100) DEFAULT NULL,
  `semestre` int(11) DEFAULT NULL,
  `email` varchar(100) NOT NULL COMMENT 'correo de la escuela',
  `documento` int(11) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `bloqueado` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'si esta bloqueado',
  `observacion` varchar(300) DEFAULT NULL COMMENT 'observaciones al estudiante'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `testudiantes` (`id`, `reserva`, `nombre`, `apellido`, `codigo`, `carrera`, `semestre`, `email`, `documento`, `password`, `bloqueado`, `observacion`) VALUES
(1, 76684, 'JUAN ANDRES', 'CAVIEDES NUÑEZ', 2161656, 'Matematicas', 2, 'Juan.caviedes@mail.escuelaing.edu.co', 1000696996, 'Ju1656ca', 0, NULL),
(2, 76698, 'JUAN DAVID', 'BURGOS FRANCO', 2141640, 'Ingenieria Mecanica', 5, 'juan.burgos-f@mail.escuelaing.edu.co', 1233904191, 'HESOYAM13200108', 0, NULL);

CREATE TABLE `thorarios` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `dia1` varchar(15) NOT NULL DEFAULT 'N/A',
  `dia2` varchar(15) NOT NULL DEFAULT 'N/A',
  `dia3` varchar(15) NOT NULL DEFAULT 'N/A',
  `hora1` varchar(20) NOT NULL DEFAULT 'N/A',
  `hora2` varchar(20) NOT NULL DEFAULT 'N/A',
  `hora3` varchar(20) NOT NULL DEFAULT 'N/A'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `thorarios` (`id`, `email`, `dia1`, `dia2`, `dia3`, `hora1`, `hora2`, `hora3`) VALUES
(1, 'juan.burgos-f@mail.escuelaing.edu.co', 'Miercoles', 'Viernes', '', '9', '16', ''),
(2, 'Juan.caviedes@mail.escuelaing.edu.co', 'Miercoles', '', '', '8', '', '');

CREATE TABLE `tncupo` (
  `id` int(11) NOT NULL,
  `lunes` int(15) NOT NULL,
  `martes` int(15) NOT NULL,
  `miercoles` int(15) NOT NULL,
  `jueves` int(15) NOT NULL,
  `viernes` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tncupo` (`id`, `lunes`, `martes`, `miercoles`, `jueves`, `viernes`) VALUES
(8, 5, 0, 1, 7, 0),
(9, 1, 0, 4, 1, 0);


ALTER TABLE `GLOBAL`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `testudiantes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`email`),
  ADD UNIQUE KEY `codigo` (`codigo`);

ALTER TABLE `thorarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

ALTER TABLE `tncupo`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `GLOBAL`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
ALTER TABLE `testudiantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
ALTER TABLE `thorarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
ALTER TABLE `tncupo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
