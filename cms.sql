SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `cms` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `cms` ;

-- -----------------------------------------------------
-- Table `cms`.`user`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cms`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `email` VARCHAR(30) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `last_login` TIMESTAMP NULL ,
  `active` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms`.`user_info`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cms`.`user_info` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `first_name` VARCHAR(30) NULL ,
  `last_name` VARCHAR(30) NULL ,
  `user_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `user_info_id` (`user_id` ASC) ,
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) ,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id` )
    REFERENCES `cms`.`user` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms`.`contact`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cms`.`contact` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `first_name` VARCHAR(30) NULL ,
  `last_name` VARCHAR(30) NULL ,
  `user_id` INT NOT NULL ,
  `nickname` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `user_contact_id` (`user_id` ASC) ,
  CONSTRAINT `user_contact`
    FOREIGN KEY (`user_id` )
    REFERENCES `cms`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms`.`email`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cms`.`email` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `email` VARCHAR(30) NULL ,
  `contact_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `contact_email_id` (`contact_id` ASC) ,
  CONSTRAINT `contact_email`
    FOREIGN KEY (`contact_id` )
    REFERENCES `cms`.`contact` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms`.`phone`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cms`.`phone` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `phone` VARCHAR(30) NULL ,
  `contact_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `contact_phone_id` (`contact_id` ASC) ,
  CONSTRAINT `contact_phone`
    FOREIGN KEY (`contact_id` )
    REFERENCES `cms`.`contact` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms`.`address`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cms`.`address` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `street` VARCHAR(45) NULL ,
  `city` VARCHAR(45) NULL ,
  `zip_code` VARCHAR(45) NULL ,
  `contact_id` INT NOT NULL ,
  INDEX `contact_address_id` (`contact_id` ASC) ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `contact_address`
    FOREIGN KEY (`contact_id` )
    REFERENCES `cms`.`contact` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

USE `cms` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
