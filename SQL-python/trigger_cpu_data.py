''''
@Author: Kanchan
@Date: 2022-01-16
@Last Modified by: Kanchan
@Last Modified time: 2022-01-16
@Title : Python script to connect cpu_data Database with python and create trigger.
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
    
    cr_table="""
    CREATE TABLE triggers_test(
	message VARCHAR(100)
    );
    """
    #create database
    trigger_sel="""
    DELIMITER $$
    CREATE
    TRIGGER my_trigger1 BEFORE INSERT
    ON cpu_log
    FOR EACH ROW BEGIN
        INSERT INTO triggers_test VALUES("Data inserted");
    END$$
    DELIMITER ;
    """

    insert_val="""
    INSERT INTO cpu_log(Roll_no,technology,files_changed)
    VALUES(1868,'android',13);    
    """
    select_query="""
    SELECT * FROM triggers_test;
    """
    
    #accessing database to perform queries and creating connection
    connection=create_server_connection("localhost",db_user,db_pass,"cpu_data")


    execute_query(connection,cr_table)
    print("TABLE CREATED ")

    execute_query(connection,trigger_sel)
    print("TRIGGER CREATED ")

    execute_query(connection,insert_val)
    print("VALUE INSERTED ")

    results=read_query(connection,select_query)
    for result in results:
        print(result)