-- MySQL Script generated by MySQL Workbench
-- Wed Feb 26 13:53:20 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mini_twitter
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mini_twitter
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mini_twitter` DEFAULT CHARACTER SET utf8mb4;
USE `mini_twitter` ;

-- -----------------------------------------------------
-- Table `mini_twitter`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mini_twitter`.`User` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `handle` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `handle`),
  UNIQUE INDEX `handle_UNIQUE` (`handle` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mini_twitter`.`UserFollowsUser`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mini_twitter`.`UserFollowsUser` (
  `followerId` INT NOT NULL,
  `followeeId` INT NOT NULL,
  PRIMARY KEY (`followerId`, `followeeId`),
  INDEX `fk_User_has_User_User1_idx` (`followeeId` ASC),
  INDEX `fk_User_has_User_User_idx` (`followerId` ASC),
  CONSTRAINT `fk_User_has_User_User`
    FOREIGN KEY (`followerId`)
    REFERENCES `mini_twitter`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_User_User1`
    FOREIGN KEY (`followeeId`)
    REFERENCES `mini_twitter`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mini_twitter`.`Post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mini_twitter`.`Post` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `userId` INT NOT NULL,
  `text` VARCHAR(140) NOT NULL,
  `replyingToPostId` INT,
  PRIMARY KEY (`id`, `userId`),
  INDEX `fk_Post_User1_idx` (`userId` ASC),
  INDEX `fk_Post_Post1_idx` (`replyingToPostId` ASC),
  CONSTRAINT `fk_Post_User1`
    FOREIGN KEY (`userId`)
    REFERENCES `mini_twitter`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Post_Post1`
    FOREIGN KEY (`replyingToPostId`)
    REFERENCES `mini_twitter`.`Post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mini_twitter`.`Image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mini_twitter`.`Image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `url` VARCHAR(100) NULL,
  `postId` INT,
  PRIMARY KEY (`id`),
  INDEX `fk_Image_Post1_idx` (`postId` ASC),
  CONSTRAINT `fk_Images_Post1`
    FOREIGN KEY (`postId`)
    REFERENCES `mini_twitter`.`Post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mini_twitter`.`Likes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mini_twitter`.`Like` (
  `userId` INT NOT NULL,
  `postId` INT NOT NULL,
  PRIMARY KEY (`postId`, `userId`),
  INDEX `fk_Post_has_User_User1_idx` (`userId` ASC),
  INDEX `fk_Post_has_User_Post1_idx` (`postId` ASC),
  CONSTRAINT `fk_Post_has_User_Post1`
    FOREIGN KEY (`postId`)
    REFERENCES `mini_twitter`.`Post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Post_has_User_User1`
    FOREIGN KEY (`userId`)
    REFERENCES `mini_twitter`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
