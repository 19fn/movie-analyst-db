-- CREATE SCHEMA `movie_db` ;
use `movie_db`;

-- CREATE TABLES;
CREATE TABLE `publications` (
	`name` VARCHAR(250) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`avatar` VARCHAR(250) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	PRIMARY KEY (`name`) USING BTREE
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
;

CREATE TABLE `reviewers` (
	`name` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`publication` VARCHAR(250) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`avatar` VARCHAR(250) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	PRIMARY KEY (`name`) USING BTREE,
	INDEX `publication_fk` (`publication`) USING BTREE,
	CONSTRAINT `publication_fk` FOREIGN KEY (`publication`) REFERENCES `movie_db`.`publications` (`name`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
;


CREATE TABLE `movies` (
	`title` VARCHAR(250) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`release` VARCHAR(250) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`score` INT NULL DEFAULT NULL,
	`reviewer` VARCHAR(250) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	PRIMARY KEY (`title`) USING BTREE,
	INDEX `reviewer_id` (`reviewer`) USING BTREE,
	CONSTRAINT `reviewer_id` FOREIGN KEY (`reviewer`) REFERENCES `movie_db`.`reviewers` (`name`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
;

-- Publications
INSERT INTO publications (name,avatar) VALUES ("Publication 1","glyphicon-user");
INSERT INTO publications (name,avatar) VALUES ("Publication 2","glyphicon-user");
INSERT INTO publications (name,avatar) VALUES ("Publication 3","glyphicon-user");
INSERT INTO publications (name,avatar) VALUES ("Publication 4","glyphicon-user");
INSERT INTO publications (name,avatar) VALUES ("Publication 5","glyphicon-user");
INSERT INTO publications (name,avatar) VALUES ("Publication 6","glyphicon-user");

-- Reviewers
INSERT INTO reviewers (name,publication,avatar) VALUES ("Pablo Veron","Publication 1","https://moviemaker.blob.core.windows.net/images/avatar1.png");
INSERT INTO reviewers (name,publication,avatar) VALUES ("Estefania Gomez Peverini","Publication 2","https://moviemaker.blob.core.windows.net/images/avatar2.png");
INSERT INTO reviewers (name,publication,avatar) VALUES ("Eliel Bloemer","Publication 3","https://moviemaker.blob.core.windows.net/images/avatar3.png");
INSERT INTO reviewers (name,publication,avatar) VALUES ("Mateo Bilbao","Publication 4","https://moviemaker.blob.core.windows.net/images/avatar4.png");
INSERT INTO reviewers (name,publication,avatar) VALUES ("Matias Lorenzo","Publication 5","https://moviemaker.blob.core.windows.net/images/avatar5.png");
INSERT INTO reviewers (name,publication,avatar) VALUES ("Pablo Bilbao","Publication 6","https://moviemaker.blob.core.windows.net/images/avatar6.png");

-- Movies
INSERT INTO movies (title,`release`,score,reviewer) VALUES ("The Shawshank Redemption",1994,9,"Pablo Veron");
INSERT INTO movies (title,`release`,score,reviewer) VALUES ("The Godfather",1992,9,"Estefania Gomez Peverini");
INSERT INTO movies (title,`release`,score,reviewer) VALUES ("The Dark Knight",2008,10,"Eliel Bloemer");
INSERT INTO movies (title,`release`,score,reviewer) VALUES ("Schindler's List",1993,8,"Mateo Bilbao");
INSERT INTO movies (title,`release`,score,reviewer) VALUES ("Pulp Fiction",1994,8,"Matias Lorenzo");
INSERT INTO movies (title,`release`,score,reviewer) VALUES ("Forrest Gump",1994,8,"Pablo Bilbao");