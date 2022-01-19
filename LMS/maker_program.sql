use lms;
CREATE TABLE maker_program(
  id int(11) NOT NULL,
  program_name int(11) NOT NULL,
  program_type varchar(10) DEFAULT NULL,
  program_link text DEFAULT NULL,
  tech_stack_id int(4) DEFAULT NULL,
  tech_type_id int(4) NOT NULL,
  is_program_approved int (1),
  description varchar(500) DEFAULT NULL,
  status int(3) DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int(11) DEFAULT NULL,
  KEY `FK_maker_program_tech_stack_id` (`tech_stack_id`),
  CONSTRAINT `FK_maker_program_tech_stack_id` FOREIGN KEY (`tech_stack_id`) REFERENCES `tech_stack` (`id`),
  KEY `FK_maker_program_tech_type_id` (`tech_type_id`),
  CONSTRAINT `FK_maker_program_tech_type_id` FOREIGN KEY (`tech_type_id`) REFERENCES `tech_type` (`id`),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;