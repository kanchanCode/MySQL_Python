use normalization;
CREATE TABLE user_mis (
candidate_id int(11) NOT NULL PRIMARY KEY ,
hired_date datetime NOT NULL,
FOREIGN KEY (candidate_id) REFERENCES  fellowship_candidate (id)
)
