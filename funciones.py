import pandas as pd
import mysql.connector
from sqlalchemy import create_engine

# Datos de conexión a la base de datos.
host="localhost"           # O '127.0.0.1'
user="root"                # El usuario por defecto en XAMPP es 'root'
password=""                # La contraseña por defecto está vacía en XAMPP
database="proyecto_grupo1"  # Reemplaza con el nombre de tu base de datos
connection_string = f"mysql+mysqlconnector://{user}:{password}@{host}/{database}"


def verificar_conexion():
    conn = mysql.connector.connect(
            host=host,
            user=user,
            password=password,
            database=database
        )
    # Verificar si la conexión fue exitosa
    if conn.is_connected():
            print("*********************************")
            print("Conexión exitosa a la BD en MySQL")
            print("*********************************")
            print("")
            print(f"Tablas de la BD {database}")
            print("")

    
    # Crear un cursor para ejecutar consultas
            cursor = conn.cursor()

    # Realizar una consulta
            cursor.execute("SHOW TABLES")
            tables = cursor.fetchall()

    # Mostrar las tablas
            for table in tables:
                print(table)
            print("")
        
    
    # Cerrar la conexión
            conn.close()
    else:
        print("No se pudo conectar a la base de datos")


def crear_df_consulta_sql(consulta_sql):
    connection_string = f"mysql+mysqlconnector://{user}:{password}@{host}/{database}"
    engine = create_engine(connection_string)
    df = pd.read_sql_query(consulta_sql, engine)
    return df

