SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Procedure Add Estudiante
DELIMITER $$
CREATE DEFINER=`admin`@`localhost` PROCEDURE `addEstud` (IN `reserva` INT(11), IN `nombre` VARCHAR(100), IN `apellido` VARCHAR(100), IN `codigo` INT(11), IN `carrera` VARCHAR(100), IN `semestre` INT(11), IN `email` VARCHAR(100), IN `docu` INT(11), IN `passw` VARCHAR(100), IN `bloq` TINYINT(1), IN `obser` VARCHAR(300))  MODIFIES SQL DATA
INSERT INTO `testudiantes` 
(`reserva`, `nombre`, `apellido`, `codigo`, `carrera`, `semestre`, `email`, `documento`, `password`, `bloqueado`, `observacion`) 
VALUES   
(reserva, nombre, apellido, codigo, carrera, semestre, email, docu, passw, bloq, obser)$$

-- Procedure Add registro de hora en un dia dado
CREATE DEFINER=`admin`@`localhost` PROCEDURE `addHora` (IN `hora` INT(10), IN `dia` VARCHAR(15), IN `email` VARCHAR(50))  MODIFIES SQL DATA
BEGIN 
    SET @q = CONCAT('UPDATE tncupo SET ',dia,'=',dia,'-1 WHERE id= ',hora);
    PREPARE stmt FROM @q;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
    
    INSERT INTO `thorarios`(`email`, `dia1`,`hora1`) VALUES (email, dia, hora);
END$$

-- Procedure Add registro de un estudiante con horas escogidas
CREATE DEFINER=`admin`@`localhost` PROCEDURE `addHorario` (IN `hora` INT(11), IN `dia` VARCHAR(15), IN `email` VARCHAR(50))  MODIFIES SQL DATA
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

-- Procedure Check si hay cupos en la hora dada
CREATE DEFINER=`admin`@`localhost` PROCEDURE `hayCupo` (IN `hora` INT(10), IN `dia` VARCHAR(15), OUT `cupo` INT(10))  MODIFIES SQL DATA
BEGIN
	SET @c = 0;
	SET @q = CONCAT('SELECT ',dia,' INTO @c FROM tncupo WHERE id= ',hora);
    PREPARE stmt FROM @q;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
    SET cupo = @c;
END$$

-- Procedure Muestra un estudiante especifico
CREATE DEFINER=`admin`@`localhost` PROCEDURE `showEstud` (IN `idEstud` INT(11))  READS SQL DATA
    DETERMINISTIC
SELECT * FROM deportes.testudiantes WHERE id = idEstud$$

DELIMITER ;

-- Tabla con cupos disponibles
CREATE TABLE `tncupo` (
  `id` int(11) NOT NULL,
  `lunes` int(15) NOT NULL,
  `martes` int(15) NOT NULL,
  `miercoles` int(15) NOT NULL,
  `jueves` int(15) NOT NULL,
  `viernes` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tncupo` (`id`, `lunes`, `martes`, `miercoles`, `jueves`, `viernes`) VALUES
(8, 13, 12, 12, 13, 11),
(9, 0, 0, 4, 0, 0),
(10, 0, 0, 0, 0, 0),
(11, 0, 0, 7, 0, 0),
(12, 0, 0, 0, 0, 0),
(13, 0, 0, 0, 0, 0),
(14, 0, 8, 1, 6, 2),
(15, 0, 2, 5, 6, 0),
(16, 3, 6, 3, 8, 6);


ALTER TABLE `tncupo`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `tncupo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
