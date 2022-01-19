CREATE TABLE candidate_docs(
  id int(11) NOT NULL,
  candidate_id int(11) NOT NULL,
  doc_type varchar(20) DEFAULT NULL,
  doc_path varchar(500) DEFAULT NULL,
  status int(3) DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int(11) DEFAULT NULL,
    KEY `FK_candidate_docs_candidate_id` (`candidate_id`),
  CONSTRAINT `FK_candidate_docs_candidate_id` FOREIGN KEY (`candidate_id`) REFERENCES `fellowship_candidates` (`id`),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


