use lms;
CREATE TABLE mentor_ideation_map(
  id int(11) NOT NULL,
  mentor_id int(4) NOT NULL,
  status int(3) DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int(11) DEFAULT NULL,
    KEY `FK_mentor_ideation_map_mentor_id` (`mentor_id`),
  CONSTRAINT `FK_mentor_ideation_map_mentor_id` FOREIGN KEY (`mentor_id`) REFERENCES `mentor` (`id`),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;