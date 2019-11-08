use tododb;

INSERT INTO categories (title) VALUES ("none");
INSERT INTO categories (title) VALUES ("study");
INSERT INTO categories (title) VALUES ("programming");
INSERT INTO categories (title) VALUES ("work");
INSERT INTO categories (title) VALUES ("life");

INSERT INTO todos (title, content, category_id) VALUES ("AI", "no.5-homework", 2);
INSERT INTO todos (title, content, category_id) VALUES ("買い物", "牛乳・トマト・パスタ・食パン", 5);
INSERT INTO todos (title, content, category_id) VALUES ("programming", "sinatra server", 3);
INSERT INTO todos (title, content, category_id) VALUES ("面接", "x月y日zzz社", 4);
INSERT INTO todos (title, content, category_id) VALUES ("ブログ", "3記事執筆", 1);
