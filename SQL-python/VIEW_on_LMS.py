''''
@Author: Kanchan
@Date: 2022-01-18
@Last Modified by: Kanchan
@Last Modified time: 2022-01-18
@Title : Python script to connect cpu_data Database with python and create VIEW.
'''  
import mysql.connector
from mysql.connector import Error
from mysql.connector import connection
from log_details import logger
import os

class Queries:
    """Description : This class will hold the methods to perform operations on database."""

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
    create_view_query="""
    CREATE VIEW Personal_Info 
    AS    
    SELECT first_name, middle_name,
    last_name,email,mobile_num,
    birth_date
    FROM fellowship_candidates;
    """

    select_query="""
    SELECT * 
    FROM personal_Info;
    """
    
    #accessing database to perform queries and creating connection
    connection=create_server_connection("localhost",db_user,db_pass,"lms")


    #to find maximum class from table 
    results=execute_query(connection,create_view_query)

    print("VIEW CREATED ")

    results=read_query(connection,select_query)
    for result in results:
        print(result)
