-- Script para crear base de datos adoptapatas

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema adoptapatas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `adoptapatas` DEFAULT CHARACTER SET utf8 ;
USE `adoptapatas` ;

-- -----------------------------------------------------
-- Table `adoptapatas`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adoptapatas`.`user` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(65) NOT NULL,
  `last_name` VARCHAR(65) NOT NULL,
  `username` VARCHAR(50) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `phone` VARCHAR(16) NOT NULL,
  `password_hash` VARCHAR(45) NOT NULL,
  `registered_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `street_name` VARCHAR(30) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `zip_code` VARCHAR(45) NOT NULL,
  `profile_picture` VARCHAR(255) NULL,
  `bio` TINYTEXT NULL,
  `role` VARCHAR(25) NOT NULL DEFAULT 'Adopter' CHECK (role IN ('Adopter', 'PetPoster')),
  `user_type` VARCHAR(45) NOT NULL DEFAULT 'Individual' CHECK (user_type IN ('Individual', 'Shelter')),
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `adoptapatas`.`pet_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adoptapatas`.`pet_type` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `type_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `type_name_UNIQUE` (`type_name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `adoptapatas`.`pet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adoptapatas`.`pet` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `pet_user_id` BIGINT NOT NULL,
  `pet_type_id` BIGINT NOT NULL,
  `name` VARCHAR(30) NOT NULL,
  `size` VARCHAR(30) NOT NULL,
  `age` VARCHAR(25) NOT NULL,
  `sex` VARCHAR(20) NOT NULL,
  `breed` VARCHAR(30) NOT NULL,
  `color` VARCHAR(30) NULL,
  `characteristics` TINYTEXT NULL,
  `description` TEXT NOT NULL,
  `pet_image` VARCHAR(255) NOT NULL,
  `health` TINYTEXT NOT NULL,
  `date_added` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`pet_user_id` ASC) VISIBLE,
  INDEX `pet_type_id_idx` (`pet_type_id` ASC) VISIBLE,
  CONSTRAINT `pet_user_id`
    FOREIGN KEY (`pet_user_id`)
    REFERENCES `adoptapatas`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `pet_type_id`
    FOREIGN KEY (`pet_type_id`)
    REFERENCES `adoptapatas`.`pet_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `adoptapatas`.`shelter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adoptapatas`.`shelter` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `user_origin_id` BIGINT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT NULL,
  `location` VARCHAR(255) NOT NULL,
  `contact_email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_origin_id` ASC) VISIBLE,
  UNIQUE INDEX `contact_email_UNIQUE` (`contact_email` ASC) VISIBLE,
  CONSTRAINT `user_origin_id`
    FOREIGN KEY (`user_origin_id`)
    REFERENCES `adoptapatas`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `adoptapatas`.`user_post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adoptapatas`.`user_post` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `source_user_id` BIGINT NOT NULL,
  `message` TINYTEXT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `image` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`source_user_id` ASC) VISIBLE,
  CONSTRAINT `source_user_id`
    FOREIGN KEY (`source_user_id`)
    REFERENCES `adoptapatas`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `adoptapatas`.`user_comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adoptapatas`.`user_comment` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `comment_user_id` BIGINT NOT NULL,
  `source_post_id` BIGINT NOT NULL,
  `content` VARCHAR(255) NOT NULL,
  `date_posted` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`comment_user_id` ASC) VISIBLE,
  INDEX `post_id_idx` (`source_post_id` ASC) VISIBLE,
  CONSTRAINT `comment_user_id`
    FOREIGN KEY (`comment_user_id`)
    REFERENCES `adoptapatas`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `source_post_id`
    FOREIGN KEY (`source_post_id`)
    REFERENCES `adoptapatas`.`user_post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `adoptapatas`.`user_like`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adoptapatas`.`user_like` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `source_like_user_id` BIGINT NOT NULL,
  `liked_post_id` BIGINT NOT NULL,
  `date_liked` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`source_like_user_id` ASC) VISIBLE,
  INDEX `post_id_idx` (`liked_post_id` ASC) VISIBLE,
  CONSTRAINT `source_like_user_id`
    FOREIGN KEY (`source_like_user_id`)
    REFERENCES `adoptapatas`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `liked_post_id`
    FOREIGN KEY (`liked_post_id`)
    REFERENCES `adoptapatas`.`user_post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `adoptapatas`.`user_follower`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adoptapatas`.`user_follower` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `follower_user_id` BIGINT NOT NULL,
  `followed_user_id` BIGINT NOT NULL,
  `date_followed` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`follower_user_id` ASC) VISIBLE,
  INDEX `follower_user_id_idx` (`followed_user_id` ASC) VISIBLE,
  CONSTRAINT `follower_user_id`
    FOREIGN KEY (`follower_user_id`)
    REFERENCES `adoptapatas`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `followed_user_id`
    FOREIGN KEY (`followed_user_id`)
    REFERENCES `adoptapatas`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `adoptapatas`.`adoption_inquiry`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adoptapatas`.`adoption_inquiry` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `inquiry_user_id` BIGINT NOT NULL,
  `pet_id` BIGINT NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `date_started` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`inquiry_user_id` ASC) VISIBLE,
  INDEX `pet_id_idx` (`pet_id` ASC) VISIBLE,
  CONSTRAINT `inquiry_user_id`
    FOREIGN KEY (`inquiry_user_id`)
    REFERENCES `adoptapatas`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `pet_id`
    FOREIGN KEY (`pet_id`)
    REFERENCES `adoptapatas`.`pet` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `adoptapatas`.`user_message`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adoptapatas`.`user_message` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `sender_user_id` BIGINT NOT NULL,
  `recipient_user_id` BIGINT NOT NULL,
  `content` TEXT NOT NULL,
  `date_sent` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `sender_user_id_idx` (`sender_user_id` ASC) VISIBLE,
  INDEX `recipient_user_id_idx` (`recipient_user_id` ASC) VISIBLE,
  CONSTRAINT `sender_user_id`
    FOREIGN KEY (`sender_user_id`)
    REFERENCES `adoptapatas`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `recipient_user_id`
    FOREIGN KEY (`recipient_user_id`)
    REFERENCES `adoptapatas`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `adoptapatas`.`notification`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adoptapatas`.`notification` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT NOT NULL,
  `post_id` BIGINT NULL DEFAULT NULL,
  `comment_id` BIGINT NULL DEFAULT NULL,
  `user_follower_id` BIGINT NULL DEFAULT NULL,
  `message_id` BIGINT NULL DEFAULT NULL,
  `notification_type` VARCHAR(50) NOT NULL,
  `is_read` TINYINT NOT NULL DEFAULT 0,
  `date_notified` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  INDEX `post_id_idx` (`post_id` ASC) VISIBLE,
  INDEX `comment_id_idx` (`comment_id` ASC) VISIBLE,
  INDEX `follower_user_id_idx` (`user_follower_id` ASC) VISIBLE,
  INDEX `message_id_idx` (`message_id` ASC) VISIBLE,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `adoptapatas`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `post_id`
    FOREIGN KEY (`post_id`)
    REFERENCES `adoptapatas`.`user_post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `comment_id`
    FOREIGN KEY (`comment_id`)
    REFERENCES `adoptapatas`.`user_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_follower_id`
    FOREIGN KEY (`user_follower_id`)
    REFERENCES `adoptapatas`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `message_id`
    FOREIGN KEY (`message_id`)
    REFERENCES `adoptapatas`.`user_message` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
