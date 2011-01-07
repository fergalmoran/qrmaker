from pymongo import Connection
import logging

class Controller:
    def __init__(self):
        self._cn = Connection() 
        self.DB = self._cn.qrmaker
        logging.debug("Created database connection")

