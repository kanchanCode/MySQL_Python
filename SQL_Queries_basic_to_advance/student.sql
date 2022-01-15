use student_db;

DROP TABLE student;

CREATE TABLE student( student_id INT AUTO_INCREMENT,
name VARCHAR(30) NOT NULL,
major VARCHAR(30) DEFAULt 'not decided',
PRIMARY KEY(student_id));

DESC student;

SELECT * FROM student;

INSERT INTO student VALUES(1,'Jack','Biology');
INSERT INTO student VALUES(2,'Kate','Sociology');
INSERT INTO student(name) VALUES('Claire');
INSERT INTO student(name,major) VALUES('Jack','Biology'),
('Mike','Computer Science');

SET SQL_SAFE_UPDATES = 0;
UPDATE student 
SET major ="Bio"
WHERE major="Biology";

UPDATE student 
SET major ="Chemistry"
WHERE student_id=4;


UPDATE student 
SET major ="BioChemistry"
WHERE major="Bio" OR major="Chemistry";

DELETE FROM student 
WHERE student_id=6;

#SELECT command

SELECT name,major
FROM student
ORDER BY name ASC;

SELECT *
FROM student
ORDER BY major,student_id DESC
LIMIT 2;

SELECT *
FROM student
WHERE student_id <> 7;

SELECT *
FROM student
WHERE name IN('Kate','Claire') AND student_id>2;