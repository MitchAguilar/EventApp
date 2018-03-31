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
DROP DATABASE IF EXISTS `mydb`;
CREATE DATABASE IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mydb`;

-- Volcando estructura para tabla mydb.certificado
DROP TABLE IF EXISTS `certificado`;
CREATE TABLE IF NOT EXISTS `certificado` (
  `idCertificado` int(11) NOT NULL,
  `Nombre_cer` varchar(45) DEFAULT NULL,
  `Descripcion_cer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCertificado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para procedimiento mydb.consultar_usuario
DROP PROCEDURE IF EXISTS `consultar_usuario`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_usuario`(
	IN `user` VARCHAR(100),
	IN `pass` VARCHAR(100)
)
    COMMENT 'procedimiento para consultar si un usuario existe'
BEGIN
	select * from usuario where username=user and contrasena=pass;
END//
DELIMITER ;

-- Volcando estructura para tabla mydb.evento
DROP TABLE IF EXISTS `evento`;
CREATE TABLE IF NOT EXISTS `evento` (
  `idEvento` int(11) NOT NULL,
  `Nombre_Evento` varchar(45) DEFAULT NULL,
  `Descripcion_evento` varchar(45) DEFAULT NULL,
  `Cronograma` varchar(45) DEFAULT NULL,
  `Fecha_inicio` date DEFAULT NULL,
  `Fecha_fin` date DEFAULT NULL,
  `Tipo_de_evento_idTipo_de_evento` int(11) NOT NULL,
  PRIMARY KEY (`idEvento`),
  KEY `fk_Evento_Tipo_de_evento1_idx` (`Tipo_de_evento_idTipo_de_evento`),
  CONSTRAINT `fk_Evento_Tipo_de_evento1` FOREIGN KEY (`Tipo_de_evento_idTipo_de_evento`) REFERENCES `tipo_de_evento` (`idTipo_de_evento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla mydb.evento_has_precio
