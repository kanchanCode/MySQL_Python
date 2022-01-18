''''
@Author: Kanchan
@Date: 2022-01-17
@Last Modified by: Kanchan
@Last Modified time: 2022-01-18
@Title : Python script to connect cpu_data Database with python and create stored procedure.
'''  
import mysql.connector
from mysql.connector import connection
import os

#using environment variable
db_user=os.environ.get('user_name')
db_pass=os.environ.get('user_pass')

#creating connection with MySQL
connection=mysql.connector.connect(host="localhost",user=db_user,password=db_pass,database="cpu_data")

#for database info
db_Info=connection.get_server_info()
print("My DB server version",db_Info)

#creating cursor
cursor=connection.cursor()
cursor.execute("select database();")
record=cursor.fetchone()

#database name
print("connected to database: ",record)

# creating stored procedure
cursor.execute("""
CREATE PROCEDURE sp_student3()
BEGIN
SELECT Roll_no,technology FROM cpu_log WHERE files_changed>18;
END
""")

#calling stored procedure
cursor.callproc('sp_student2')

#printing result
for result in cursor.stored_results():
    rlist=result.fetchall()
    for row in rlist:
        cols=row
        for c in cols:
            print(c)
        print('****************************')


