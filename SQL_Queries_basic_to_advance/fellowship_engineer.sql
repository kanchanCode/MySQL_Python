use lms;
CREATE TABLE fellowship_candidates (
  id int(11) NOT NULL,
  first_name varchar(100) NOT NULL,
  middle_name varchar(100) DEFAULT NULL,
  last_name varchar(100) NOT NULL,
  email varchar(50) NOT NULL,
  mobile_num bigint(20) NOT NULL,
  hired_city varchar(50) NOT NULL,
  hired_date datetime NOT NULL,
  degree varchar(50) NOT NULL,
  aggr_per double DEFAULT NULL,
  current_pincode int(11) DEFAULT NULL,
  permanent_pincode int(11) DEFAULT NULL,
  hired_lab varchar(20) DEFAULT NULL,
  attitude_remark varchar(15) DEFAULT NULL,
  communication_remark varchar(15) DEFAULT NULL,
  knowledge_remark varchar(15) DEFAULT NULL,
  birth_date date NOT NULL,
  is_birth_date_verified int (1) DEFAULT 0,
  parent_name varchar(50) DEFAULT NULL,
  parent_occupation varchar(100) NOT NULL,
  parent_mobile_num bigint(20) NOT NULL,
  parent_annual_sal double DEFAULT NULL,
  local_addr varchar(255) NOT NULL,
  permanent_addr varchar(150) DEFAULT NULL,
  photo_path varchar(500) DEFAULT NULL,
  joining_date date DEFAULT NULL,
  candidate_status varchar(20) NOT NULL,
  personal_info_filled int (3) DEFAULT 0,
  bank_info_filled int (3) DEFAULT 0,
  educational_info_filled int (3) DEFAULT 0,
  doc_status varchar(20) DEFAULT NULL,
  remark varchar(150) DEFAULT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int(11) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

-- INSERING VALUES TO fellowship_candidates
INSERT INTO fellowship_candidates
 VALUES (2,'Arun','Deepak','Roy','Arundr@gmail.com',8889996660,'Mumbai','2018-11-05 00:00:00','B.E',79.35,5289,5436,'Pune','Good','Good','Good','1998-07-18',1,'Ketan','Farmer',77774441112,250000,'Mumbai','Mumbai','Codeme','2018-11-05','Good',1,1,1,'Correct','Good',NULL,1);

-- INSERING VALUES TO user_details
 INSERT INTO user_details VALUES
(1,'deepak.63584@gmail.com','deepak','Patil','deepak63584',8956748596,1),
(2,'Arundr@gmail.com','Arun','Roy','Arundr999',8889996660,1);

 
-- creating VIEW
CREATE VIEW Personal_Info AS    
SELECT first_name, middle_name,last_name,email,mobile_num,birth_date
FROM fellowship_candidates;

SELECT * FROM personal_Info;

-- creating FUNCTION
DELIMITER //
CREATE FUNCTION `get_full_name`(inputid int(5)) RETURNS varchar(255) 
DETERMINISTIC
BEGIN
DECLARE full_name varchar(128);
Select CONCAT(first_name, " ", middle_name, " ", last_name) into full_name FROM fellowship_candidates where id = inputid;
return full_name;
END //
DELIMITER ;

select get_full_name(id) as full_name from fellowship_candidates where id=2;

-- PARTITION BY keys

CREATE TABLE hired_candidate2
(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,	first_name VARCHAR(24),		last_name VARCHAR(24),
degree VARCHAR(24),		mobile_num BIGINT(10),		hired_date datetime,	pincode INT(6),
 KEY id (id,pincode)
)
PARTITION BY KEY()  
PARTITIONS 3;  

insert into lms.hired_candidate2(first_name,last_name,degree,mobile_num,hired_date,pincode) values
('omkar','b','BE',7777888899,'2021-06-10',415605),
('ravi','s','MSC',8855225588,'2021-07-15',282001),
('riya','j','BE',9966336699,'2021-08-02',305001),
('nita','d','BTECH',9876543210,'2021-05-23',560002),
('tanvi','n','BSC',7412365478,'2021-08-18',282001),
('raju','k','MSC',8527419630,'2021-07-19',560002),
('harry','p','BE',7744112233,'2021-06-29',581301),
('john','c','BTECH',8975642315,'2021-08-24',305001),
('saina','h','MSC',7534218693,'2021-05-05',560002)
;

SELECT PARTITION_NAME,TABLE_ROWS
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_NAME = 'hired_candidate2';

-- Explain
EXPLAIN SELECT * FROM lms.hired_candidate2 WHERE id = 5;
