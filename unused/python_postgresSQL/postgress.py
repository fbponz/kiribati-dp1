#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Dec 10 23:58:40 2020

@author: franciscodeborjaponz
"""

import psycopg2

 
try:
   connection = psycopg2.connect(user="kiridl",
                                  password="kiridlpass",
                                  host="postgres",
                                  port="5432",
                                  database="kiridl")
   cursor = connection.cursor()

 

   postgres_insert_query = '''SELECT * FROM datasetkiribati'''
   record_to_insert = ('Barcelona', 1000 )
   cursor.execute(postgres_insert_query, record_to_insert)
   print(postgres_insert_query)

 

   connection.commit()
   count = cursor.rowcount
   print (count, "Record inserted successfully into mobile table")

 

except (Exception, psycopg2.Error) as error :
    if(connection):
        print("Failed to insert record into mobile table", error)

 

finally:
    #closing database connection.
    if(connection):
        cursor.close()
        connection.close()
        print("PostgreSQL connection is closed")
