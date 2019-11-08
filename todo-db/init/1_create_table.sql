DROP DATABASE IF EXISTS tododb;
CREATE DATABASE IF NOT EXISTS tododb DEFAULT CHARACTER SET utf8;
use tododb;

DROP TABLE IF EXISTS todos;
CREATE TABLE IF NOT EXISTS todos (
    id int NOT NULL AUTO_INCREMENT,
    title varchar(50) NOT NULL,
    content varchar(140) NOT NULL,
    created_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS categories;
CREATE TABLE IF NOT EXISTS categories (
    id int NOT NULL AUTO_INCREMENT,
    title varchar(20) NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE todos ADD category_id int NOT NULL;
ALTER TABLE todos ADD FOREIGN KEY (category_id) REFERENCES categories(id);