use lms;
CREATE TABLE lab_threshold(
  id int(11) NOT NULL,
  lab_id int(11) NOT NULL,
  lab_capacity varchar(50) DEFAULT NULL,
  lead_threshold int(3) DEFAULT NULL,
  ideation_engg_threshold int(3) DEFAULT NULL,
  buddy_engg_threshold int(3) DEFAULT NULL,
  status int(3) DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int(11) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY `FK_lab_lab_id` (`lab_id`),
  CONSTRAINT `FK_lab_lab_id` FOREIGN KEY (`lab_id`) REFERENCES `candidate_lead` (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
