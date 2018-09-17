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

/* EJEMPLOS USO PROCEDIMIENTOS

-- Procedure Add Estudiante
call addEstud(9999, 'Prueba Nombre', 'Prueba Apellido', 112233, 'Prueba Carrera', 10, 'prueba@mail.com', 555555555, '000', 0, 'ninguna obs')

-- Procedure Add registro de hora en un dia dado
call addHora(8,'lunes','prueba');

-- Procedure Add registro de un estudiante con horas escogidas
call addHorario(8,'lunes','prueba');

-- Procedure Check si hay cupos en la hora dada
call haycupo('8','lunes', @cupo);
select @cupo;

-- Procedure Muestra un estudiante especifico




*/
