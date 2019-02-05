DROP TABLE IF EXISTS tutorials_tbl;

CREATE TABLE tutorials_tbl(
   tutorial_id INT NOT NULL AUTO_INCREMENT,
   tutorial_title VARCHAR(100) NOT NULL,
   tutorial_author VARCHAR(40) NOT NULL,
   submission_date DATE,
   PRIMARY KEY ( tutorial_id )
);

INSERT INTO tutorials_tbl (tutorial_title, tutorial_author, submission_date) VALUES 
("Learn PHP", "AKILAN", NOW()),("Learn PYTHON", "JEGAN", NOW()),("Learn RUBY", "ANNACHI", NOW());