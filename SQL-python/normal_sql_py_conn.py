''''
@Author: Kanchan
@Date: 2022-01-12
@Last Modified by: Kanchan
@Last Modified time: 2022-01-12
@Title : Python script to connect SQL Database with python and perform CRUD operations.
'''  

#Trying to create connection b/w SQL and Python simply and perform few queries

import mysql.connector
import os

# using env variable for user name and password
db_user=os.environ.get('user_name')
db_pass=os.environ.get('user_pass')

#creating connection for MySQL
mydb=mysql.connector.connect(host="localhost",user=db_user,password=db_pass,db="crud_operations")

#Creating a cursor object using the cursor() method
mycursor=mydb.cursor()

#executing show databases command
mycursor.execute("show databases")
for i in mycursor:
    print(i)

#inserting value to the existing table
mycursor.execute("insert into details values(06,'New Entry',34,8765432198,'None')")

#executing select command
mycursor.execute("select * from details")
for i in mycursor:
    print(i)