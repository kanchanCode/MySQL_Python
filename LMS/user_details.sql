use lms;
CREATE TABLE user_details (
  id int(11) NOT NULL,
  email varchar(50) NOT NULL,
  first_name varchar(100) NOT NULL,
  last_name varchar(100) NOT NULL,
  password varchar(15) NOT NULL,
  contact_number bigint(20) NOT NULL,
  verified bit(1) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY UK_4d9rdl7d52k8x3etihxlaujvh (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS=1;