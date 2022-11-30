-- MySQL Script generated by MySQL Workbench
-- Wed Nov 30 12:14:55 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema futura_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema futura_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `futura_db` DEFAULT CHARACTER SET utf8mb4 ;
USE `futura_db` ;

-- -----------------------------------------------------
-- Table `futura_db`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `futura_db`.`users` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `mail` VARCHAR(255) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `role` INT UNSIGNED NOT NULL,
  `deleted_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `created_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `mail_UNIQUE` (`mail` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `futura_db`.`registries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `futura_db`.`registries` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `users_id` INT UNSIGNED NOT NULL,
  `firstname` VARCHAR(255) NULL,
  `lastname` VARCHAR(255) NULL,
  `phone_number` VARCHAR(45) NULL,
  `birth_at` DATE NULL,
  `fis_code` VARCHAR(20) NULL,
  `deleted_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `created_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_registries_users_idx` (`users_id` ASC) VISIBLE,
  UNIQUE INDEX `users_id_UNIQUE` (`users_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_anagrafiche_s_Users`
    FOREIGN KEY (`users_id`)
    REFERENCES `futura_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `futura_db`.`registries_r`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `futura_db`.`registries_r` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` VARCHAR(255) NOT NULL,
  `type` ENUM('str', 'int', 'bool', 'date', 'txt') NOT NULL,
  `default` VARCHAR(255) NULL,
  `deleted_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `created_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `key_UNIQUE` (`key` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `futura_db`.`registries_r_registries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `futura_db`.`registries_r_registries` (
  `registries_r_id` INT UNSIGNED NOT NULL COMMENT 'PRIMARY KEY (anagrafiche_r_id, users_id));',
  `registries_id` INT UNSIGNED NOT NULL,
  `value_str` VARCHAR(255) NULL,
  `value_int` INT NULL,
  `value_bool` TINYINT NULL,
  `value_date` DATETIME NULL,
  `value_txt` LONGTEXT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `deleted_at` DATETIME NULL,
  PRIMARY KEY (`registries_r_id`, `registries_id`),
  INDEX `fk_registries_r_registries_registries_r1_idx` (`registries_r_id` ASC) VISIBLE,
  INDEX `fk_registries_r_registries_registries1_idx` (`registries_id` ASC) VISIBLE,
  CONSTRAINT `fk_anagrafiche_r_has_Users_anagrafiche_r1`
    FOREIGN KEY (`registries_r_id`)
    REFERENCES `futura_db`.`registries_r` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_registries_r_users_registries1`
    FOREIGN KEY (`registries_id`)
    REFERENCES `futura_db`.`registries` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `futura_db`.`jobs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `futura_db`.`jobs` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `label` VARCHAR(255) NOT NULL,
  `deleted_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `created_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `label_UNIQUE` (`label` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `futura_db`.`services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `futura_db`.`services` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `label` VARCHAR(255) NOT NULL,
  `price` FLOAT NULL,
  `jobs_id` INT UNSIGNED NOT NULL,
  `deleted_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `created_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_services_jobs1_idx` (`jobs_id` ASC) VISIBLE,
  UNIQUE INDEX `label_UNIQUE` (`label` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_service_jobs1`
    FOREIGN KEY (`jobs_id`)
    REFERENCES `futura_db`.`jobs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `futura_db`.`services_r`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `futura_db`.`services_r` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` VARCHAR(255) NOT NULL,
  `type` ENUM('str', 'int', 'bool', 'date', 'txt') NOT NULL,
  `default` VARCHAR(255) NULL,
  `deleted_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `created_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `key_UNIQUE` (`key` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `futura_db`.`services_r_services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `futura_db`.`services_r_services` (
  `services_r_id` INT UNSIGNED NOT NULL,
  `services_id` INT UNSIGNED NOT NULL,
  `value_str` VARCHAR(255) NULL,
  `value_int` INT NULL,
  `value_bool` TINYINT NULL,
  `value_date` DATETIME NULL,
  `value_txt` LONGTEXT NULL,
  `deleted_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `created_at` DATETIME NULL,
  PRIMARY KEY (`services_r_id`, `services_id`),
  INDEX `fk_services_r_has_services_services1_idx` (`services_id` ASC) VISIBLE,
  INDEX `fk_services_r_has_services_services_r1_idx` (`services_r_id` ASC) VISIBLE,
  CONSTRAINT `fk_service_r_has_service_service_r1`
    FOREIGN KEY (`services_r_id`)
    REFERENCES `futura_db`.`services_r` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_service_r_has_service_service1`
    FOREIGN KEY (`services_id`)
    REFERENCES `futura_db`.`services` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `futura_db`.`jobs_r`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `futura_db`.`jobs_r` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` VARCHAR(255) NOT NULL,
  `type` ENUM('str', 'int', 'bool', 'date', 'txt') NOT NULL,
  `default` VARCHAR(255) NULL,
  `deleted_at` VARCHAR(45) NULL,
  `updated_at` VARCHAR(45) NULL,
  `created_at` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `key_UNIQUE` (`key` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `futura_db`.`jobs_r_jobs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `futura_db`.`jobs_r_jobs` (
  `jobs_r_id` INT UNSIGNED NOT NULL,
  `jobs_id` INT UNSIGNED NOT NULL,
  `value_str` VARCHAR(255) NULL,
  `value_int` INT NULL,
  `value_bool` TINYINT NULL,
  `value_date` DATETIME NULL,
  `value_txt` LONGTEXT NULL,
  `deleted_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `created_at` DATETIME NULL,
  PRIMARY KEY (`jobs_r_id`, `jobs_id`),
  INDEX `fk_jobs_r_has_jobs_jobs1_idx` (`jobs_id` ASC) VISIBLE,
  INDEX `fk_jobs_r_has_jobs_jobs_r1_idx` (`jobs_r_id` ASC) VISIBLE,
  CONSTRAINT `fk_jobs_r_has_jobs_jobs_r1`
    FOREIGN KEY (`jobs_r_id`)
    REFERENCES `futura_db`.`jobs_r` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jobs_r_has_jobs_jobs1`
    FOREIGN KEY (`jobs_id`)
    REFERENCES `futura_db`.`jobs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `futura_db`.`services_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `futura_db`.`services_users` (
  `services_id` INT UNSIGNED NOT NULL,
  `users_id` INT UNSIGNED NOT NULL,
  `operator_id` INT UNSIGNED NULL,
  `status` INT NULL,
  `appointment_at` DATETIME NULL,
  `deleted_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `created_at` DATETIME NULL,
  PRIMARY KEY (`services_id`, `users_id`),
  INDEX `fk_service_has_users_users1_idx` (`users_id` ASC) VISIBLE,
  INDEX `fk_service_has_users_service1_idx` (`services_id` ASC) VISIBLE,
  INDEX `fk_service_users_users1_idx` (`operator_id` ASC) VISIBLE,
  CONSTRAINT `fk_service_has_users_service1`
    FOREIGN KEY (`services_id`)
    REFERENCES `futura_db`.`services` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_service_has_users_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `futura_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_service_users_users1`
    FOREIGN KEY (`operator_id`)
    REFERENCES `futura_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `futura_db`.`jobs_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `futura_db`.`jobs_users` (
  `jobs_id` INT UNSIGNED NOT NULL,
  `users_id` INT UNSIGNED NOT NULL,
  `deleted_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `created_at` DATETIME NULL,
  PRIMARY KEY (`jobs_id`, `users_id`),
  INDEX `fk_jobs_has_users_users1_idx` (`users_id` ASC) VISIBLE,
  INDEX `fk_jobs_has_users_jobs1_idx` (`jobs_id` ASC) VISIBLE,
  CONSTRAINT `fk_jobs_has_users_jobs1`
    FOREIGN KEY (`jobs_id`)
    REFERENCES `futura_db`.`jobs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jobs_has_users_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `futura_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;