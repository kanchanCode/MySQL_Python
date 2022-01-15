''''
@Author: Kanchan
@Date: 2022-01-14
@Last Modified by: Kanchan
@Last Modified time: 2022-01-14
@Title : Import/Export CPU log using logging
'''  
import logging

logger=logging

logger.basicConfig(filename='log_file.log',
level=logging.INFO,
format='%(asctime)s:%(funcName)s:%(levelname)s:%(message)s')

logger.basicConfig(filename='log_file.log',
level=logging.ERROR,
format='%(asctime)s:%(funcName)s:%(levelname)s:%(lineo)s')