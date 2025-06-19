import pyodbc

server = 'ecom-sql-serve.database.windows.net'
database = 'ecomdb'  # Replace if your DB name is different
username = 'CloudSA4beea99f'
password = 'Sethu@1111'
driver = '{ODBC Driver 17 for SQL Server}'

try:
    conn = pyodbc.connect(
        f'DRIVER={driver};SERVER={server};DATABASE={database};UID={username};PWD={password}'
    )
    cursor = conn.cursor()
    cursor.execute("SELECT @@VERSION;")
    row = cursor.fetchone()
    print("✅ Connected to Azure SQL Database!")
    print(f"SQL Version: {row[0]}")
except Exception as e:
    print("❌ Connection failed:")
    print(e)
