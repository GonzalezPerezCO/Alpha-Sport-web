-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 23-09-2018 a las 18:38:01
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

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`deportes`@`localhost` PROCEDURE `addEstud` (IN `reserva` INT(11), IN `nombre` VARCHAR(100), IN `apellido` VARCHAR(100), IN `codigo` INT(11), IN `carrera` VARCHAR(100), IN `semestre` INT(11), IN `email` VARCHAR(100), IN `docu` INT(11), IN `passw` VARCHAR(100), IN `bloq` TINYINT(1), IN `obser` VARCHAR(300))  MODIFIES SQL DATA
INSERT INTO `testudiantes` 
(`reserva`, `nombre`, `apellido`, `codigo`, `carrera`, `semestre`, `email`, `documento`, `password`, `bloqueado`, `observacion`) 
VALUES   
(reserva, nombre, apellido, codigo, carrera, semestre, email, docu, passw, bloq, obser)$$

CREATE DEFINER=`deportes`@`localhost` PROCEDURE `addHora` (IN `hora` INT(10), IN `dia` VARCHAR(15), IN `email` VARCHAR(50))  MODIFIES SQL DATA
BEGIN 
    SET @q = CONCAT('UPDATE tcupos SET ',dia,'=',dia,'-1 WHERE id= ',hora);
    PREPARE stmt FROM @q;
    EXECUTE stmt;
DEALLOCATE PREPARE stmt;
    INSERT INTO `thorarios`(`email`, `dia1`,`hora1`) VALUES (email, dia, hora);
END$$

CREATE DEFINER=`deportes`@`localhost` PROCEDURE `addHorario` (IN `hora` INT(11), IN `dia` VARCHAR(15), IN `email` VARCHAR(50))  MODIFIES SQL DATA
BEGIN
    SET @C = 0;
    CALL hayCupo(hora, dia, @C);
    SELECT @C INTO @cupo;
   
 	IF(@cupo > 0) THEN 
    	CALL addHora(hora, dia, email);
    ELSE
    	SIGNAL SQLSTATE '45000'
    	SET MESSAGE_TEXT = 'No hay cupo';
    END IF;
END$$

CREATE DEFINER=`deportes`@`localhost` PROCEDURE `gen_historial` ()  BEGIN
	-- variables para id_periodo y nombre_periodo
    DECLARE id_p varchar(10);
    DECLARE id_n varchar(60);
    
   	select id_periodo into id_p FROM tperiodos LIMIT 1;
   	select id_nombre into id_n FROM tperiodos LIMIT 1;
    

	-- TEMPORAL CON DATOS   
    CALL temporal_historial();    
    -- FIN TEMPORAL
      
    -- ASIGNAR PERIODO TEMPORAL     
    UPDATE TEMPORAL SET id_periodo =  id_p, id_nombre = id_n;
    -- FIN ASIGNAR
    
    INSERT INTO thistorial(nombre, apellido, codigo, carrera, semestre, email, documento, bloqueado, observacion, fallas, dia1, dia2, dia3, id_periodo, id_nombre) 
    SELECT nombre, apellido, codigo, carrera, semestre, email, documento, bloqueado, observacion, fallas, dia1, dia2, dia3, id_periodo, id_nombre
    FROM TEMPORAL;
        
    DROP TABLE IF EXISTS TEMPORAL;
END$$

CREATE DEFINER=`deportes`@`localhost` PROCEDURE `hayCupo` (IN `hora` INT(10), IN `dia` VARCHAR(15), OUT `cupo` INT(10))  MODIFIES SQL DATA
BEGIN
	SET @c = 0;
	SET @q = CONCAT('SELECT ',dia,' INTO @c FROM tcupos WHERE id= ',hora);
    PREPARE stmt FROM @q;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
    SET cupo = @c;
END$$

CREATE DEFINER=`deportes`@`localhost` PROCEDURE `temporal_historial` ()  MODIFIES SQL DATA
    COMMENT 'crea tabla TEMPORAL para guardar registros'
