use normalization;
CREATE TABLE fellowship_candidate (
id int(11) NOT NULL PRIMARY KEY ,
first_name varchar(100) NOT NULL,
last_name varchar(100) NOT NULL,
tech_stack_id int NOT NULL,
mentor_id int NOT NULL,
FOREIGN KEY (tech_stack_id) REFERENCES fellowship_mentor (mentor_id),
FOREIGN KEY (mentor_id) REFERENCES tech_stack (tech_id)
)

