''''
@Author: Kanchan
@Date: 2022-01-13
@Last Modified by: Kanchan
@Last Modified time: 2022-01-13
@Title : Python script to connect SQL Database with python and perform CRUD operations.
'''  
import mysql.connector
from mysql.connector import Error
from mysql.connector import connection
from log_details import logger
import os

class Queries:
    """Description : This class will hold the methods to perform CRUD operations on database."""

def create_server_connection(host_name, user_name, user_password,user_db=None):
    """Description : This method will create a connection 
    Parameters: host_name, user_name, user_password,user_db=None (if db is provided then take db else None)
    Return: if the connection is successful, the function returns a connection object.
    """
    connection = None
    #closes any existing connections so that the server doesn't become confused with multiple open connections.

    try:
        connection = mysql.connector.connect(
            host=host_name,
            user=user_name,
            passwd=user_password,
            db=user_db
        )
        print("MySQL Database connection successful")
    except Error as err:
        logger.error(err)
        #print(f"Error: '{err}'")
    return connection
    #if the connection is successful, the function returns a connection object.

def create_db(connection,query):
    """Description : This method will create a database
    Parameters: connection and query (to create database)
    Return: it will return nothing
    """
    cursor=connection.cursor()
    try:
        cursor.execute(query)
        print("Database created successfully")
    except Error as err:
        logger.error(err)

def execute_query(connection,query):
    """Description : This method will implement the passed query
    Parameters: connection and query (to commit)
    Return: it will return nothing
    """
    cursor=connection.cursor()
    try:
        cursor.execute(query)
        connection.commit()
        print("Query successfully implemented")
    except Error as err:
        logger.error(err)

def read_query(connection,query):
    """Description : This method will implement the passed query(to retrieve)
    Parameters: connection and query 
    Return: it will return nothing
    """
    cursor=connection.cursor()
    result=None
    try:
        cursor.execute(query)
        result = cursor.fetchall()
        return result
        #we will need one more function, this time using cursor.fetchall() instead of cursor.commit(). 
        # With this function, we are reading data from the database and will not be making any change
    except Error as err:
        logger.error(err)


if __name__=="__main__":
    #driver code
    
    # using env variable for user name and password
    db_user=os.environ.get('user_name')
    db_pass=os.environ.get('user_pass')
    
    #create database
    create_db_query="""CREATE 
    DATABASE sql_python1"""

    ##creating table
    create_table="""CREATE TABLE form(
        id INT PRIMARY KEY,
        name VARCHAR(50) NOT NULL,
        class INT(5));
        """

    # insert into table
    insert_into="""
    INSERT INTO form VALUES
    (1,'Hrisha',5),
    (2,'Hritik',6),
    (3,'Hrishi',7);
    """

    #show details of table
    select_query="""
    SELECT * 
    FROM form;
    """

    max_class="""
    SELECT MAX(class) 
    FROM form"""

    delete_query="""
    DELETE FROM form
    WHERE name="Hritik";
    """

    update_query="""
    UPDATE form 
    SET class = 6 
    WHERE name ="Hrisha";
    """

    alter_query="""
    ALTER TABLE form 
    ADD Marks int(10) 
    AFTER class;
    """

    drop_query="""
    DROP TABLE form;
    """

    drop_db_query="""
    DROP DATABASE sql_python1;
    """

    # create connection 
    connection=create_server_connection("localhost",db_user,db_pass)

    # create database
    create_db(connection,create_db_query)

    #accessing database to perform queries
    connection=create_server_connection("localhost",db_user,db_pass,"sql_python1")

    #creating table query
    execute_query(connection,create_table)

    #insert into table query
    execute_query(connection,insert_into)

    #to display table 
    results=read_query(connection,select_query)
    for result in results:
        print(result)

    #to find maximum class from table 
    results=read_query(connection,max_class)
    for result in results:
       print(result)

    #to delete an entry from table
    execute_query(connection,delete_query)

    #to update table
    execute_query(connection,update_query)
    
    #to alter table
    execute_query(connection,alter_query)

    #to display the table again(after performing queries) 
    results=read_query(connection,select_query)
    for result in results:
        print(result)

    #to delete table
    execute_query(connection,drop_query)

    #to drop database
    execute_query(connection,drop_db_query)

# def __init__(self):
#     self.mydb=mysql.connector.connect(host="localhost",user=db_user,password=db_pass)
#     self.mycursor=self.mydb.cursor()

# def create_db(self):
#     """Description : This method will create a database"""
#     try:
#         self.cursor.execute("CREATE DATABASE sql_python")
#         self.cursor.execute("SHOW DATABASES")
#         for i in self.cursor:
#             print(i)
#     except Exception as e:
#         logger.error(e)