use tododb;

INSERT INTO categories (title) VALUES ("none");
INSERT INTO categories (title) VALUES ("study");
INSERT INTO categories (title) VALUES ("programming");
INSERT INTO categories (title) VALUES ("work");
INSERT INTO categories (title) VALUES ("life");

INSERT INTO todos (title, content, category_id) VALUES ("AI", "no.5-homework", 2);
INSERT INTO todos (title, content, category_id) VALUES ("shopping", "milk, tomato, bread", 5);
INSERT INTO todos (title, content, category_id) VALUES ("programming", "sinatra server", 3);
INSERT INTO todos (title, content, category_id) VALUES ("office", "20xx/x/y, zzz-company", 4);
INSERT INTO todos (title, content, category_id) VALUES ("blog", "3 articles", 1);
