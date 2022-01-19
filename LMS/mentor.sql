use lms;
CREATE TABLE mentor(
  id int(11) NOT NULL,
  name varchar(50) DEFAULT NULL,
  mentor_type varchar(20) DEFAULT NULL,
  lab_id int(4) NOT NULL,
  status int(3) DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int(11) DEFAULT NULL,
  KEY `FK_mentor_lab_id` (`lab_id`),
  CONSTRAINT `FK_mentor_lab_id` FOREIGN KEY (`lab_id`) REFERENCES `mentor` (`id`),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;