DROP TABLE IF EXISTS `evento_has_precio`;
CREATE TABLE IF NOT EXISTS `evento_has_precio` (
  `Evento_idEvento` int(11) NOT NULL,
  `Precio_idPrecio` int(11) NOT NULL,
  PRIMARY KEY (`Evento_idEvento`,`Precio_idPrecio`),
  KEY `fk_Evento_has_Precio_Precio1_idx` (`Precio_idPrecio`),
  KEY `fk_Evento_has_Precio_Evento1_idx` (`Evento_idEvento`),
  CONSTRAINT `fk_Evento_has_Precio_Evento1` FOREIGN KEY (`Evento_idEvento`) REFERENCES `evento` (`idEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Evento_has_Precio_Precio1` FOREIGN KEY (`Precio_idPrecio`) REFERENCES `precio` (`idPrecio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla mydb.evento_has_sitio
DROP TABLE IF EXISTS `evento_has_sitio`;
CREATE TABLE IF NOT EXISTS `evento_has_sitio` (
  `Evento_idEvento` int(11) NOT NULL,
  `Sitio_idSitio` int(11) NOT NULL,
  `Recurso_idRecurso` int(11) NOT NULL,
  `Descripcion_sitio` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Evento_idEvento`,`Sitio_idSitio`),
  KEY `fk_Evento_has_Sitio_Sitio1_idx` (`Sitio_idSitio`),
  KEY `fk_Evento_has_Sitio_Evento1_idx` (`Evento_idEvento`),
  KEY `fk_Evento_has_Sitio_Recurso1_idx` (`Recurso_idRecurso`),
  CONSTRAINT `fk_Evento_has_Sitio_Evento1` FOREIGN KEY (`Evento_idEvento`) REFERENCES `evento` (`idEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Evento_has_Sitio_Recurso1` FOREIGN KEY (`Recurso_idRecurso`) REFERENCES `recurso` (`idRecurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Evento_has_Sitio_Sitio1` FOREIGN KEY (`Sitio_idSitio`) REFERENCES `sitio` (`idSitio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla mydb.evento_has_usuario
DROP TABLE IF EXISTS `evento_has_usuario`;
CREATE TABLE IF NOT EXISTS `evento_has_usuario` (
  `Evento_idEvento` int(11) NOT NULL,
  `Usuario_idUsuario` int(11) NOT NULL,
  `Certificado_idCertificado` int(11) NOT NULL,
  `Pago_idPago` int(11) NOT NULL,
  PRIMARY KEY (`Evento_idEvento`,`Usuario_idUsuario`,`Certificado_idCertificado`,`Pago_idPago`),
  KEY `fk_Evento_has_Usuario_Usuario1_idx` (`Usuario_idUsuario`),
  KEY `fk_Evento_has_Usuario_Evento_idx` (`Evento_idEvento`),
  KEY `fk_Evento_has_Usuario_Certificado1_idx` (`Certificado_idCertificado`),
  KEY `fk_Evento_has_Usuario_Pago1_idx` (`Pago_idPago`),
  CONSTRAINT `fk_Evento_has_Usuario_Certificado1` FOREIGN KEY (`Certificado_idCertificado`) REFERENCES `certificado` (`idCertificado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Evento_has_Usuario_Evento` FOREIGN KEY (`Evento_idEvento`) REFERENCES `evento` (`idEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Evento_has_Usuario_Pago1` FOREIGN KEY (`Pago_idPago`) REFERENCES `pago` (`idPago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Evento_has_Usuario_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla mydb.pago
DROP TABLE IF EXISTS `pago`;
CREATE TABLE IF NOT EXISTS `pago` (
  `idPago` int(11) NOT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla mydb.permisos
DROP TABLE IF EXISTS `permisos`;
CREATE TABLE IF NOT EXISTS `permisos` (
  `idPermisos` int(11) NOT NULL,
  `Modulo` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPermisos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla mydb.permisos_has_rol
DROP TABLE IF EXISTS `permisos_has_rol`;
CREATE TABLE IF NOT EXISTS `permisos_has_rol` (
  `Permisos_idPermisos` int(11) NOT NULL,
  `rol_idrol` int(11) NOT NULL,
  PRIMARY KEY (`Permisos_idPermisos`,`rol_idrol`),
  KEY `fk_Permisos_has_rol_rol1_idx` (`rol_idrol`),
  KEY `fk_Permisos_has_rol_Permisos1_idx` (`Permisos_idPermisos`),
  CONSTRAINT `fk_Permisos_has_rol_Permisos1` FOREIGN KEY (`Permisos_idPermisos`) REFERENCES `permisos` (`idPermisos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Permisos_has_rol_rol1` FOREIGN KEY (`rol_idrol`) REFERENCES `rol` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla mydb.persona
DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `idPersona` int(11) NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(45) DEFAULT NULL,
  `Apellidos` varchar(45) DEFAULT NULL,
  `Correo` varchar(45) DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `Telefono` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla mydb.precio
DROP TABLE IF EXISTS `precio`;
CREATE TABLE IF NOT EXISTS `precio` (
  `idPrecio` int(11) NOT NULL,
  `Valor_pago` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPrecio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla mydb.recurso
DROP TABLE IF EXISTS `recurso`;
CREATE TABLE IF NOT EXISTS `recurso` (
  `idRecurso` int(11) NOT NULL,
  `Nombre_recurso` varchar(45) DEFAULT NULL,
  `Descrpcion_recurso` varchar(45) DEFAULT NULL,
  `Cantida_recurso` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRecurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para procedimiento mydb.registrar persona
DROP PROCEDURE IF EXISTS `registrar persona`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar persona`(
	IN `nom` VARCHAR(100),
	IN `apell` VARCHAR(100),
	IN `corr` VARCHAR(100),
	IN `direc` VARCHAR(100),
	IN `tel` INT



)
    COMMENT 'procedimiento para registrar personas'
BEGIN
	insert into persona(Nombres,Apellidos,Correo,Direccion,Telefono)values(nom,apell,corr,direc,tel);
	insert into usuario(username,contrasena,rol_idrol,persona_idUsuario) values
	(RSA_ENCRYPT(Correo,'event'),RSA_ENCRYPT(Correo,'event'),1,
	(SELECT MAX(idPersona) FROM persona));
END//
DELIMITER ;

-- Volcando estructura para tabla mydb.rol
DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `idrol` int(11) NOT NULL,
  `NombreRol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla mydb.sitio
DROP TABLE IF EXISTS `sitio`;
CREATE TABLE IF NOT EXISTS `sitio` (
  `idSitio` int(11) NOT NULL,
  `Nombre_sitio` varchar(45) DEFAULT NULL,
  `Direccion_sitio` varchar(45) DEFAULT NULL,
  `Telefono_sitio` varchar(45) DEFAULT NULL,
  `sala_idsala` int(11) DEFAULT NULL,
  PRIMARY KEY (`idSitio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla mydb.tipo_de_evento
DROP TABLE IF EXISTS `tipo_de_evento`;
CREATE TABLE IF NOT EXISTS `tipo_de_evento` (
  `idTipo_de_evento` int(11) NOT NULL,
  `Nombre_tipo` varchar(45) DEFAULT NULL,
  `Descripcion_tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipo_de_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla mydb.usuario
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `contrasena` varchar(100) NOT NULL,
  `rol_idrol` int(11) NOT NULL,
  `persona_idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idusuario`,`rol_idrol`,`persona_idUsuario`),
  KEY `fk_usuario_rol1_idx` (`rol_idrol`),
  KEY `fk_usuario_persona1_idx` (`persona_idUsuario`),
  CONSTRAINT `fk_usuario_persona1` FOREIGN KEY (`persona_idUsuario`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_rol1` FOREIGN KEY (`rol_idrol`) REFERENCES `rol` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
