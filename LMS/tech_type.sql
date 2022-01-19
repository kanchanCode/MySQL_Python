use lms;
CREATE TABLE tech_type (
  id int(11) NOT NULL,
  type_name varchar(50) NOT NULL,
  cur_status char(1) DEFAULT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
