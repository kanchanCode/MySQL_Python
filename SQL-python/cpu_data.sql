use cpu_data;
create table cpu_log(
Roll_no int,Cpu_Count int ,Cpu_Working_Time decimal,Cpu_idle_Time bigint,
cpu_percent decimal ,Usage_Cpu_Count int,
no_of_software_bootlmss bigint ,no_of_sys_calls int, no_of_interrupts bigint,
avg_load_1min decimal,avg_load_5_mins decimal,avg_load_15_mins decimal,
sys_total_memory decimal,sys_used_memory decimal,sys_free_memory decimal,active_memory decimal,
inactive_memory decimal,buffer_memory decimal,cached_memory decimal,shared_memory decimal,
available_memory decimal,disk_total_memory bigint,disk_used_memory bigint,
disk_free_memory bigint,disk_read_count bigint,disk_write_count bigint,
disk_read_bytes bigint,disk_write_bytes bigint,
time_spent_reading_disk bigint,
time_spent_writing_disk bigint,time_spent_io bigint,
no_of_bytes_sent bigint,no_of_bytes_received bigint, pkt_sent bigint,
pkt_received bigint,error_receiving int(10),error_sending int(10),
total_no_incoming_pkg int(10),total_no_outgoing_pkg int(10),
boot_time varchar(50),user_name varchar(50),keyboard int,mouse int,
technology varchar(30),files_changed int(10));

drop table cpu_log;
desc cpu_log;

select * from cpu_log;

select Roll_no,user_name,technology from cpu_log where user_name='you@example.com';

CREATE INDEX cpu_log_user_name_idx ON cpu_log(user_name);

DELIMITER //
CREATE PROCEDURE sp_students()
BEGIN
SELECT Roll_no,technology FROM cpu_log WHERE files_changed>10;
END//
DELIMITER ;

CALL sp_students;
    
CREATE TABLE triggers_test(
	message VARCHAR(100)
);

DELIMITER $$
CREATE
    TRIGGER my_trigger1 BEFORE INSERT
    ON cpu_log
    FOR EACH ROW BEGIN
        INSERT INTO triggers_test VALUES("Data inserted");
    END$$
DELIMITER ;

INSERT INTO cpu_log(Roll_no,technology,files_changed)
VALUES(1868,'android',13);
    
SELECT * FROM triggers_test;