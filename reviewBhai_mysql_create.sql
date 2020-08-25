CREATE TABLE `User` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`Name` VARCHAR(50) NOT NULL,
	`created_at` DATETIME,
	`email` VARCHAR(50) NOT NULL UNIQUE,
	`password` VARCHAR(50) NOT NULL,
	`gender` VARCHAR(50) NOT NULL,
	`achivements` TEXT(20) NOT NULL,
	`location` TEXT(50),
	`contact` INT(14) NOT NULL UNIQUE,
	PRIMARY KEY (`id`,`email`)
);

CREATE TABLE `Post` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`user_id` INT,
	`user_name` VARCHAR(50) NOT NULL,
	`restaurant_id` INT NOT NULL,
	`time_posted` DATETIME NOT NULL,
	`restaurant_location` TEXT NOT NULL,
	`post_title` VARCHAR(100),
	`post_body` TEXT NOT NULL,
	`post_images` blob NOT NULL,
	`is_offer` BOOLEAN NOT NULL,
	`is_recommended` BOOLEAN NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Restaurant` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL,
	`phone_numer` VARCHAR(14),
	`email` VARCHAR(50),
	`location` TEXT,
	`totat_recommendation` INT NOT NULL,
	`totat_reviews` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Stars` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`post_id` INT NOT NULL,
	`Food` FLOAT NOT NULL,
	`Environment` FLOAT NOT NULL,
	`service` FLOAT NOT NULL,
	`cleanliness` FLOAT NOT NULL,
	`overall` FLOAT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Comment` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`user_id` INT NOT NULL,
	`post_id` INT NOT NULL,
	`time` TIMESTAMP NOT NULL,
	`text` TEXT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Comment's_reply` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`user_id` INT NOT NULL,
	`parent_comment` INT NOT NULL,
	`post_id` INT NOT NULL,
	`time` TIMESTAMP NOT NULL,
	`text` TEXT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Reactions` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`post_id` INT NOT NULL,
	`user_id` INT NOT NULL,
	`is_liked` BOOLEAN NOT NULL,
	`is_Disliked` BOOLEAN NOT NULL,
	`is_helpful` BOOLEAN NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `Post` ADD CONSTRAINT `Post_fk0` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`);

ALTER TABLE `Post` ADD CONSTRAINT `Post_fk1` FOREIGN KEY (`user_name`) REFERENCES `User`(`Name`);

ALTER TABLE `Post` ADD CONSTRAINT `Post_fk2` FOREIGN KEY (`restaurant_id`) REFERENCES `Restaurant`(`id`);

ALTER TABLE `Post` ADD CONSTRAINT `Post_fk3` FOREIGN KEY (`restaurant_location`) REFERENCES `Restaurant`(`location`);

ALTER TABLE `Stars` ADD CONSTRAINT `Stars_fk0` FOREIGN KEY (`post_id`) REFERENCES `Post`(`id`);

ALTER TABLE `Comment` ADD CONSTRAINT `Comment_fk0` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`);

ALTER TABLE `Comment` ADD CONSTRAINT `Comment_fk1` FOREIGN KEY (`post_id`) REFERENCES `Post`(`id`);

ALTER TABLE `Comment's_reply` ADD CONSTRAINT `Comment's_reply_fk0` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`);

ALTER TABLE `Comment's_reply` ADD CONSTRAINT `Comment's_reply_fk1` FOREIGN KEY (`parent_comment`) REFERENCES `Comment`(`id`);

ALTER TABLE `Comment's_reply` ADD CONSTRAINT `Comment's_reply_fk2` FOREIGN KEY (`post_id`) REFERENCES `Post`(`id`);

ALTER TABLE `Reactions` ADD CONSTRAINT `Reactions_fk0` FOREIGN KEY (`post_id`) REFERENCES `Post`(`id`);

ALTER TABLE `Reactions` ADD CONSTRAINT `Reactions_fk1` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`);