BEGIN

DROP TABLE IF EXISTS TEMPORAL;

CREATE TABLE TEMPORAL AS 
SELECT nombre, apellido, codigo, carrera, semestre, testudiantes.email AS email, documento, bloqueado, observacion, fallas, dia1, dia2, dia3 
FROM testudiantes INNER JOIN thorarios
ON testudiantes.email = thorarios.email;

ALTER TABLE TEMPORAL
ADD id_periodo varchar(10);

ALTER TABLE TEMPORAL
ADD id_nombre varchar(60);

END$$

DELIMITER ;

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

--
-- Volcado de datos para la tabla `tcupos`
--

INSERT INTO `tcupos` (`id`, `lunes`, `martes`, `miercoles`, `jueves`, `viernes`) VALUES
(8, 12, 12, 12, 13, 11),
(9, 0, 0, 4, 0, 0),
(10, 0, 0, 0, 0, 0),
(11, 0, 0, 7, 0, 0),
(12, 0, 0, 0, 0, 0),
(13, 0, 0, 0, 0, 0),
(14, 0, 8, 1, 6, 2),
(15, 0, 2, 5, 6, 0),
(16, 3, 6, 3, 8, 6);

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
-- Volcado de datos para la tabla `testudiantes`
--

INSERT INTO `testudiantes` (`reserva`, `nombre`, `apellido`, `codigo`, `carrera`, `semestre`, `email`, `documento`, `password`, `bloqueado`, `observacion`, `fallas`) VALUES
(76742, 'DAVID SANTIAGO', 'HERNANDEZ SEPULVEDA', NULL, NULL, NULL, '76742', NULL, '76742', 0, NULL, 0),
(76779, 'ASTRID MILENA', 'ROZO CARRILLO', NULL, NULL, NULL, '76779', NULL, '76779', 0, NULL, 0),
(76800, 'FORTUNATO JOSE', 'CHADID MENDEZ', NULL, NULL, NULL, '76800', NULL, '76800', 0, NULL, 0),
(76803, 'CAMILO ANDRES ', 'GONZALEZ BERNAL', NULL, NULL, NULL, '76803', NULL, '76803', 0, NULL, 0),
(76815, 'ANDERSON', 'VIVAS MORENO', NULL, NULL, NULL, '76815', NULL, '76815', 0, NULL, 0),
(76819, 'KAREN SOFIA', 'UÑATE GONZALEZ', NULL, NULL, NULL, '76819', NULL, '76819', 0, NULL, 0),
(76877, 'JAIRO ANDRES', 'AVILA BUITRAGO', NULL, NULL, NULL, '76877', NULL, '76877', 0, NULL, 0),
(76913, 'JOHAN SEBASTIAN', 'HERRERA ORTEGA', NULL, NULL, NULL, '76913', NULL, '76913', 0, NULL, 0),
(76740, 'ANDRES FERNANDO', 'CUELLAR HUERFANO', 2096521, 'ingenieria industrial', 4, 'andres.cuellar@mail.escuelaing.edu.co', 1071630360, '310782america', 0, NULL, 0),
(76885, 'ANDRES MATEO', 'JIMENEZ HERRERA', 2155156, 'IngenierÃ­a ElÃ©ctrica ', 4, 'andres.jimenez-h@mail.escuelaing.edu.co', 1075690356, 'Mateojim.9', 0, NULL, 0),
(76886, 'ANDRES FELIPE', 'MARIN MOSQUERA', 2156333, 'IngenierÃ­a ElÃ©ctrica', 3, 'andres.marin-m@mail.escuelaing.edu.co', 1001089748, '3162213247A', 0, NULL, 0),
(76748, 'ANDRES GUILLERMO', 'ROCHA MENDEZ', 2147562, 'IngenierÃ­a de Sistemas', 4, 'andres.rocha@mail.escuelaing.edu.co', 1000076035, 'campeong12', 0, NULL, 0),
(76781, 'ERESMITH', 'VERGEL VILLERO', 2120221, 'INCI', 4, 'astrid.rozo@mail.escuelaing.edu.co', 1072712530, 'Astrid2309', 0, NULL, 0),
(76753, 'CESAR DAVID', 'VILLAMIL RAMOS', 2120166, 'Ingenieria de sistemas', 5, 'cesar.villamil@mail.escuelaing.edu.co ', 1016102219, 'nicolleycesar0912', 0, NULL, 0),
(76672, 'CRISTIAN NICOLAS', 'CARDENAS HINCAPIE', 2125268, 'IngenierÃ­a Civil', 6, 'cristian.cardenas-h@mail.escuelaing.edu.co', 1026296500, 'CNCH@2008', 0, NULL, 0),
(76784, 'DANIEL SMITHSON', 'CHAPARRO CARAUCHE', 2150813, 'IngenierÃ­a civil ', 4, 'daniel.chaparro-c@mail.escuelaing', 1018512132, '1234danielgym', 0, NULL, 0),
(76916, 'DIEGO ALEJANDRO', 'GOMEZ HERNANDEZ', 2130033, 'IngenierÃ­a Industrial', 3, 'diego.gomez-he@mail.escuelaing.edu.co', 1121955813, 'Diego3005686018', 0, NULL, 0),
(76747, 'EDUARD FELIPE', 'ALVAREZ HERNANDEZ', 76747, 'IngenierÃ­a Civil', 2, 'eduard.alvarez@mail.escuelaing.edu.co', 1010011490, '1808Pipe', 0, NULL, 0),
(76706, 'ERICK', 'NARANJO ROJAS', 2161462, 'IngenierÃ­a electrÃ³nica ', 2, 'erick.naranjo@mail.escuelaing.edu.co', 1000851003, 'Er1462na', 0, NULL, 0),
(76883, 'GUSTAVO ANDRES', 'BOHORQUEZ BENITEZ', 2108089, 'INGENIERIA CIVIL', 8, 'gustavo.bohorquez@mail.escuelaing.edu.co', 1020830157, '1020830157', 0, NULL, 0),
(76856, 'JAIRO	hora', 'PINEDA RIAÑO', 2103203, 'ingenierÃ­a industrial ', 10, 'jairo.pineda@mail.escuelaing.edu.co', 1030658880, 'JAIROluna<3', 0, NULL, 0),
(76793, 'JHOHAN MIGUEL', 'ROJAS PALACIOS', 2128219, 'ingenieria civil', 5, 'Jhohan.rojas@mail.escuelaing.edu.co', 1015480906, 'Ingenieria99', 0, NULL, 0),
(76876, 'JHON ALEJANDRO', 'LASSO BUESAQUILLO', 2132422, 'IngenierÃ­a Industrial', 6, 'jhon.lasso@mail.escuelaing.edu.co', 1024596429, 'algodontierno28', 0, NULL, 0),
(76901, 'JOHAN SEBASTIAN', 'TORRES MARTINEZ', 2121677, 'ingenieria civil', 7, 'johan.torres-ma@mail.escuelaing.edu.co', 1032503935, 'SebastianTorres', 0, NULL, 0),
(76698, 'JUAN DAVID', 'BURGOS FRANCO', 2141640, 'Ingenieria Mecanica', 5, 'juan.burgos-f@mail.escuelaing.edu.co', 1233904191, 'HESOYAM13200108', 0, NULL, 0),
(76853, 'JUAN SEBASTIAN', 'CADVID PERALTA', 2161311, 'Sistemas', 2, 'juan.cadavid-p@mail.escuelaing.edu.co', 1000238552, 'JuA1000238552n', 0, NULL, 0),
(76684, 'JUAN ANDRES', 'CAVIEDES NUÑEZ', 2161656, 'Matematicas', 2, 'Juan.caviedes@mail.escuelaing.edu.co', 1000696996, 'Ju1656ca', 0, NULL, 0),
(76836, 'JUAN CAMILO', 'LOZANO MONTOYA', 2162831, 'especializacion estructuras', 1, 'juan.lozano-mo@mail.escuelaing.edu.co', 1110507486, '13j05C28l', 0, NULL, 0),
(76700, 'LEIDY JILLYANA', 'POVEDA CELIS', 76700, 'ingenieria industrial', 4, 'leidy.poveda@mail.escuelaing.edu.co', 1000576745, 'Sebastianpoveda0621', 0, NULL, 0),
(76895, 'LEONARDO DAVID', 'OSPINO REALES', 2138856, 'IngenierÃ­a Industrial', 5, 'leonardo.ospino@mail.escuelaing.edu.co', 1065633009, 'nuncajamas2015', 0, NULL, 0),
(76887, 'LISANDRO', 'RESTREPO VAZQUEZ', 2109429, 'ING civil', 6, 'lizandro.restrepo@mail.escueling.edu.co', 1077089842, 'andresrestrepo', 0, NULL, 0),
(76888, 'LUIS FELIPE', 'CABRERA LOPEZ', 2163321, 'ingenieria industrial', 1, 'luis.cabrera-l@mail.escuelaing.edu.co', 1010121275, 'Felipe10', 0, NULL, 0),
(76828, 'MARIA JOSE', 'VILA VIZCANO', 2106904, 'IngenierÃ­a mecÃ¡nica ', 8, 'maria.vila@mail.escuelaing.edu.co', 1032488937, 'majo', 0, NULL, 0),
(76931, 'MICHAEL STIVEN', 'GAMBOA SUESCA', 76931, 'Ingenieria Industrial', 4, 'michael.gamboa@mail.escuelaing.edu.co', 1002393615, '1002393615', 0, NULL, 0),
(76928, 'MIGUEL ANGEL ', 'MARTINEZ MORALES', 2161745, 'IngenierÃ­a Civil', 2, 'miguel.martinez@mail.escuelaing.edu.co', 1121957292, 'miguelmartinez123', 0, NULL, 0),
(76866, 'NICOLAS YESID', 'VARGAS LEMUS', 2129677, 'IngenierÃ­a civil', 5, 'nicolas.vargas-l@mail.escuelaing.edu.co', 1015477518, 'Relajado741', 0, NULL, 0),
(76743, 'NICOLLE VALENTINA', 'TORRES PINILLA', 2124974, 'IngenierÃ­a civil', 5, 'nicolle.torres@mail.escuelaing.edu.co', 1022438051, 'Nicolvaletp09', 0, NULL, 0),
(76834, 'PAULA ANDREA', 'PULIDO SUAREZ', 76834, 'ingenieria industrial', 6, 'paula.pulido@mail.escuelaing.edu.co', 1030692931, '12345', 0, NULL, 0),
(NULL, 'Nombre Prueba', 'Apellido Prueba', 10101, 'Ingeniería de Sistemas', 99, 'prueba', NULL, '000', 0, NULL, 0),
(9999, 'Prueba Nombre', 'Prueba Apellido', 112233, 'Prueba Carrera', 10, 'prueba@mail.com', 555555555, '000', 0, 'ninguna obs', 0),
(76878, 'RODNEY YULIAN', 'FLOREZ TELLEZ', 2155132, 'IngenierÃ­a Ambiental ', 3, 'rodney.florez@mail.escuelaing.edu.co', 1018510141, 'rodneyrey123', 0, NULL, 0),
(76682, 'SANTIAGO ANDRES', 'VEGA CARRILLO', 2145829, 'IngenierÃ­a civil', 3, 'Santiago.vega-c@mail.escuelaing.edu.co', 1192784168, 'TAYSON2000', 0, NULL, 0),
(76903, 'SERGIO NICOLAS', 'RAMOS MOYA', 2134996, 'ingenierÃ­a mecÃ¡nica', 6, 'sergio.ramos-m@mail.escuelaing.edu.co', 1075876655, 'rememberthedream', 0, NULL, 0);

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

