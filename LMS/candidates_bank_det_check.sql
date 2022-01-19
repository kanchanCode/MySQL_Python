CREATE TABLE candidate_bank_det(
  id int(11) NOT NULL,
  candidate_id int(11) NOT NULL,
  name varchar(100) NOT NULL,
  account_num int(11) NOT NULL,
  is_account_num_verified int (1) DEFAULT 0,
  ifsc_code varchar(20) NOT NULL,
  is_ifsc_code_verified int (1) DEFAULT 0,
  pan_number varchar(10) DEFAULT NULL,
  is_pan_number_verified int (1) DEFAULT 0,
  addhaar_num int(11) NOT NULL,
  is_addhaar_num_verified int (1) DEFAULT 0,
  KEY `FK_candidate_bank_det_candidate_id` (`candidate_id`),
  CONSTRAINT `FK_candidate_bank_det_candidate_id` FOREIGN KEY (`candidate_id`)       REFERENCES `fellowship_candidates` (`id`),
  creator_stamp datetime DEFAULT NULL,
  creator_user int(11) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8; 
