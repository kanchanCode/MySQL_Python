use lms;
CREATE TABLE mentor_techstack(
  id int(11) NOT NULL,
  mentor_id int(11) NOT NULL,
  tech_stack_id int(4) NOT NULL,
  status int(3) DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int(11) DEFAULT NULL,
  PRIMARY KEY (id),
    KEY `FK_mentor_mentor_id` (`mentor_id`),
  CONSTRAINT `FK_mentor_mentor_id` FOREIGN KEY (`mentor_id`) REFERENCES `mentor` (`id`),
  KEY `FK_mentor_tech_stack_id` (`tech_stack_id`),
  CONSTRAINT `FK_mentor_tech_stack_id` FOREIGN KEY (`tech_stack_id`) REFERENCES `tech_stack` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
