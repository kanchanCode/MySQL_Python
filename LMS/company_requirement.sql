use lms;
CREATE TABLE company_requirement(
id int(11) NOT NULL,
company_id int(11) NOT NULL,
candidate_id int(11) NOT NULL,
requested_month varchar(20) NOT NULL,
city varchar(20) DEFAULT NULL,
is_doc_verification int(3) DEFAULT 1,
requirement_doc_path varchar(500) DEFAULT NULL,
no_of_engg int(4) NOT NULL,
tech_stack_id int(4) NOT NULL,
tech_type_id int(4) NOT NULL,
maker_programs_id int(4) NOT NULL,
lead_id int(4) NOT NULL,
ideateion_engg_id int(4) DEFAULT NULL,
buddy_engg_id int(4)  DEFAULT NULL,
special_remark text DEFAULT NULL,
status int(3) DEFAULT 1,
creator_stamp datetime DEFAULT NULL,
creator_user int(11) DEFAULT NULL,
  KEY `FK_candidate_candidate_id` (`candidate_id`),
  CONSTRAINT `FK_candidate_candidate_id` FOREIGN KEY (`candidate_id`) REFERENCES `fellowship_candidates` (`id`),
PRIMARY KEY(id)
)ENGINE = InnoDB DEFAULT CHARSET = utf8;
