''''
@Author: Kanchan
@Date: 2022-01-14
@Last Modified by: Kanchan
@Last Modified time: 2022-01-14
@Title : Import/Export CPU log using logging
'''  
import mysql.connector
from mysql.connector import Error
from mysql.connector import connection
from log_file import logger
import os

class DataImportExport:
    """Description : This class will hold the methods to export and import on database."""

    def __init__(self):
        db_user=os.environ.get('user_name')
        db_pass=os.environ.get('user_pass')

        self.connection = mysql.connector.connect(
            host="localhost",
            user=db_user,
            password=db_pass,   
            )

        self.db_cursor = self.connection.cursor()

    def export_db(self):
        """Description : This method will import the data """
        try:
            os.system('mysqldump -u root -p crud_operations > export_file.sql')
            #print(os.system('head -n 5 export_file.sql'))
            logger.info("Databases Exported to file")

        except Exception as e:
            logger.error("Exception : ",e)


    def import_db(self):
        """Description : This method will export the data """
        try:
            self.db_cursor.execute("CREATE DATABASE new_db;")
            os.system('mysql -u user -p new_db < export_file.sql')
            self.db_cursor.execute("SHOW DATABASES;")
            
            for i in self.db_cursor:
                print(i)
            logger.info("Databases Imported to file")

        except Exception as e:
            logger.error(e)

if __name__=="__main__":
    obj=DataImportExport()
    obj.import_db()
    obj.export_db()
