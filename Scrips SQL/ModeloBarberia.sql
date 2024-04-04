-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema barberia
-- -----------------------------------------------------
-- Es la base de datos de la barberia

-- -----------------------------------------------------
-- Schema barberia
--
-- Es la base de datos de la barberia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `barberia` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `barberia` ;

-- -----------------------------------------------------
-- Table `barberia`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barberia`.`Persona` (
  `Cedula` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Correo` VARCHAR(255) NULL,
  `Direccion` VARCHAR(45) NULL,
  `FechaNacimiento` DATE NULL,
  PRIMARY KEY (`Cedula`));


-- -----------------------------------------------------
-- Table `barberia`.`Telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barberia`.`Telefono` (
  `idPersona` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPersona`, `Telefono`),
  CONSTRAINT `idPersona`
    FOREIGN KEY (`idPersona`)
    REFERENCES `barberia`.`Persona` (`Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `barberia`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barberia`.`Cliente` (
  `idCliente` VARCHAR(45) NOT NULL,
  `Profesion` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`),
  CONSTRAINT `idCliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `barberia`.`Persona` (`Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `barberia`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barberia`.`Empleado` (
  `idEmpleado` VARCHAR(45) NOT NULL,
  `Salario` FLOAT NULL,
  PRIMARY KEY (`idEmpleado`),
  CONSTRAINT `fkEmpleado`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `barberia`.`Persona` (`Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `barberia`.`Servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barberia`.`Servicio` (
  `idServicio` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Precio` FLOAT NULL,
  `Duracion` VARCHAR(45) NULL,
  PRIMARY KEY (`idServicio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `barberia`.`ServicioAtencion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barberia`.`ServicioAtencion` (
  `idAtencion` VARCHAR(45) NOT NULL,
  `Cantidad` INT NULL,
  `Total` FLOAT NULL,
  `idServicio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAtencion`, `idServicio`),
  INDEX `idServicio_idx` (`idServicio` ASC) VISIBLE,
  CONSTRAINT `idServicio`
    FOREIGN KEY (`idServicio`)
    REFERENCES `barberia`.`Servicio` (`idServicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `barberia`.`Cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barberia`.`Cita` (
  `idCita` VARCHAR(45) NOT NULL,
  `Hora` TIME NULL,
  `Fecha` DATE NULL,
  `idCliente` VARCHAR(45) NULL,
  `idEmpleado` VARCHAR(45) NULL,
  `idAtencion` VARCHAR(45) NULL,
  PRIMARY KEY (`idCita`),
  INDEX `idCliente_idx` (`idCliente` ASC) VISIBLE,
  INDEX `idEmpleado_idx` (`idEmpleado` ASC) VISIBLE,
  INDEX `idAtencion_idx` (`idAtencion` ASC) VISIBLE,
  CONSTRAINT `fkCliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `barberia`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkEmpleadoCi`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `barberia`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkAtencion`
    FOREIGN KEY (`idAtencion`)
    REFERENCES `barberia`.`ServicioAtencion` (`idAtencion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `barberia`.`Especialidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barberia`.`Especialidad` (
  `idEspecialidad` VARCHAR(45) NOT NULL,
  `Especialidad` VARCHAR(45) NULL,
  PRIMARY KEY (`idEspecialidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `barberia`.`EspecialidadEmpleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barberia`.`EspecialidadEmpleado` (
  `idEmpleado` VARCHAR(45) NOT NULL,
  `idEspecialidad` VARCHAR(45) NOT NULL,
  INDEX `idEspecialidad_idx` (`idEspecialidad` ASC) VISIBLE,
  PRIMARY KEY (`idEmpleado`, `idEspecialidad`),
  CONSTRAINT `fkEspecialidad`
    FOREIGN KEY (`idEspecialidad`)
    REFERENCES `barberia`.`Especialidad` (`idEspecialidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkEmpleadod`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `barberia`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `barberia`.`Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barberia`.`Factura` (
  `idFactura` VARCHAR(45) NOT NULL,
  `idCliente` VARCHAR(45) NULL,
  `idEmpleado` VARCHAR(45) NULL,
  PRIMARY KEY (`idFactura`),
  INDEX `idCliente_idx` (`idCliente` ASC) VISIBLE,
  INDEX `idEmpleado_idx` (`idEmpleado` ASC) VISIBLE,
  CONSTRAINT `fkClientef`
    FOREIGN KEY (`idCliente`)
    REFERENCES `barberia`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkEmpleadof`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `barberia`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `barberia`.`HistorialServicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barberia`.`HistorialServicio` (
  `idHistorial` VARCHAR(45) NOT NULL,
  `Fecha` DATE NULL,
  `Hora` TIME NULL,
  `Total` FLOAT NULL,
  `idFactura` VARCHAR(45) NULL,
  PRIMARY KEY (`idHistorial`),
  INDEX `idFactura_idx` (`idFactura` ASC) VISIBLE,
  CONSTRAINT `idFactura`
    FOREIGN KEY (`idFactura`)
    REFERENCES `barberia`.`Factura` (`idFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `barberia`.`Proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barberia`.`Proveedor` (
  `idProveedor` VARCHAR(45) NOT NULL,
  `Marca` VARCHAR(45) NULL,
  PRIMARY KEY (`idProveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `barberia`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barberia`.`Producto` (
  `idProducto` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Precio` FLOAT NULL,
  `CantidadDisponible` INT NULL,
  `idProveedor` VARCHAR(45) NULL,
  PRIMARY KEY (`idProducto`),
  INDEX `idProveedor_idx` (`idProveedor` ASC) VISIBLE,
  CONSTRAINT `idProveedor`
    FOREIGN KEY (`idProveedor`)
    REFERENCES `barberia`.`Proveedor` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `barberia`.`ProductoCompra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barberia`.`ProductoCompra` (
  `idCompra` VARCHAR(45) NOT NULL,
  `Cantidad` INT NULL,
  `Total` FLOAT NULL,
  `Comision` FLOAT NULL,
  `idProducto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCompra`, `idProducto`),
  INDEX `idProducto_idx` (`idProducto` ASC) VISIBLE,
  CONSTRAINT `idProducto`
    FOREIGN KEY (`idProducto`)
    REFERENCES `barberia`.`Producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `barberia`.`ProductoConsumido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barberia`.`ProductoConsumido` (
  `idAtencion` VARCHAR(45) NOT NULL,
  `idProducto` VARCHAR(45) NOT NULL,
  `Cantidad` INT NULL,
  INDEX `idProducto_idx` (`idProducto` ASC) VISIBLE,
  PRIMARY KEY (`idAtencion`, `idProducto`),
  CONSTRAINT `fkAtencionP`
    FOREIGN KEY (`idAtencion`)
    REFERENCES `barberia`.`ServicioAtencion` (`idAtencion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkProductoP`
    FOREIGN KEY (`idProducto`)
    REFERENCES `barberia`.`Producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `barberia`.`FacturaServicioAtencion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barberia`.`FacturaServicioAtencion` (
  `IdFactura` VARCHAR(45) NOT NULL,
  `IdAtencion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdFactura`, `IdAtencion`),
  INDEX `FK_AtencionA_idx` (`IdAtencion` ASC) VISIBLE,
  CONSTRAINT `FK_FacturaT`
    FOREIGN KEY (`IdFactura`)
    REFERENCES `barberia`.`Factura` (`idFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_AtencionA`
    FOREIGN KEY (`IdAtencion`)
    REFERENCES `barberia`.`ServicioAtencion` (`idAtencion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `barberia`.`FacturaProductoCompra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barberia`.`FacturaProductoCompra` (
  `IdFactura` VARCHAR(45) NOT NULL,
  `IdCompraProducto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdFactura`, `IdCompraProducto`),
  INDEX `FK_CompraC_idx` (`IdCompraProducto` ASC) VISIBLE,
  CONSTRAINT `FK_FacturaC`
    FOREIGN KEY (`IdFactura`)
    REFERENCES `barberia`.`Factura` (`idFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_CompraC`
    FOREIGN KEY (`IdCompraProducto`)
    REFERENCES `barberia`.`ProductoCompra` (`idCompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
