import platform
import sys
import pandas as pd
import datetime

from ETL.common import directories as dirs3

def get_source():
    dir = 'test'
    source = dirs3.test['source']['tolu']
    return source