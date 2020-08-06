# DB
### The Database used for the test is mySQL. 
#### 
 

**Getting started**

The user will need to have installed: 
- MySQL
- An IDE e.g: DataGrip or mySQL Workbench   

**Installation**

If running code:
- Download and install mySQL

**Database Settings**

Below are the DB settings used in the Test. Please update the conf/config.py file in the ETL/Python Folder if the database settings are changed.
- user : 'root'
- host : 'localhost'
- password : 'password'
- database name : 'Sensyne_Health_db' 

Navigate to the folder where your code is stored. 

1) DDL.sql





# ETL
### This tool reads the test CSV file and loads a table in mySQL. 
#### For more background info see the Wiki pages:
#### 
*  **First timers** for users new to python
### v 1.0

**Getting started**

The user will need to have installed: 
- Python 3.6 
- An IDE  
- Anaconda 3 or pip3 install -r requirements.txt

**Installation**

If running code:
- Download the code or git clone the code from the project

**Code execution**

This code can be run using an IDE using the etl.py file.

Navigate to the folder where your code is stored. 

1) inputs
2) csv_file
3) mySQL Database

If running from an IDE like pycharm

CSV file:
- This is the csv file containing the test data

inputs:
- This is the path that contains the test data_files to be processed.

mySQL DB:
- The py script is programmed to load the csv to a mySQL Table (field_data)
- The mySQL connection settings can be changed in conf/config.py
- user : 'root'
- host : 'localhost'
- pw : 'password'
- dbs : 'Sensyne_Health_db' 

These three parameters need to be edited in the run.py file where default is written. 

To **run this code off from an IDE**  

run the execution_tool/etl.py



# SQL
### SQL queries used for the test is mySQL. 
#### 
 

**Getting started**

The user will need to have: 
- installed MySQL
- Created database ()dbs : 'Sensyne_Health_db') 
- Successfully executed the etl.py file in the ETL Folder 

 

Navigate to the folder where your code is stored. 

1) DML.sql
 
 

**Author**

Tolulope Adegunle
 


