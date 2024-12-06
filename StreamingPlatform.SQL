


-- -----------------------------------------------------
-- Schema StreamingPlatform
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `StreamingPlatform` DEFAULT CHARACTER SET utf8mb3 ;
USE `StreamingPlatform` ;

-- -----------------------------------------------------
-- Table `StreamingPlatform`.`TV Show`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StreamingPlatform`.`TV Show` (
  `showID` INT NOT NULL,
  `Show_title` CHAR(40) NULL DEFAULT NULL,
  `Show_description` TINYTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`showID`),
  UNIQUE INDEX `showID_UNIQUE` (`showID` ASC) VISIBLE)

DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `StreamingPlatform`.`Episode`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StreamingPlatform`.`Episode` (
  `episodeID` INT NOT NULL,
  `Episode_title` CHAR(40) NULL DEFAULT NULL,
  `Episode_Description` TINYTEXT NULL DEFAULT NULL,
  `season_number` INT NOT NULL,
  `episode_number` INT NULL DEFAULT NULL,
  `showID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`episodeID`),
  UNIQUE INDEX `episodeID_UNIQUE` (`episodeID` ASC) VISIBLE,
  INDEX `fk_tvshow_episode` (`showID` ASC) VISIBLE,
  CONSTRAINT `fk_tvshow_episode`
    FOREIGN KEY (`showID`)
    REFERENCES `StreamingPlatform`.`TV Show` (`showID`))

DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `StreamingPlatform`.`Genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StreamingPlatform`.`Genre` (
  `genreID` INT NOT NULL,
  `genre_name` CHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`genreID`),
  UNIQUE INDEX `genreID_UNIQUE` (`genreID` ASC) VISIBLE)

DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `StreamingPlatform`.`Movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StreamingPlatform`.`Movie` (
  `movieID` INT NOT NULL,
  `MovieTitle` CHAR(40) NULL DEFAULT NULL,
  `MovieDescription` TINYTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`movieID`),
  UNIQUE INDEX `movieID_UNIQUE` (`movieID` ASC) VISIBLE)

DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `StreamingPlatform`.`MovieGenre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StreamingPlatform`.`MovieGenre` (
  `movieID` INT NOT NULL,
  `genreID` INT NOT NULL,
  PRIMARY KEY (`movieID`, `genreID`),
  INDEX `genreID` (`genreID` ASC) VISIBLE,
  CONSTRAINT `moviegenre_ibfk_1`
    FOREIGN KEY (`movieID`)
    REFERENCES `StreamingPlatform`.`Movie` (`movieID`),
  CONSTRAINT `moviegenre_ibfk_2`
    FOREIGN KEY (`genreID`)
    REFERENCES `StreamingPlatform`.`Genre` (`genreID`))

DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `StreamingPlatform`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StreamingPlatform`.`User` (
  `userID` INT NOT NULL,
  `first_name` CHAR(25) NULL DEFAULT NULL,
  `last_name` CHAR(25) NULL DEFAULT NULL,
  `username` CHAR(25) NULL DEFAULT NULL,
  `email_address` CHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`userID`))

DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `StreamingPlatform`.`Progress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StreamingPlatform`.`Progress` (
  `progressID` INT NOT NULL,
  `TimeStamp` TIMESTAMP(6) NULL DEFAULT NULL,
  `last_watched_date` DATETIME NULL DEFAULT NULL,
  `Completed` TINYINT(1) NULL DEFAULT NULL,
  `userID` INT NULL DEFAULT NULL,
  `movieID` INT NULL DEFAULT NULL,
  `episodeID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`progressID`),
  UNIQUE INDEX `progressID_UNIQUE` (`progressID` ASC) VISIBLE,
  INDEX `fk_user_progress` (`userID` ASC) VISIBLE,
  INDEX `fk_movie_progress` (`movieID` ASC) VISIBLE,
  INDEX `fk_episode_progress` (`episodeID` ASC) VISIBLE,
  CONSTRAINT `fk_episode_progress`
    FOREIGN KEY (`episodeID`)
    REFERENCES `StreamingPlatform`.`Episode` (`episodeID`),
  CONSTRAINT `fk_movie_progress`
    FOREIGN KEY (`movieID`)
    REFERENCES `StreamingPlatform`.`Movie` (`movieID`),
  CONSTRAINT `fk_user_progress`
    FOREIGN KEY (`userID`)
    REFERENCES `StreamingPlatform`.`User` (`userID`))

DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `StreamingPlatform`.`Queue`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StreamingPlatform`.`Queue` (
  `queueID` INT NOT NULL,
  `position_in_queue` INT NOT NULL,
  `userID` INT NULL DEFAULT NULL,
  `movieID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`queueID`),
  UNIQUE INDEX `queueID_UNIQUE` (`queueID` ASC) VISIBLE,
  INDEX `fk_user_queue` (`userID` ASC) VISIBLE,
  INDEX `fk_movie_queue` (`movieID` ASC) VISIBLE,
  CONSTRAINT `fk_movie_queue`
    FOREIGN KEY (`movieID`)
    REFERENCES `StreamingPlatform`.`Movie` (`movieID`),
  CONSTRAINT `fk_user_queue`
    FOREIGN KEY (`userID`)
    REFERENCES `StreamingPlatform`.`User` (`userID`))

DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `StreamingPlatform`.`Review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StreamingPlatform`.`Review` (
  `ReviewID` INT NOT NULL,
  `stars` INT NULL DEFAULT NULL,
  `ReviewDescription` TINYTEXT NULL DEFAULT NULL,
  `date_of_review` DATETIME NULL DEFAULT NULL,
  `userID` INT NULL DEFAULT NULL,
  `movieID` INT NULL DEFAULT NULL,
  `episodeID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ReviewID`),
  UNIQUE INDEX `ReviewID_UNIQUE` (`ReviewID` ASC) VISIBLE,
  INDEX `fk_user_review` (`userID` ASC) VISIBLE,
  INDEX `fk_movie_review` (`movieID` ASC) VISIBLE,
  INDEX `fk_episode_review` (`episodeID` ASC) VISIBLE,
  CONSTRAINT `fk_episode_review`
    FOREIGN KEY (`episodeID`)
    REFERENCES `StreamingPlatform`.`Episode` (`episodeID`),
  CONSTRAINT `fk_movie_review`
    FOREIGN KEY (`movieID`)
    REFERENCES `StreamingPlatform`.`Movie` (`movieID`),
  CONSTRAINT `fk_user_review`
    FOREIGN KEY (`userID`)
    REFERENCES `StreamingPlatform`.`User` (`userID`))

DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `StreamingPlatform`.`Subscription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StreamingPlatform`.`Subscription` (
  `subscriptionID` INT NOT NULL,
  `subscriptionType` CHAR(25) NULL DEFAULT NULL,
  `Subscription_start_date` DATETIME NULL DEFAULT NULL,
  `Subscription_end_date` DATETIME NULL DEFAULT NULL,
  `payment` DECIMAL(10,2) NULL DEFAULT NULL,
  `userID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`subscriptionID`),
  UNIQUE INDEX `subscriptionID_UNIQUE` (`subscriptionID` ASC) VISIBLE,
  INDEX `fk_user_subscription` (`userID` ASC) VISIBLE,
  CONSTRAINT `fk_user_subscription`
    FOREIGN KEY (`userID`)
    REFERENCES `StreamingPlatform`.`User` (`userID`))

DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `StreamingPlatform`.`TVShowGenre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StreamingPlatform`.`TVShowGenre` (
  `showID` INT NOT NULL,
  `genreID` INT NOT NULL,
  PRIMARY KEY (`showID`, `genreID`),
  INDEX `genreID` (`genreID` ASC) VISIBLE,
  CONSTRAINT `tvshowgenre_ibfk_1`
    FOREIGN KEY (`showID`)
    REFERENCES `StreamingPlatform`.`TV Show` (`showID`),
  CONSTRAINT `tvshowgenre_ibfk_2`
    FOREIGN KEY (`genreID`)
    REFERENCES `StreamingPlatform`.`Genre` (`genreID`))

DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `StreamingPlatform`.`UserGenre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StreamingPlatform`.`UserGenre` (
  `userID` INT NOT NULL,
  `genreID` INT NOT NULL,
  PRIMARY KEY (`userID`, `genreID`),
  INDEX `genreID` (`genreID` ASC) VISIBLE,
  CONSTRAINT `usergenre_ibfk_1`
    FOREIGN KEY (`userID`)
    REFERENCES `StreamingPlatform`.`User` (`userID`),
  CONSTRAINT `usergenre_ibfk_2`
    FOREIGN KEY (`genreID`)
    REFERENCES `StreamingPlatform`.`Genre` (`genreID`))

DEFAULT CHARACTER SET = utf8mb3;


