-- MySQL Script generated by MySQL Workbench
-- Wed Oct 16 22:06:06 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`CUSTOMER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CUSTOMER` (
  `CUST_ID` INT NOT NULL,
  `CUST_LNAME` VARCHAR(45) NOT NULL,
  `CUST_FNAME` VARCHAR(45) NOT NULL,
  `CUST_INITIAL` VARCHAR(45) NULL,
  `CUST_ADD` VARCHAR(45) NOT NULL,
  `CUST_CITY` VARCHAR(45) NOT NULL,
  `CUST_POSTCODE` VARCHAR(45) NOT NULL,
  `CUST_PHONE` VARCHAR(45) NOT NULL,
  `CUST_EMAIL` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CUST_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ORDER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ORDER` (
  `ORDER_ID` INT NOT NULL,
  `ORDER_DATE` VARCHAR(45) NOT NULL,
  `ORDER_STATUS` VARCHAR(45) NOT NULL,
  `CUST_ID` INT NULL,
  PRIMARY KEY (`ORDER_ID`),
  INDEX `CUST_ID_idx` (`CUST_ID` ASC) VISIBLE,
  CONSTRAINT `CUST_ID`
    FOREIGN KEY (`CUST_ID`)
    REFERENCES `mydb`.`CUSTOMER` (`CUST_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CARD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CARD` (
  `CARD_ID` INT NOT NULL,
  `CARD_LNAME` VARCHAR(45) NOT NULL,
  `CARD_FNAME` VARCHAR(45) NOT NULL,
  `CARD_NUM` INT NOT NULL,
  PRIMARY KEY (`CARD_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PAYMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PAYMENT` (
  `PAYMENT_ID` INT NOT NULL,
  `PAYMENT_METHOD` VARCHAR(45) NOT NULL,
  `CUST_ID` INT NOT NULL,
  `CARD_ID` INT NOT NULL,
  PRIMARY KEY (`PAYMENT_ID`),
  INDEX `CARD_ID_idx` (`CARD_ID` ASC) VISIBLE,
  INDEX `CUST_ID_idx` (`CUST_ID` ASC) VISIBLE,
  CONSTRAINT `CARD_ID`
    FOREIGN KEY (`CARD_ID`)
    REFERENCES `mydb`.`CARD` (`CARD_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CUST_ID`
    FOREIGN KEY (`CUST_ID`)
    REFERENCES `mydb`.`CUSTOMER` (`CUST_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EMPLOYEE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EMPLOYEE` (
  `EMP_ID` INT NOT NULL,
  `EMP_LNAME` VARCHAR(45) NOT NULL,
  `EMP_FNAME` VARCHAR(45) NOT NULL,
  `EMP_INITAL` VARCHAR(45) NOT NULL,
  `EMP_ADD` VARCHAR(45) NOT NULL,
  `EMP_EMAIL` VARCHAR(45) NOT NULL,
  `EMP_PHONE` VARCHAR(45) NOT NULL,
  `EMP_TYPE` VARCHAR(45) NOT NULL,
  `ORDER_ID` INT NOT NULL,
  PRIMARY KEY (`EMP_ID`),
  INDEX `ORDER_ID_idx` (`ORDER_ID` ASC) VISIBLE,
  CONSTRAINT `ORDER_ID`
    FOREIGN KEY (`ORDER_ID`)
    REFERENCES `mydb`.`ORDER` (`ORDER_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;