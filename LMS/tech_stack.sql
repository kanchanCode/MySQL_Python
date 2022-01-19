use lms;
CREATE TABLE tech_stack (
  id int(11) NOT NULL,
  tech_name varchar(50) NOT NULL,
  image_path varchar(500) DEFAULT NULL,
  framework text DEFAULT NULL,
  cur_status char(1) DEFAULT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
