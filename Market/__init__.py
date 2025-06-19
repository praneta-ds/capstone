# __init__.py
import os
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt
from flask_login import LoginManager

app = Flask(__name__)

# Replace this with your actual Azure SQL Database connection string
app.config['SQLALCHEMY_DATABASE_URI'] = "mssql+pyodbc://CloudSA4beea99f:Sethu%401111@ecom-sql-serve.database.windows.net:1433/ecomdb?driver=ODBC+Driver+17+for+SQL+Server"

app.config['SECRET_KEY'] = os.urandom(12).hex()
db = SQLAlchemy(app)
bcrypt = Bcrypt(app)
login_manager = LoginManager(app)
login_manager.login_view = 'LoginPage'
login_manager.login_message_category = 'info'

from Market import routes
