CREATE  DATABASE IF NOT EXISTS tododb DEFAULT CHARACTER SET utf8;
use tododb;

CREATE TABLE IF NOT EXISTS todos (
    id int NOT NULL AUTO_INCREMENT,
    title varchar(50),
    content varchar(140),
    -- created_at datetime NOT NULL,
    -- updated_at datetime NOT NULL,
    PRIMARY KEY (id)
);