''''
@Author: Kanchan
@Date: 2022-01-14
@Last Modified by: Kanchan
@Last Modified time: 2022-01-14
@Title : Import data from excel file to MySQL databasr
'''  

import mysql.connector
import os
import xlrd

db_user=os.environ.get('user_name')
db_pass=os.environ.get('user_pass')
conn=mysql.connector.connect(host="localhost",user=db_user,passwd=db_pass,database="cpu_data")

cur=conn.cursor()
loc=("C:\\Users\\hp\Desktop\\CpuLogData.xlsx")

l=list()
a=xlrd.open_workbook(loc)
sheet=a.sheet_by_index(0)
sheet.cell_value(0,0)

for i in range(1,1868):
    l.append(tuple(sheet.row_values(i)))

print(l)

q="""INSERT INTO 
cpu_log(Roll_no,Cpu_Count,Cpu_Working_Time,
Cpu_idle_Time,cpu_percent,Usage_Cpu_Count,
no_of_software_boots,no_of_sys_calls,no_of_interrupts,
avg_load_1min,avg_load_5_mins,avg_load_15_mins,
sys_total_memory,sys_used_memory,sys_free_memory,
active_memory,inactive_memory,buffer_memory,
cached_memory,shared_memory,available_memory,
disk_total_memory,disk_used_memory,disk_free_memory,
disk_read_count,disk_write_count,disk_read_bytes,
disk_write_bytes,time_spent_reading_disk,time_spent_writing_disk,
time_spent_io,no_of_bytes_sent,no_of_bytes_received,
pkt_sent,pkt_received,error_receiving,
error_sending,total_no_incoming_pkg,total_no_outgoing_pkg,
boot_time,user_name,keyboard,
mouse,technology,files_changed) 
VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,
%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,
%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,
%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,
%s,%s,%s,%s,%s)"""

cur.executemany(q,l)

s="""SELECT * 
FROM cpu_log"""

cur.execute(s)
for i in cur:
    print(i)

conn.commit()
cur.close()