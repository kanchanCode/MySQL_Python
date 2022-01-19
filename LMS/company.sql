use lms;
CREATE TABLE company(
  id int(11) NOT NULL,
  name int(11) NOT NULL,
  address varchar(150) DEFAULT NULL,
  location varchar(50) DEFAULT NULL,
  status int(3) DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int(11) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
