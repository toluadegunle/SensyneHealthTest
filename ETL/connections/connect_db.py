import sys
import pymysql as psql
import pysftp
import psycopg2
import mysql.connector
from sqlalchemy import types, create_engine

sys.path.append('..')
from ETL.conf import config as con


def get_mysql_connection():
    conn = create_engine("mysql+pymysql://{user}:{pw}@{host}/{db}"
                           .format(user=con.mysql_config['user'],
                                   host=con.mysql_config['host'],
                                   pw=con.mysql_config['pw'],
                                   db=con.mysql_config['dbs']))

    return conn