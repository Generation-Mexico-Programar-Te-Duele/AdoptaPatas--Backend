-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema adoptapatas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema adoptapatas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `adoptapatas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `adoptapatas` ;

-- -----------------------------------------------------
-- Table `adoptapatas`.`user_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adoptapatas`.`user_role` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(70) NULL DEFAULT NULL,
  `user_type` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `adoptapatas`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adoptapatas`.`user` (
  `age` INT NOT NULL,
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `registered_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `user_type_id` BIGINT NOT NULL,
  `phone` VARCHAR(16) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `password_hash` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `username` VARCHAR(50) NOT NULL,
  `first_name` VARCHAR(65) NOT NULL,
  `last_name` VARCHAR(65) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `bio` VARCHAR(255) NULL DEFAULT NULL,
  `profile_picture` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username` ASC) VISIBLE,
  UNIQUE INDEX `UK_ob8kqyqqgmefl0aco34akdtpe` (`email` ASC) VISIBLE,
  INDEX `FKaw2mcis3stiswsn3lf3orp2l5` (`user_type_id` ASC) VISIBLE,
  CONSTRAINT `FKaw2mcis3stiswsn3lf3orp2l5`
    FOREIGN KEY (`user_type_id`)
    REFERENCES `adoptapatas`.`user_role` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `adoptapatas`.`pet_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adoptapatas`.`pet_type` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `type_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `UK_mh3v7lu3gtclyysm7ivregj3e` (`type_name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `adoptapatas`.`pet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adoptapatas`.`pet` (
  `date_added` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `pet_type_id` BIGINT NOT NULL,
  `pet_user_id` BIGINT NOT NULL,
  `sex` VARCHAR(20) NOT NULL,
  `age` VARCHAR(25) NOT NULL,
  `breed` VARCHAR(30) NOT NULL,
  `color` VARCHAR(30) NOT NULL,
  `name` VARCHAR(30) NOT NULL,
  `size` VARCHAR(30) NOT NULL,
  `characteristics` TINYTEXT NULL DEFAULT NULL,
  `description` TEXT NOT NULL,
  `health_condition` TINYTEXT NOT NULL,
  `pet_image` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKc1u0f9npdkvdswepubsjkdb5f` (`pet_type_id` ASC) VISIBLE,
  INDEX `FKhw6nob2j8dny41tgjmgbln7cx` (`pet_user_id` ASC) VISIBLE,
  CONSTRAINT `FKc1u0f9npdkvdswepubsjkdb5f`
    FOREIGN KEY (`pet_type_id`)
    REFERENCES `adoptapatas`.`pet_type` (`id`),
  CONSTRAINT `FKhw6nob2j8dny41tgjmgbln7cx`
    FOREIGN KEY (`pet_user_id`)
    REFERENCES `adoptapatas`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `adoptapatas`.`adoption_inquiry`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adoptapatas`.`adoption_inquiry` (
  `date_started` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `inquiry_user_id` BIGINT NULL DEFAULT NULL,
  `pet_id` BIGINT NULL DEFAULT NULL,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKhw80qeu835igd4oraq7isnyd1` (`pet_id` ASC) VISIBLE,
  INDEX `FK7skjtg7f7w46kunulk2rlmdrs` (`inquiry_user_id` ASC) VISIBLE,
  CONSTRAINT `FK7skjtg7f7w46kunulk2rlmdrs`
    FOREIGN KEY (`inquiry_user_id`)
    REFERENCES `adoptapatas`.`user` (`id`),
  CONSTRAINT `FKhw80qeu835igd4oraq7isnyd1`
    FOREIGN KEY (`pet_id`)
    REFERENCES `adoptapatas`.`pet` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `adoptapatas`.`user_post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adoptapatas`.`user_post` (
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `user_author_id` BIGINT NOT NULL,
  `content` TINYTEXT NULL DEFAULT NULL,
  `image` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKfjr0qrtb8k6ihcxqgxdxj549k` (`user_author_id` ASC) VISIBLE,
  CONSTRAINT `FKfjr0qrtb8k6ihcxqgxdxj549k`
    FOREIGN KEY (`user_author_id`)
    REFERENCES `adoptapatas`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `adoptapatas`.`user_comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adoptapatas`.`user_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment_user_id` BIGINT NULL DEFAULT NULL,
  `date_posted` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `source_post_id` BIGINT NULL DEFAULT NULL,
  `content` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKc64d8jlgtlg9ojxbstby9sr6j` (`source_post_id` ASC) VISIBLE,
  INDEX `FKhygr8kdj7yduh7xg38pepap1b` (`comment_user_id` ASC) VISIBLE,
  CONSTRAINT `FKc64d8jlgtlg9ojxbstby9sr6j`
    FOREIGN KEY (`source_post_id`)
    REFERENCES `adoptapatas`.`user_post` (`id`),
  CONSTRAINT `FKhygr8kdj7yduh7xg38pepap1b`
    FOREIGN KEY (`comment_user_id`)
    REFERENCES `adoptapatas`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `adoptapatas`.`comment_likes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adoptapatas`.`comment_likes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `liked_comment_id` INT NULL DEFAULT NULL,
  `comment_liker_user_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKgml44moqbneowyj1rcfedhkb5` (`liked_comment_id` ASC) VISIBLE,
  INDEX `FK52r3yiigasbhdvwi545mywwbk` (`comment_liker_user_id` ASC) VISIBLE,
  CONSTRAINT `FK52r3yiigasbhdvwi545mywwbk`
    FOREIGN KEY (`comment_liker_user_id`)
    REFERENCES `adoptapatas`.`user` (`id`),
  CONSTRAINT `FKgml44moqbneowyj1rcfedhkb5`
    FOREIGN KEY (`liked_comment_id`)
    REFERENCES `adoptapatas`.`user_comment` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `adoptapatas`.`notification_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adoptapatas`.`notification_type` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `redirect_url` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `adoptapatas`.`notification`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adoptapatas`.`notification` (
  `comment_id` INT NULL DEFAULT NULL,
  `is_readed` BIT(1) NOT NULL,
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `post_id` BIGINT NULL DEFAULT NULL,
  `read_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `received_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `source_user_id` BIGINT NULL DEFAULT NULL,
  `type_id` BIGINT NULL DEFAULT NULL,
  `user_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK17d4l7cubo6se4jski7txngb3` (`comment_id` ASC) VISIBLE,
  INDEX `FK9ewy0cw7i0k5djuulcspperk6` (`post_id` ASC) VISIBLE,
  INDEX `FKi5nnib37xpre76to8qpksa38x` (`source_user_id` ASC) VISIBLE,
  INDEX `FK3ely3fa0vfkswch305omy1c38` (`type_id` ASC) VISIBLE,
  INDEX `FKb0yvoep4h4k92ipon31wmdf7e` (`user_id` ASC) VISIBLE,
  CONSTRAINT `FK17d4l7cubo6se4jski7txngb3`
    FOREIGN KEY (`comment_id`)
    REFERENCES `adoptapatas`.`user_comment` (`id`),
  CONSTRAINT `FK3ely3fa0vfkswch305omy1c38`
    FOREIGN KEY (`type_id`)
    REFERENCES `adoptapatas`.`notification_type` (`id`),
  CONSTRAINT `FK9ewy0cw7i0k5djuulcspperk6`
    FOREIGN KEY (`post_id`)
    REFERENCES `adoptapatas`.`user_post` (`id`),
  CONSTRAINT `FKb0yvoep4h4k92ipon31wmdf7e`
    FOREIGN KEY (`user_id`)
    REFERENCES `adoptapatas`.`user` (`id`),
  CONSTRAINT `FKi5nnib37xpre76to8qpksa38x`
    FOREIGN KEY (`source_user_id`)
    REFERENCES `adoptapatas`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `adoptapatas`.`post_likes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adoptapatas`.`post_likes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `liked_post_id` BIGINT NULL DEFAULT NULL,
  `user_liker_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK48p5u23eef2brs9klongvsm3b` (`liked_post_id` ASC) VISIBLE,
  INDEX `FKdmmwjenul888pnba8o08rkdqa` (`user_liker_id` ASC) VISIBLE,
  CONSTRAINT `FK48p5u23eef2brs9klongvsm3b`
    FOREIGN KEY (`liked_post_id`)
    REFERENCES `adoptapatas`.`user_post` (`id`),
  CONSTRAINT `FKdmmwjenul888pnba8o08rkdqa`
    FOREIGN KEY (`user_liker_id`)
    REFERENCES `adoptapatas`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `adoptapatas`.`user_following`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adoptapatas`.`user_following` (
  `followers_id` BIGINT NOT NULL,
  `following_id` BIGINT NOT NULL,
  PRIMARY KEY (`followers_id`, `following_id`),
  INDEX `FKj0avh5q4feap4g0rkus640u4d` (`following_id` ASC) VISIBLE,
  CONSTRAINT `FKj0avh5q4feap4g0rkus640u4d`
    FOREIGN KEY (`following_id`)
    REFERENCES `adoptapatas`.`user` (`id`),
  CONSTRAINT `FKk3oj7eus6p08k33yhjcmysiu5`
    FOREIGN KEY (`followers_id`)
    REFERENCES `adoptapatas`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
