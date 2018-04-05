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

-- Volcando estructura para tabla mydb.asistencia
CREATE TABLE IF NOT EXISTS `asistencia` (
  `IDASISTENCIA` int(11) NOT NULL,
  `HORA_ING` datetime NOT NULL,
  `HORA_SAL` datetime NOT NULL,
  `ESTADO` varchar(50) NOT NULL,
  `INSCRIPCION` int(11) NOT NULL,
  PRIMARY KEY (`IDASISTENCIA`),
  KEY `fk_ASISTENCIA_INSCRIPCION1_idx` (`INSCRIPCION`),
  CONSTRAINT `fk_ASISTENCIA_INSCRIPCION1` FOREIGN KEY (`INSCRIPCION`) REFERENCES `inscripcion` (`IDINSCRIPCION`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para procedimiento mydb.consultar_rol
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_rol`(
	IN `id` INT
)
BEGIN
	select rol from usuario where persona=id;
END//
DELIMITER ;

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

-- Volcando estructura para tabla mydb.cronograma
CREATE TABLE IF NOT EXISTS `cronograma` (
  `IDCRONOGRAMA` int(11) NOT NULL AUTO_INCREMENT,
  `HORARIO_INI` datetime NOT NULL,
  `CIERRE` datetime NOT NULL,
  `EVENTO` int(11) NOT NULL,
  `SITIO` int(11) NOT NULL,
  `PONENTE` int(11) NOT NULL,
  PRIMARY KEY (`IDCRONOGRAMA`),
  KEY `fk_CRONOGRAMA_EVENTO1_idx` (`EVENTO`),
  KEY `fk_CRONOGRAMA_SITIO1_idx` (`SITIO`),
  KEY `fk_CRONOGRAMA_PONENTE1_idx` (`PONENTE`),
  CONSTRAINT `fk_CRONOGRAMA_EVENTO1` FOREIGN KEY (`EVENTO`) REFERENCES `evento` (`IDEVENTO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CRONOGRAMA_PONENTE1` FOREIGN KEY (`PONENTE`) REFERENCES `ponente` (`IDPONENTE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CRONOGRAMA_SITIO1` FOREIGN KEY (`SITIO`) REFERENCES `sitio` (`IDSITIO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla mydb.evento
CREATE TABLE IF NOT EXISTS `evento` (
  `IDEVENTO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) NOT NULL,
  `DESCRIPCION` varchar(255) NOT NULL,
  `FECHA_INI` date NOT NULL,
  `FECHA_FIN` date DEFAULT NULL,
  `CERTIFICDO` varchar(100) NOT NULL,
  PRIMARY KEY (`IDEVENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla mydb.inscripcion
CREATE TABLE IF NOT EXISTS `inscripcion` (
  `IDINSCRIPCION` int(11) NOT NULL AUTO_INCREMENT,
  `URL_PAGO` varchar(100) DEFAULT NULL,
  `ESTADO` varchar(20) NOT NULL,
  `EVENTO` int(11) NOT NULL,
  `PARTICIPANTE` int(11) NOT NULL,
  `TIPO_PARTICIPANTE` int(11) NOT NULL,
  PRIMARY KEY (`IDINSCRIPCION`),
  KEY `fk_INSCRIPCION_EVENTO1_idx` (`EVENTO`),
  KEY `fk_INSCRIPCION_USUARIO1_idx` (`PARTICIPANTE`),
  KEY `fk_INSCRIPCION_TIPO_PARTICIPANTE1_idx` (`TIPO_PARTICIPANTE`),
  CONSTRAINT `fk_INSCRIPCION_EVENTO1` FOREIGN KEY (`EVENTO`) REFERENCES `evento` (`IDEVENTO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_INSCRIPCION_TIPO_PARTICIPANTE1` FOREIGN KEY (`TIPO_PARTICIPANTE`) REFERENCES `tipo_participante` (`IDTIPO_PARTICIPANTE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_INSCRIPCION_USUARIO1` FOREIGN KEY (`PARTICIPANTE`) REFERENCES `usuario` (`IDUSUARIO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla mydb.matriales
CREATE TABLE IF NOT EXISTS `matriales` (
  `IDMATRIALES` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(50) NOT NULL,
  PRIMARY KEY (`IDMATRIALES`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla mydb.persona
CREATE TABLE IF NOT EXISTS `persona` (
  `IDPERSONA` int(11) NOT NULL AUTO_INCREMENT,
  `IDENTIFICACION` varchar(10) NOT NULL,
  `NOMBRE` varchar(50) NOT NULL,
  `APELLIDO` varchar(50) NOT NULL,
  `CORREO` varchar(100) NOT NULL,
  `CELULAR` varchar(10) NOT NULL,
  PRIMARY KEY (`IDPERSONA`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla mydb.ponente
CREATE TABLE IF NOT EXISTS `ponente` (
  `IDPONENTE` int(11) NOT NULL,
  `PONENCIA` varchar(255) NOT NULL,
  `ARTICULO` varchar(50) NOT NULL,
  `DIAPOSITIVA` varchar(50) NOT NULL,
  `INSCRIPCION` int(11) NOT NULL,
  PRIMARY KEY (`IDPONENTE`),
  KEY `fk_PONENTE_INSCRIPCION1_idx` (`INSCRIPCION`),
  CONSTRAINT `fk_PONENTE_INSCRIPCION1` FOREIGN KEY (`INSCRIPCION`) REFERENCES `inscripcion` (`IDINSCRIPCION`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla mydb.precio
CREATE TABLE IF NOT EXISTS `precio` (
  `IDPRECIO` int(11) NOT NULL AUTO_INCREMENT,
  `VALOR` float NOT NULL,
  `EVENTO` int(11) NOT NULL,
  `TIPO_PARTICIPANTE` int(11) NOT NULL,
  PRIMARY KEY (`IDPRECIO`),
  KEY `fk_PRECIO_EVENTO1_idx` (`EVENTO`),
  KEY `fk_PRECIO_TIPO_PARTICIPANTE1_idx` (`TIPO_PARTICIPANTE`),
  CONSTRAINT `fk_PRECIO_EVENTO1` FOREIGN KEY (`EVENTO`) REFERENCES `evento` (`IDEVENTO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRECIO_TIPO_PARTICIPANTE1` FOREIGN KEY (`TIPO_PARTICIPANTE`) REFERENCES `tipo_participante` (`IDTIPO_PARTICIPANTE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para procedimiento mydb.registrar_persona
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_persona`(
	IN `id` VARCHAR(50),
	IN `nom` VARCHAR(50),
	IN `apel` VARCHAR(100),
	IN `corr` VARCHAR(100),
	IN `celu` VARCHAR(50),
	IN `cla` VARCHAR(50)

)
BEGIN
	insert into persona(identificacion,nombre,apellido,correo,celular)
	values(id,nom,apel,corr,celu);
	insert into usuario(usuario,clave,rol,persona) values
	(MD5(corr),MD5(cla),2,
	(cast((SELECT MAX(idPersona) AS idPersona FROM persona) as char)));
END//
DELIMITER ;

-- Volcando estructura para tabla mydb.rol
CREATE TABLE IF NOT EXISTS `rol` (
  `IDROL` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(50) NOT NULL,
  PRIMARY KEY (`IDROL`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla mydb.sede
CREATE TABLE IF NOT EXISTS `sede` (
  `IDSEDE` int(11) NOT NULL,
  `DESCRIPCION` varchar(50) NOT NULL,
  PRIMARY KEY (`IDSEDE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla mydb.sitio
CREATE TABLE IF NOT EXISTS `sitio` (
  `IDSITIO` int(11) NOT NULL,
  `SALA` varchar(45) NOT NULL,
  `CAPACIDAD` varchar(45) NOT NULL,
  `SEDE` int(11) NOT NULL,
  PRIMARY KEY (`IDSITIO`),
  KEY `fk_SITIO_SEDE1_idx` (`SEDE`),
  CONSTRAINT `fk_SITIO_SEDE1` FOREIGN KEY (`SEDE`) REFERENCES `sede` (`IDSEDE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla mydb.sitio_matriales
CREATE TABLE IF NOT EXISTS `sitio_matriales` (
  `IDSITIO_MATRIALES` int(11) NOT NULL AUTO_INCREMENT,
  `SITIO_IDSITIO` int(11) NOT NULL,
  `MATRIALES_IDMATRIALES` int(11) NOT NULL,
  `CANTIDAD` int(11) NOT NULL,
  PRIMARY KEY (`IDSITIO_MATRIALES`),
  KEY `fk_SITIO_has_MATRIALES_MATRIALES1_idx` (`MATRIALES_IDMATRIALES`),
  KEY `fk_SITIO_has_MATRIALES_SITIO1_idx` (`SITIO_IDSITIO`),
  CONSTRAINT `fk_SITIO_has_MATRIALES_MATRIALES1` FOREIGN KEY (`MATRIALES_IDMATRIALES`) REFERENCES `matriales` (`IDMATRIALES`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SITIO_has_MATRIALES_SITIO1` FOREIGN KEY (`SITIO_IDSITIO`) REFERENCES `sitio` (`IDSITIO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla mydb.tipo_participante
CREATE TABLE IF NOT EXISTS `tipo_participante` (
  `IDTIPO_PARTICIPANTE` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(50) NOT NULL,
  PRIMARY KEY (`IDTIPO_PARTICIPANTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla mydb.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `IDUSUARIO` int(11) NOT NULL AUTO_INCREMENT,
  `USUARIO` varchar(50) NOT NULL,
  `CLAVE` varchar(50) NOT NULL,
  `PERSONA` int(11) NOT NULL,
  `ROL` int(11) NOT NULL,
  PRIMARY KEY (`IDUSUARIO`),
  KEY `fk_USUARIO_PERSONA_idx` (`PERSONA`),
  KEY `fk_USUARIO_ROL1_idx` (`ROL`),
  CONSTRAINT `fk_USUARIO_PERSONA` FOREIGN KEY (`PERSONA`) REFERENCES `persona` (`IDPERSONA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_USUARIO_ROL1` FOREIGN KEY (`ROL`) REFERENCES `rol` (`IDROL`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
