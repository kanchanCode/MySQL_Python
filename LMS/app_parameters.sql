use lms;
CREATE TABLE app_parameters (
  id int(11) NOT NULL,
  key_type varchar(20) NOT NULL,
  key_value varchar(20) NOT NULL,
  key_text varchar(80) DEFAULT NULL,
  cur_status char(1) DEFAULT NULL,
  lastupd_user int(11) DEFAULT NULL,
  lastupd_stamp datetime DEFAULT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int(11) DEFAULT NULL,
  seq_num int(4) DEFAULT NULL,
  KEY app_parameters_1 (key_type,  key_value)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
