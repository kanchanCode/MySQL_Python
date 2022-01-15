''''
@Author: Kanchan
@Date: 2022-01-13
@Last Modified by: Kanchan
@Last Modified time: 2022-01-13
@Title : Python script to connect SQL Database with python using logging
'''  
import logging

logger=logging

logger.basicConfig(filename='log_file.log',filemode='w',
level=logging.INFO,
format='%(asctime)s:%(funcName)s:%(levelname)s:%(message)s')

logger.basicConfig(filename='log_file.log',
level=logging.ERROR,
format='%(asctime)s:%(funcName)s:%(levelname)s:%(message)s:%(lineno)d')