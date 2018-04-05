-- MySQL Script generated by MySQL Workbench
-- Wed Apr  4 22:55:09 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`PERSONA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PERSONA` (
  `IDPERSONA` INT NOT NULL AUTO_INCREMENT,
  `IDENTIFICACION` VARCHAR(10) NOT NULL,
  `NOMBRE` VARCHAR(50) NOT NULL,
  `APELLIDO` VARCHAR(50) NOT NULL,
  `CORREO` VARCHAR(100) NOT NULL,
  `CELULAR` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`IDPERSONA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ROL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ROL` (
  `IDROL` INT NOT NULL,
  `DESCRIPCION` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`IDROL`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`USUARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`USUARIO` (
  `IDUSUARIO` INT NOT NULL,
  `USUARIO` VARCHAR(50) NOT NULL,
  `CLAVE` VARCHAR(50) NOT NULL,
  `PERSONA` INT NOT NULL,
  `ROL` INT NOT NULL,
  PRIMARY KEY (`IDUSUARIO`),
  INDEX `fk_USUARIO_PERSONA_idx` (`PERSONA` ASC),
  INDEX `fk_USUARIO_ROL1_idx` (`ROL` ASC),
  CONSTRAINT `fk_USUARIO_PERSONA`
    FOREIGN KEY (`PERSONA`)
    REFERENCES `mydb`.`PERSONA` (`IDPERSONA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_USUARIO_ROL1`
    FOREIGN KEY (`ROL`)
    REFERENCES `mydb`.`ROL` (`IDROL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EVENTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EVENTO` (
  `IDEVENTO` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE` VARCHAR(100) NOT NULL,
  `DESCRIPCION` VARCHAR(255) NOT NULL,
  `FECHA_INI` DATE NOT NULL,
  `FECHA_FIN` DATE NULL,
  `CERTIFICDO` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`IDEVENTO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SEDE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SEDE` (
  `IDSEDE` INT NOT NULL,
  `DESCRIPCION` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`IDSEDE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SITIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SITIO` (
  `IDSITIO` INT NOT NULL,
  `SALA` VARCHAR(45) NOT NULL,
  `CAPACIDAD` VARCHAR(45) NOT NULL,
  `SEDE` INT NOT NULL,
  PRIMARY KEY (`IDSITIO`),
  INDEX `fk_SITIO_SEDE1_idx` (`SEDE` ASC),
  CONSTRAINT `fk_SITIO_SEDE1`
    FOREIGN KEY (`SEDE`)
    REFERENCES `mydb`.`SEDE` (`IDSEDE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TIPO_PARTICIPANTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TIPO_PARTICIPANTE` (
  `IDTIPO_PARTICIPANTE` INT NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`IDTIPO_PARTICIPANTE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`INSCRIPCION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`INSCRIPCION` (
  `IDINSCRIPCION` INT NOT NULL,
  `URL_PAGO` VARCHAR(100) NULL,
  `ESTADO` VARCHAR(20) NOT NULL,
  `EVENTO` INT NOT NULL,
  `PARTICIPANTE` INT NOT NULL,
  `TIPO_PARTICIPANTE` INT NOT NULL,
  PRIMARY KEY (`IDINSCRIPCION`),
  INDEX `fk_INSCRIPCION_EVENTO1_idx` (`EVENTO` ASC),
  INDEX `fk_INSCRIPCION_USUARIO1_idx` (`PARTICIPANTE` ASC),
  INDEX `fk_INSCRIPCION_TIPO_PARTICIPANTE1_idx` (`TIPO_PARTICIPANTE` ASC),
  CONSTRAINT `fk_INSCRIPCION_EVENTO1`
    FOREIGN KEY (`EVENTO`)
    REFERENCES `mydb`.`EVENTO` (`IDEVENTO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_INSCRIPCION_USUARIO1`
    FOREIGN KEY (`PARTICIPANTE`)
    REFERENCES `mydb`.`USUARIO` (`IDUSUARIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_INSCRIPCION_TIPO_PARTICIPANTE1`
    FOREIGN KEY (`TIPO_PARTICIPANTE`)
    REFERENCES `mydb`.`TIPO_PARTICIPANTE` (`IDTIPO_PARTICIPANTE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PONENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PONENTE` (
  `IDPONENTE` INT NOT NULL,
  `PONENCIA` VARCHAR(255) NOT NULL,
  `ARTICULO` VARCHAR(50) NOT NULL,
  `DIAPOSITIVA` VARCHAR(50) NOT NULL,
  `INSCRIPCION` INT NOT NULL,
  PRIMARY KEY (`IDPONENTE`),
  INDEX `fk_PONENTE_INSCRIPCION1_idx` (`INSCRIPCION` ASC),
  CONSTRAINT `fk_PONENTE_INSCRIPCION1`
    FOREIGN KEY (`INSCRIPCION`)
    REFERENCES `mydb`.`INSCRIPCION` (`IDINSCRIPCION`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CRONOGRAMA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CRONOGRAMA` (
  `IDCRONOGRAMA` INT NOT NULL AUTO_INCREMENT,
  `HORARIO_INI` DATETIME NOT NULL,
  `CIERRE` DATETIME NOT NULL,
  `EVENTO` INT NOT NULL,
  `SITIO` INT NOT NULL,
  `PONENTE` INT NOT NULL,
  PRIMARY KEY (`IDCRONOGRAMA`),
  INDEX `fk_CRONOGRAMA_EVENTO1_idx` (`EVENTO` ASC),
  INDEX `fk_CRONOGRAMA_SITIO1_idx` (`SITIO` ASC),
  INDEX `fk_CRONOGRAMA_PONENTE1_idx` (`PONENTE` ASC),
  CONSTRAINT `fk_CRONOGRAMA_EVENTO1`
    FOREIGN KEY (`EVENTO`)
    REFERENCES `mydb`.`EVENTO` (`IDEVENTO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CRONOGRAMA_SITIO1`
    FOREIGN KEY (`SITIO`)
    REFERENCES `mydb`.`SITIO` (`IDSITIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CRONOGRAMA_PONENTE1`
    FOREIGN KEY (`PONENTE`)
    REFERENCES `mydb`.`PONENTE` (`IDPONENTE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PRECIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PRECIO` (
  `IDPRECIO` INT NOT NULL AUTO_INCREMENT,
  `VALOR` FLOAT NOT NULL,
  `EVENTO` INT NOT NULL,
  `TIPO_PARTICIPANTE` INT NOT NULL,
  PRIMARY KEY (`IDPRECIO`),
  INDEX `fk_PRECIO_EVENTO1_idx` (`EVENTO` ASC),
  INDEX `fk_PRECIO_TIPO_PARTICIPANTE1_idx` (`TIPO_PARTICIPANTE` ASC),
  CONSTRAINT `fk_PRECIO_EVENTO1`
    FOREIGN KEY (`EVENTO`)
    REFERENCES `mydb`.`EVENTO` (`IDEVENTO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRECIO_TIPO_PARTICIPANTE1`
    FOREIGN KEY (`TIPO_PARTICIPANTE`)
    REFERENCES `mydb`.`TIPO_PARTICIPANTE` (`IDTIPO_PARTICIPANTE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MATRIALES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MATRIALES` (
  `IDMATRIALES` INT NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`IDMATRIALES`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SITIO_MATRIALES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SITIO_MATRIALES` (
  `IDSITIO_MATRIALES` INT NOT NULL AUTO_INCREMENT,
  `SITIO_IDSITIO` INT NOT NULL,
  `MATRIALES_IDMATRIALES` INT NOT NULL,
  `CANTIDAD` INT NOT NULL,
  PRIMARY KEY (`IDSITIO_MATRIALES`),
  INDEX `fk_SITIO_has_MATRIALES_MATRIALES1_idx` (`MATRIALES_IDMATRIALES` ASC),
  INDEX `fk_SITIO_has_MATRIALES_SITIO1_idx` (`SITIO_IDSITIO` ASC),
  CONSTRAINT `fk_SITIO_has_MATRIALES_SITIO1`
    FOREIGN KEY (`SITIO_IDSITIO`)
    REFERENCES `mydb`.`SITIO` (`IDSITIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SITIO_has_MATRIALES_MATRIALES1`
    FOREIGN KEY (`MATRIALES_IDMATRIALES`)
    REFERENCES `mydb`.`MATRIALES` (`IDMATRIALES`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ASISTENCIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ASISTENCIA` (
  `IDASISTENCIA` INT NOT NULL,
  `HORA_ING` DATETIME NOT NULL,
  `HORA_SAL` DATETIME NOT NULL,
  `ESTADO` VARCHAR(50) NOT NULL,
  `INSCRIPCION` INT NOT NULL,
  PRIMARY KEY (`IDASISTENCIA`),
  INDEX `fk_ASISTENCIA_INSCRIPCION1_idx` (`INSCRIPCION` ASC),
  CONSTRAINT `fk_ASISTENCIA_INSCRIPCION1`
    FOREIGN KEY (`INSCRIPCION`)
    REFERENCES `mydb`.`INSCRIPCION` (`IDINSCRIPCION`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;