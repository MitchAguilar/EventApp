-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.21-log - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para mydb
CREATE DATABASE IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mydb`;

-- Volcando estructura para procedimiento mydb.consultar_usuario
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_usuario`(
	IN `user` VARCHAR(50),
	IN `pass` VARCHAR(50)
)
BEGIN
	select * from usuario where usuario=md5(user) and clave=md5(pass);
END//
DELIMITER ;

-- Volcando estructura para procedimiento mydb.registrar_persona
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_persona`(
	IN `id` VARCHAR(50),
	IN `apel` VARCHAR(100),
	IN `corr` VARCHAR(100),
	IN `celu` VARCHAR(50),
	IN `cla` VARCHAR(50)
)
BEGIN
	insert into persona(identificacion,nombre,apellido,correo,celular)
	values(id,apel,corr,celu,cla);
	insert into usuario(usuario,clave,rol,persona) values
	(MD5(corr),MD5(cla),2,
	(cast((SELECT MAX(idPersona) AS idPersona FROM persona) as char)));
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
