use lms;
CREATE TABLE user_engagement_MIS(
id int(11) NOT NULL,
candidate_id int(11) NOT NULL,
date_of_attendancce datetime DEFAULT NULL,
time_of_attendance datetime DEFAULT NULL,
email_id varchar(50) NOT NULL,
KEY `FK_candidate_candidate_id` (`candidate_id`),
CONSTRAINT `FK_candidate_candidate_id` FOREIGN KEY (`candidate_id`) REFERENCES `fellowship_candidates` (`id`),
PRIMARY KEY (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;





desc user_engagement_MIS;

SELECT @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS=1;


