use lms;
CREATE TABLE candidate_techstack_assignment(
  id int(11) NOT NULL,
  requirement_id int(11) NOT NULL,
  candidate_id int(11) NOT NULL,
  assign_date datetime DEFAULT NULL,
  status varchar(20) DEFAULT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int(11) DEFAULT NULL,
  KEY `FK_candidate_techstack_assignment_requirement_id` (`requirement_id`),
  CONSTRAINT `FK_candidate_techstack_assignment_requirement_id` FOREIGN KEY (`requirement_id`) REFERENCES `company_requirement` (`id`),
  KEY `FK_candidate_candidate_id` (`candidate_id`),
  CONSTRAINT `FK_candidate_candidate_id` FOREIGN KEY (`candidate_id`) REFERENCES `fellowship_candidates` (`id`),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


