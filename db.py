import pyodbc

def get_db_connection():
    server = 'ecom-sql-serve.database.windows.net'
    database = 'ecomdb'
    username = 'CloudSA4beea99f'
    password = 'Sethu@1111'
    driver = '{ODBC Driver 17 for SQL Server}'

    try:
        conn = pyodbc.connect(
            f'DRIVER={driver};SERVER={server};DATABASE={database};UID={username};PWD={password}'
        )
        return conn
    except Exception as e:
        print("❌ DB connection error:", e)
        return None
