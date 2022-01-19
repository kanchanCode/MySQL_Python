CREATE TABLE candidates_personal_det_check (
  id int(11) NOT NULL,
  candidate_id  int (11) NOT NULL,
  field_name int(11) NOT NULL,
  is_verified int (3) DEFAULT NULL,
  lastupd_stamp datetime DEFAULT NULL,
  lastupd_user int(11) DEFAULT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int(11) DEFAULT NULL
);
