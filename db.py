import pyodbc
import os
def get_db_connection():
    #server = 'ecom-sql-serve.database.windows.net'
    #database = 'ecomdb'
    #username = 'CloudSA4beea99f'
    #password = 'Sethu@1111'
    server = open("/mnt/secrets/DB_SERVER").read().strip()
    database = open("/mnt/secrets/DB_NAME").read().strip()
    username = open("/mnt/secrets/DB_USER").read().strip()
    password = open("/mnt/secrets/DB_PASSWORD").read().strip()
    driver = '{ODBC Driver 17 for SQL Server}'
    try:
        conn = pyodbc.connect(
            f'DRIVER={driver};SERVER={server};DATABASE={database};UID={username};PWD={password}'
        )
        return conn
    except Exception as e:
        print("❌ DB connection error:", e)
        return None