--
-- Volcado de datos para la tabla `thistorial`
--

INSERT INTO `thistorial` (`nombre`, `apellido`, `codigo`, `carrera`, `semestre`, `email`, `documento`, `bloqueado`, `observacion`, `fallas`, `dia1`, `dia2`, `dia3`, `id_periodo`, `id_nombre`) VALUES
('DAVID SANTIAGO', 'HERNANDEZ SEPULVEDA', NULL, NULL, NULL, '76742', NULL, 0, NULL, 0, 'N/A', 'N/A', 'N/A', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('ASTRID MILENA', 'ROZO CARRILLO', NULL, NULL, NULL, '76779', NULL, 0, NULL, 0, 'N/A', 'N/A', 'N/A', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('FORTUNATO JOSE', 'CHADID MENDEZ', NULL, NULL, NULL, '76800', NULL, 0, NULL, 0, 'N/A', 'N/A', 'N/A', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('CAMILO ANDRES ', 'GONZALEZ BERNAL', NULL, NULL, NULL, '76803', NULL, 0, NULL, 0, 'N/A', 'N/A', 'N/A', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('ANDERSON', 'VIVAS MORENO', NULL, NULL, NULL, '76815', NULL, 0, NULL, 0, 'N/A', 'N/A', 'N/A', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('KAREN SOFIA', 'UÑATE GONZALEZ', NULL, NULL, NULL, '76819', NULL, 0, NULL, 0, 'N/A', 'N/A', 'N/A', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('JAIRO ANDRES', 'AVILA BUITRAGO', NULL, NULL, NULL, '76877', NULL, 0, NULL, 0, 'N/A', 'N/A', 'N/A', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('JOHAN SEBASTIAN', 'HERRERA ORTEGA', NULL, NULL, NULL, '76913', NULL, 0, NULL, 0, 'N/A', 'N/A', 'N/A', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('ANDRES FERNANDO', 'CUELLAR HUERFANO', 2096521, 0, 4, 'andres.cuellar@mail.escuelaing.edu.co', 1071630360, 0, NULL, 0, 'Martes', 'Jueves', 'Viernes', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('ANDRES MATEO', 'JIMENEZ HERRERA', 2155156, 0, 4, 'andres.jimenez-h@mail.escuelaing.edu.co', 1075690356, 0, NULL, 0, 'N/A', 'Jueves', 'N/A', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('ANDRES FELIPE', 'MARIN MOSQUERA', 2156333, 0, 3, 'andres.marin-m@mail.escuelaing.edu.co', 1001089748, 0, NULL, 0, 'Lunes', 'Martes', 'Jueves', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('ANDRES GUILLERMO', 'ROCHA MENDEZ', 2147562, 0, 4, 'andres.rocha@mail.escuelaing.edu.co', 1000076035, 0, NULL, 0, 'Miercoles', 'Jueves', 'N/A', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('ERESMITH', 'VERGEL VILLERO', 2120221, 0, 4, 'astrid.rozo@mail.escuelaing.edu.co', 1072712530, 0, NULL, 0, 'N/A', 'N/A', 'N/A', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('CESAR DAVID', 'VILLAMIL RAMOS', 2120166, 0, 5, 'cesar.villamil@mail.escuelaing.edu.co ', 1016102219, 0, NULL, 0, 'Viernes', 'Miercoles', 'N/A', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('CRISTIAN NICOLAS', 'CARDENAS HINCAPIE', 2125268, 0, 6, 'cristian.cardenas-h@mail.escuelaing.edu.co', 1026296500, 0, NULL, 0, 'Miercoles', 'Jueves', 'Viernes', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('DANIEL SMITHSON', 'CHAPARRO CARAUCHE', 2150813, 0, 4, 'daniel.chaparro-c@mail.escuelaing', 1018512132, 0, NULL, 0, 'N/A', 'N/A', 'N/A', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('DIEGO ALEJANDRO', 'GOMEZ HERNANDEZ', 2130033, 0, 3, 'diego.gomez-he@mail.escuelaing.edu.co', 1121955813, 0, NULL, 0, 'N/A', 'N/A', 'N/A', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('EDUARD FELIPE', 'ALVAREZ HERNANDEZ', 76747, 0, 2, 'eduard.alvarez@mail.escuelaing.edu.co', 1010011490, 0, NULL, 0, 'Lunes', 'Miercoles', 'Viernes', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('ERICK', 'NARANJO ROJAS', 2161462, 0, 2, 'erick.naranjo@mail.escuelaing.edu.co', 1000851003, 0, NULL, 0, 'Martes', 'Miercoles', 'Jueves', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('GUSTAVO ANDRES', 'BOHORQUEZ BENITEZ', 2108089, 0, 8, 'gustavo.bohorquez@mail.escuelaing.edu.co', 1020830157, 0, NULL, 0, 'N/A', 'N/A', 'N/A', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('JAIRO	hora', 'PINEDA RIAÑO', 2103203, 0, 10, 'jairo.pineda@mail.escuelaing.edu.co', 1030658880, 0, NULL, 0, 'Martes', 'Jueves', 'N/A', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('JHOHAN MIGUEL', 'ROJAS PALACIOS', 2128219, 0, 5, 'Jhohan.rojas@mail.escuelaing.edu.co', 1015480906, 0, NULL, 0, 'Lunes', 'Miercoles', 'N/A', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('JHON ALEJANDRO', 'LASSO BUESAQUILLO', 2132422, 0, 6, 'jhon.lasso@mail.escuelaing.edu.co', 1024596429, 0, NULL, 0, 'Lunes', 'N/A', 'Jueves', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('JOHAN SEBASTIAN', 'TORRES MARTINEZ', 2121677, 0, 7, 'johan.torres-ma@mail.escuelaing.edu.co', 1032503935, 0, NULL, 0, 'Martes', 'Jueves', 'N/A', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('JUAN DAVID', 'BURGOS FRANCO', 2141640, 0, 5, 'juan.burgos-f@mail.escuelaing.edu.co', 1233904191, 0, NULL, 0, 'Miercoles', 'Viernes', 'N/A', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('JUAN SEBASTIAN', 'CADVID PERALTA', 2161311, 0, 2, 'juan.cadavid-p@mail.escuelaing.edu.co', 1000238552, 0, NULL, 0, 'Jueves', 'Viernes', 'N/A', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('JUAN ANDRES', 'CAVIEDES NUÑEZ', 2161656, 0, 2, 'Juan.caviedes@mail.escuelaing.edu.co', 1000696996, 0, NULL, 0, 'Miercoles', 'N/A', 'N/A', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('JUAN CAMILO', 'LOZANO MONTOYA', 2162831, 0, 1, 'juan.lozano-mo@mail.escuelaing.edu.co', 1110507486, 0, NULL, 0, 'Lunes', 'Martes', 'Jueves', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('LEIDY JILLYANA', 'POVEDA CELIS', 76700, 0, 4, 'leidy.poveda@mail.escuelaing.edu.co', 1000576745, 0, NULL, 0, 'Martes', 'Miercoles', 'Jueves', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('LEONARDO DAVID', 'OSPINO REALES', 2138856, 0, 5, 'leonardo.ospino@mail.escuelaing.edu.co', 1065633009, 0, NULL, 0, 'Martes', 'Miercoles', 'Jueves', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('LISANDRO', 'RESTREPO VAZQUEZ', 2109429, 0, 6, 'lizandro.restrepo@mail.escueling.edu.co', 1077089842, 0, NULL, 0, 'Martes', 'Miercoles', 'Jueves', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('LUIS FELIPE', 'CABRERA LOPEZ', 2163321, 0, 1, 'luis.cabrera-l@mail.escuelaing.edu.co', 1010121275, 0, NULL, 0, 'N/A', 'Jueves', 'Viernes', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('MARIA JOSE', 'VILA VIZCANO', 2106904, 0, 8, 'maria.vila@mail.escuelaing.edu.co', 1032488937, 0, NULL, 0, 'N/A', 'N/A', 'N/A', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('MICHAEL STIVEN', 'GAMBOA SUESCA', 76931, 0, 4, 'michael.gamboa@mail.escuelaing.edu.co', 1002393615, 0, NULL, 0, 'Jueves', 'Miercoles', 'Martes', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('MIGUEL ANGEL ', 'MARTINEZ MORALES', 2161745, 0, 2, 'miguel.martinez@mail.escuelaing.edu.co', 1121957292, 0, NULL, 0, 'N/A', 'N/A', 'N/A', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('NICOLAS YESID', 'VARGAS LEMUS', 2129677, 0, 5, 'nicolas.vargas-l@mail.escuelaing.edu.co', 1015477518, 0, NULL, 0, 'N/A', 'Jueves', 'Miercoles', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('NICOLLE VALENTINA', 'TORRES PINILLA', 2124974, 0, 5, 'nicolle.torres@mail.escuelaing.edu.co', 1022438051, 0, NULL, 0, 'Miercoles', 'Jueves', 'Viernes', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('PAULA ANDREA', 'PULIDO SUAREZ', 76834, 0, 6, 'paula.pulido@mail.escuelaing.edu.co', 1030692931, 0, NULL, 0, 'N/A', 'N/A', 'N/A', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('Nombre Prueba', 'Apellido Prueba', 10101, 0, 99, 'prueba', NULL, 0, NULL, 0, 'N/A', 'N/A', 'N/A', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('Prueba Nombre', 'Prueba Apellido', 112233, 0, 10, 'prueba@mail.com', 555555555, 0, 'ninguna obs', 0, 'N/A', 'N/A', 'N/A', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('RODNEY YULIAN', 'FLOREZ TELLEZ', 2155132, 0, 3, 'rodney.florez@mail.escuelaing.edu.co', 1018510141, 0, NULL, 0, 'Martes', 'Jueves', 'Viernes', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('SANTIAGO ANDRES', 'VEGA CARRILLO', 2145829, 0, 3, 'Santiago.vega-c@mail.escuelaing.edu.co', 1192784168, 0, NULL, 0, 'Martes', 'Miercoles', 'Jueves', '_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('SERGIO NICOLAS', 'RAMOS MOYA', 2134996, 0, 6, 'sergio.ramos-m@mail.escuelaing.edu.co', 1075876655, 0, NULL, 0, 'Miercoles', 'N/A', 'N/A', '_2018_2_2', 'Periodo 2018-2 prueba piloto');

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

--
-- Volcado de datos para la tabla `thorarios`
--

INSERT INTO `thorarios` (`email`, `dia1`, `dia2`, `dia3`, `hora1`, `hora2`, `hora3`) VALUES
('76742', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
('76779', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
('76800', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
('76803', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
('76815', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
('76819', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
('76877', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
('76913', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
('andres.cuellar@mail.escuelaing.edu.co', 'Martes', 'Jueves', 'Viernes', '14', '16', '14'),
('andres.jimenez-h@mail.escuelaing.edu.co', 'N/A', 'Jueves', 'N/A', 'N/A', '14', 'N/A'),
('andres.marin-m@mail.escuelaing.edu.co', 'Lunes', 'Martes', 'Jueves', '8', '14', '14'),
('andres.rocha@mail.escuelaing.edu.co', 'Miercoles', 'Jueves', 'N/A', '11', '16', 'N/A'),
('astrid.rozo@mail.escuelaing.edu.co', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
('cesar.villamil@mail.escuelaing.edu.co ', 'Viernes', 'Miercoles', 'N/A', '16', '11', 'N/A'),
('cristian.cardenas-h@mail.escuelaing.edu.co', 'Miercoles', 'Jueves', 'Viernes', '14', '16', '14'),
('daniel.chaparro-c@mail.escuelaing', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
('diego.gomez-he@mail.escuelaing.edu.co', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
('eduard.alvarez@mail.escuelaing.edu.co', 'Lunes', 'Miercoles', 'Viernes', '8', '8', '8'),
('erick.naranjo@mail.escuelaing.edu.co', 'Martes', 'Miercoles', 'Jueves', '14', '15', '14'),
('gustavo.bohorquez@mail.escuelaing.edu.co', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
('jairo.pineda@mail.escuelaing.edu.co', 'Martes', 'Jueves', 'N/A', '15', '15', 'N/A'),
('Jhohan.rojas@mail.escuelaing.edu.co', 'Lunes', 'Miercoles', 'N/A', '16', '15', 'N/A'),
('jhon.lasso@mail.escuelaing.edu.co', 'Lunes', 'N/A', 'Jueves', '16', 'N/A', '15'),
('johan.torres-ma@mail.escuelaing.edu.co', 'Martes', 'Jueves', 'N/A', '16', '16', 'N/A'),
('juan.burgos-f@mail.escuelaing.edu.co', 'Miercoles', 'Viernes', 'N/A', '9', '16', 'N/A'),
('juan.cadavid-p@mail.escuelaing.edu.co', 'Jueves', 'Viernes', 'N/A', '16', '16', 'N/A'),
('Juan.caviedes@mail.escuelaing.edu.co', 'Miercoles', 'N/A', 'N/A', '8', 'N/A', 'N/A'),
('juan.lozano-mo@mail.escuelaing.edu.co', 'Lunes', 'Martes', 'Jueves', '16', '14', '14'),
('leidy.poveda@mail.escuelaing.edu.co', 'Martes', 'Miercoles', 'Jueves', '15', '15', '15'),
('leonardo.ospino@mail.escuelaing.edu.co', 'Martes', 'Miercoles', 'Jueves', '8', '8', '8'),
('lizandro.restrepo@mail.escueling.edu.co', 'Martes', 'Miercoles', 'Jueves', '14', '8', '15'),
('luis.cabrera-l@mail.escuelaing.edu.co', 'N/A', 'Jueves', 'Viernes', 'N/A', '16', '16'),
('maria.vila@mail.escuelaing.edu.co', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
('michael.gamboa@mail.escuelaing.edu.co', 'Jueves', 'Miercoles', 'Martes', '16', '9', '8'),
('miguel.martinez@mail.escuelaing.edu.co', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
('nicolas.vargas-l@mail.escuelaing.edu.co', 'N/A', 'Jueves', 'Miercoles', 'N/A', '14', '16'),
('nicolle.torres@mail.escuelaing.edu.co', 'Miercoles', 'Jueves', 'Viernes', '16', '14', '16'),
('paula.pulido@mail.escuelaing.edu.co', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
('prueba', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
('prueba@mail.com', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
('rodney.florez@mail.escuelaing.edu.co', 'Martes', 'Jueves', 'Viernes', '14', '8', '8'),
('Santiago.vega-c@mail.escuelaing.edu.co', 'Martes', 'Miercoles', 'Jueves', '14', '15', '15'),
('sergio.ramos-m@mail.escuelaing.edu.co', 'Miercoles', 'N/A', 'N/A', '15', 'N/A', 'N/A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tperiodos`
--

CREATE TABLE `tperiodos` (
  `id_periodo` varchar(10) NOT NULL COMMENT 'periodo: 2018-i, 2018-2',
  `id_nombre` varchar(60) NOT NULL COMMENT 'nombre: Periodo 2018-i'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tperiodos`
--

INSERT INTO `tperiodos` (`id_periodo`, `id_nombre`) VALUES
('_2018_2_2', 'Periodo 2018-2 prueba piloto'),
('_2018_2_i', 'Periodo 2018-2 de prueba');

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
