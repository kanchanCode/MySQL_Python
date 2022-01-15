use student_db;

#created table employee
CREATE TABLE employee (
  emp_id INT PRIMARY KEY,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  birth_day DATE,
  sex VARCHAR(1),
  salary INT,
  super_id INT,
  branch_id INT
);

#created table branch
CREATE TABLE branch (
  branch_id INT PRIMARY KEY,
  branch_name VARCHAR(40),
  mgr_id INT,
  mgr_start_date DATE,
  FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

#Alter table employee adding foreign key branch_id
ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

#Alter table employee adding foreign key super_id
ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

-- creating table client with branch_id as foreign key
CREATE TABLE client (
  client_id INT PRIMARY KEY,
  client_name VARCHAR(40),
  branch_id INT,
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

-- creating table works_with with emp_id , client_id as foreign key and emp_id+client_id as composite key
CREATE TABLE works_with (
  emp_id INT,
  client_id INT,
  total_sales INT,
  PRIMARY KEY(emp_id, client_id),
  FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
  FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

-- creating table branch_supplier with branch_id as foreign key and branch_id+supplier_id as composite key
CREATE TABLE branch_supplier (
  branch_id INT,
  supplier_name VARCHAR(40),
  supply_type VARCHAR(40),
  PRIMARY KEY(branch_id, supplier_name),
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);

-- INSERTING THE VALUES

-- corporate
INSERT INTO employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);
-- super_id and branch_id as NULL because these are foreign keys and we have not inserted any value for those yet

INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');

-- updating the branch_id for David
UPDATE employee
SET branch_id = 1
WHERE emp_id = 100;

INSERT INTO employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);

-- Scranton
INSERT INTO employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;

INSERT INTO employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

-- Stamford
INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);


SET FOREIGN_KEY_CHECKS=0;

-- BRANCH SUPPLIER
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Lables', 'Custom Forms');

-- CLIENT
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

-- WORKS_WITH
INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);

-- SELECT 

-- Find all 
SELECT * FROM employee;
SELECT * FROM branch;
SELECT * FROM branch_supplier;
SELECT * FROM client;
SELECT * FROM works_with;

SELECT * FROM employee
ORDER BY first_name;

SELECT first_name AS forename,last_name AS surname
FROM employee;

SELECT DISTINCT branch_id 
FROM employee;

SELECT COUNT(emp_id)
FROM employee;

SELECT COUNT(emp_id)
FROM employee
WHERE sex='F';

SELECT AVG(salary)
FROM employee;

SELECT SUM(salary)
FROM employee;

SELECT SUM(total_sales),emp_id
FROM works_with
GROUP BY emp_id;

-- wildcards
-- % = any # characters,_ = one character

SELECT * 
FROM client
WHERE client_name LIKE '%LLC';

SELECT * 
FROM branch_supplier
WHERE supplier_name LIKE '%Labels';

SELECT * 
FROM employee
WHERE birth_day LIKE '____-10%';

-- UNION

-- list of employee and branch names

SELECT first_name AS Company_names
FROM employee
UNION
SELECT branch_name
FROM branch;

-- list of all clients and supplier names

SELECT client_name 
FROM client
UNION
SELECT supplier_name
FROM branch_supplier;
-- JOINS

INSERT INTO branch VALUES(4,'New Entry',NULL,NULL);

SELECT e.emp_id,e.first_name,b.branch_name
FROM employee as e
JOIN branch as b
ON e.emp_id=b.mgr_id;

SELECT e.emp_id,e.first_name,b.branch_name
FROM employee as e
LEFT JOIN branch as b
ON e.emp_id=b.mgr_id;

SELECT e.emp_id,e.first_name,b.branch_name
FROM employee as e
RIGHT JOIN branch as b
ON e.emp_id=b.mgr_id;

-- NESTED QUERIES

-- names of the employees who have sold over 30,000 to a single client
SELECT e.first_name,e.last_name
FROM employee as e
WHERE e.emp_id IN(
	SELECT w.emp_id
	FROM works_with as w
	WHERE w.total_sales > 30000
);

-- all clients who are handled by the branch that Micheal Scott manages
-- (Assume you know Micheal's ID)

SELECT c.client_name
FROM client as c
WHERE c.branch_id=(
	SELECT b.branch_id
	FROM branch as b
	WHERE b.mgr_id=102
);

-- ON DELETE
-- ON DELETE SET NULL, ON DELETE CASCADE

DELETE FROM employee
WHERE emp_id=102;

SELECT * FROM branch;

DELETE FROM branch_supplier
WHERE branch_id=2;
-- on delete cascade deletes it completely , generally used to 
-- delete primary key 

-- TRIGGERS

CREATE TABLE triggers_test(
	message VARCHAR(100)
);

DELIMITER $$
CREATE
    TRIGGER my_trigger BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
        INSERT INTO triggers_test VALUES('added new employee');
    END$$
DELIMITER ;

INSERT INTO employee
VALUES(109, 'Oscar', 'Martinez', '1968-02-19', 'M', 69000, 106, 3);


DELIMITER $$
CREATE
    TRIGGER my_trigger1 BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
        INSERT INTO triggers_test VALUES(NEW.first_name);
    END$$
DELIMITER ;

INSERT INTO employee
VALUES(110, 'Kevin', 'Malone', '1978-02-19', 'M', 69000, 106, 3);

DELIMITER $$
CREATE
    TRIGGER my_trigger2 BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
         IF NEW.sex = 'M' THEN
               INSERT INTO triggers_test VALUES('added male employee');
         ELSEIF NEW.sex = 'F' THEN
               INSERT INTO triggers_test VALUES('added female');
         ELSE
               INSERT INTO triggers_test VALUES('added other employee');
         END IF;
    END$$
DELIMITER ;
INSERT INTO employee
VALUES(111, 'Pam', 'Beesly', '1988-02-19', 'F', 69000, 106, 3);

SELECT * FROM triggers_test;
DROP TRIGGER my_trigger1;
