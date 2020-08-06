
#### IMPORT LIBRARIES REQUIRED ####

import pandas as pd
import numpy as np
import glob
import sys
import mysql.connector
from sqlalchemy import types, create_engine
from datetime import datetime
import re

from ETL.common import utils as util
from ETL.connections import connect_db as db

sys.path.append("..")

''' 
# create sqlalchemy engine
engine = create_engine("mysql+pymysql://{user}:{pw}@localhost/{db}"
                       .format(user="root",
                               pw="password",
                               db="Sensyne_Health_db"))

##read_files = glob.glob("../inputs/Senior*.csv")
'''

class EtlProcess(object):
    """
        ETL class to load raw cesv file to mySQL RDBMS Table
    """

    def __init__(self):
        '''
            Method for initializing EtlProcess object
        '''
        self.env = 'test'
        self.files = glob.glob(util.get_source())
        self.engine = db.get_mysql_connection()

    def iter_find(self, haystack, needle, n):
        """
            Method to find index of nth occurrence of a character in string

            Args: haystack (text): string, needle (text): substring, n (Int) nth occurrence

            Returns: index

        """
        index_number = 0
        sstr = [i for i in range(0, len(haystack)) if haystack[i:].startswith(needle)]
        if len(sstr) == 0 or len(sstr) < n:
            index_number = 0
        else :
            index_number = sstr[n-1]
        return index_number

    def convert_time(self, time_12hr):
        """
            Method to convert time from 12HR clock to 24HR clock

            Args: time_12hr (text): time in 12HR clock

            Returns: time_24hr (text): time in 24HR clock

        """
        ## remove spaces
        time_12hr = time_12hr.replace(' ', '')

        ## Index of : 1st occurence in string
        colon_1st = self.iter_find(time_12hr, ':', 1)  ## time_12hr.find(':')

        ## Index of : 2nd occurence in string
        colon_2nd = self.iter_find(time_12hr, ':', 2)

        
        ## Remove double Time entries
        if colon_2nd >= 4:
            time_12hr = time_12hr[:colon_2nd + 5]


        ## Count of colon (:) in string
        colon_count = len(re.findall(":", time_12hr))

        ## Remove invalid Time entry
        if colon_count < 2:
            return None
        elif time_12hr[-2:] == "AM" and time_12hr[:colon_1st] == "12":
            return "00" + time_12hr[colon_1st:-2]
        elif time_12hr[-2:] == "AM":
            return time_12hr[:-2]
        elif time_12hr[-2:] == "PM" and time_12hr[:colon_1st] == "12":
            return time_12hr[:-2]
        else:
            return str(int(time_12hr[:colon_1st]) + 12) + time_12hr[colon_1st:-2]




    def readSourceFile(self):
        '''
            Method for reading csv to Dataframe

            Returns: None
        '''
        try:
            ## READ CSV ##
            files = self.files
            df_raw_data = pd.concat((pd.read_csv(f, sep = ",", encoding='latin1', low_memory=False) for f in files))

            ## RENAME COLUMNS ##
            df_raw_data.rename(columns={'1': 'cap_shape', '3': 'cap_color', '5': 'odor', '8': 'gill_size',
                                 '9': 'gill_color', '14': 'stalk_color_above_ring', '17': 'veil_color',
                                 '19': 'ring_type', '20': 'spore_print_color', '21': 'population', '22': 'habitat'
                                 }, inplace=True)

            ## CONVERT Column Time from 12 hr clock to 24 hr clock ##
            df_raw_data['Time'] = df_raw_data['Time'].apply(lambda x: self.convert_time(x))

            print(df_raw_data.head(5))

            # Insert whole DataFrame into MySQL
            df_raw_data.to_sql('field_data', con=self.engine, if_exists='replace', chunksize=1000, index=False)
            print('CSV loaded into Table')


        except Exception as e:
            print('Error message: {0}'.format(e))





if __name__ == "__main__":
    p = EtlProcess()

    p1 = p.readSourceFile()