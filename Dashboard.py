import streamlit as st
import pandas as pd
import plotly.graph_objs as go
import plotly.express as px
import numpy as np

# Funciones de conexión (asegúrate de tenerlas definidas en 'funciones.py')
from funciones import verificar_conexion, crear_df_consulta_sql

# Verificar conexión a la base de datos
verificar_conexion()

# Configuración de la página
st.set_page_config(page_title="Dashboard Integral de Brecha Digital", layout="wide", page_icon="💻")

# Función para cargar los datos de las consultas SQL
def cargar_datos():
    consultas = {
        'departamentos': "SELECT * FROM departamentos",
        'programas_digitales': "SELECT * FROM programas_digitales",
        'instituciones_educativas': """
            SELECT d.nombre_departamento, 
                   COUNT(ie.id_institucion) as total_instituciones,
                   SUM(ie.numero_estudiantes) as total_estudiantes,
                   SUM(ie.numero_docentes) as total_docentes
            FROM departamentos d
            JOIN instituciones_educativas ie ON d.id_departamento = ie.id_departamento
            GROUP BY d.nombre_departamento
        """,
        'infraestructura_digital': """
            SELECT d.nombre_departamento, 
                   SUM(id.numero_antenas) as total_antenas,
                   SUM(id.puntos_wifi) as total_puntos_wifi,
                   AVG(id.cobertura_territorial) as cobertura_promedio
            FROM departamentos d
            JOIN infraestructura_digital id ON d.id_departamento = id.id_departamento
            GROUP BY d.nombre_departamento
        """,
        'brecha_digital_detalle': """
            SELECT 
                d.nombre_departamento,
                AVG(bd.brecha_material) as brecha_material_promedio,
                AVG(bd.brecha_aprovechamiento) as brecha_aprovechamiento_promedio,
                AVG(bd.brecha_motivacion) as brecha_motivacion_promedio,
                AVG(bd.brecha_formacion) as brecha_formacion_promedio,
                AVG(bd.brecha_global) as brecha_global_promedio,
                -- Asegúrate de que la columna 'nivel_brecha' existe en tu base de datos
                bd.nivel_brecha
            FROM departamentos d
            JOIN brecha_digital bd ON d.id_departamento = bd.id_departamento
            GROUP BY d.nombre_departamento, bd.nivel_brecha
        """,
        'motivacion_detallada': """
            SELECT 
                d.nombre_departamento,
                AVG(m.no_usan_internet_costo) as barrera_costo,
                AVG(m.no_usan_internet_interes) as barrera_interes,
                AVG(m.no_usan_internet_no_saber_usarlo) as barrera_conocimiento,
                pd.nombre_programa
            FROM departamentos d
            JOIN motivacion m ON d.id_departamento = m.id_departamento
            JOIN programas_digitales pd ON m.id_programa = pd.id_programa
            GROUP BY d.nombre_departamento, pd.nombre_programa
        """,
        'aprovechamiento_detalle': """
            SELECT 
                d.nombre_departamento,
                pd.nombre_programa,
                AVG(a.frecuencia_uso_internet) as uso_internet,
                AVG(a.frecuencia_uso_celular) as uso_celular,
                AVG(a.frecuencia_uso_computador) as uso_computador
            FROM departamentos d
            JOIN aprovechamiento a ON d.id_departamento = a.id_departamento
            JOIN programas_digitales pd ON a.id_programa = pd.id_programa
            GROUP BY d.nombre_departamento, pd.nombre_programa
        """,
        'material_acceso': """
            SELECT 
                d.nombre_departamento,
                pd.nombre_programa,
                AVG(m.acceso_internet_publico) as acceso_publico,
                AVG(m.acceso_internet_privado) as acceso_privado,
                AVG(m.acceso_internet_hogar) as acceso_hogar
            FROM departamentos d
            JOIN material m ON d.id_departamento = m.id_departamento
            JOIN programas_digitales pd ON m.id_programa = pd.id_programa
            GROUP BY d.nombre_departamento, pd.nombre_programa
        """,
        'promedios_uso_internet': """
        SELECT 
            d.nombre_departamento,
            p.nombre_programa,
            AVG(a.frecuencia_uso_internet) AS promedio_uso_internet,
            AVG(a.frecuencia_uso_celular) AS promedio_uso_celular,
            AVG(a.frecuencia_uso_computador) AS promedio_uso_computador,
            CASE 
                WHEN AVG(a.frecuencia_uso_internet) > 4 THEN 'Alta'
                WHEN AVG(a.frecuencia_uso_internet) BETWEEN 2 AND 4 THEN 'Media'
                ELSE 'Baja'
            END AS categoria_uso_internet
        FROM 
            aprovechamiento a
        JOIN 
            departamentos d ON a.id_departamento = d.id_departamento
        JOIN 
            programas_digitales p ON a.id_programa = p.id_programa
        GROUP BY 
            a.id_departamento, d.nombre_departamento, a.id_programa, p.nombre_programa""",
        'clasificacion_brecha': """
        SELECT 
            d.nombre_departamento,
            AVG(m.no_usan_internet_costo) as barrera_costo,
            AVG(m.no_usan_internet_interes) as barrera_interes,
            AVG(m.no_usan_internet_no_saber_usarlo) as barrera_conocimiento,
            AVG(bd.nivel_brecha) as nivel_brecha,
            CASE 
                WHEN AVG(bd.nivel_brecha) > 30 THEN 'Crítica'
                WHEN AVG(bd.nivel_brecha) > 20 THEN 'Alta'
                WHEN AVG(bd.nivel_brecha) > 10 THEN 'Media'
                ELSE 'Baja'
            END as clasificacion_brecha
        FROM departamentos d
        JOIN brecha_digital bd ON d.id_departamento = bd.id_departamento
        JOIN motivacion m ON d.id_departamento = m.id_departamento
        GROUP BY d.nombre_departamento""",
        'frecuencia_uso': """SELECT 
            d.nombre_departamento,
            p.nombre_programa,
            MAX(a.frecuencia_uso_internet) AS max_uso_internet,
            MIN(a.frecuencia_uso_internet) AS min_uso_internet,
            AVG(a.frecuencia_uso_internet) AS avg_uso_internet,
            MAX(a.frecuencia_uso_celular) AS max_uso_celular,
            MIN(a.frecuencia_uso_celular) AS min_uso_celular,
            AVG(a.frecuencia_uso_celular) AS avg_uso_celular,
            MAX(a.frecuencia_uso_computador) AS max_uso_computador,
            MIN(a.frecuencia_uso_computador) AS min_uso_computador,
            AVG(a.frecuencia_uso_computador) AS avg_uso_computador
        FROM 
            aprovechamiento a
        JOIN 
            departamentos d ON a.id_departamento = d.id_departamento
        JOIN 
            programas_digitales p ON a.id_programa = p.id_programa
        GROUP BY 
            a.id_departamento, d.nombre_departamento, a.id_programa, p.nombre_programa"""
    }
    
    # Crear diccionario de dataframes
    dataframes = {}
    for nombre, consulta in consultas.items():
        dataframes[nombre] = crear_df_consulta_sql(consulta)
    
    return dataframes

# Cargar datos
datos = cargar_datos()

# Función para crear gráficos de barras comparativos
def crear_grafico_barras_comparativo(df, x_col, y_cols, titulo):
    fig = go.Figure()
    for col in y_cols:
        fig.add_trace(go.Bar(
            x=df[x_col], 
            y=df[col], 
            name=col
        ))
    fig.update_layout(
        title=titulo,
        xaxis_title=x_col,
        yaxis_title='Valor',
        barmode='group'
    )
    return fig

# Función para crear un mapa de calor de brecha digital
def crear_mapa_calor_brecha(df):
    # Si la columna 'nivel_brecha' no está en el DataFrame, la eliminamos
    if 'nivel_brecha' not in df.columns:
        df = df.drop(columns=['nivel_brecha'], errors='ignore')
    
    fig = go.Figure(data=go.Heatmap(
        z=df.select_dtypes(include=[np.number]).values,
        x=df.select_dtypes(include=[np.number]).columns,
        y=df['nombre_departamento'],
        colorscale='Viridis'
    ))
    fig.update_layout(
        title='Mapa de Calor de Dimensiones de Brecha Digital',
        xaxis_title='Dimensiones de Brecha',
        yaxis_title='Departamentos'
    )
    return fig

# Función principal del dashboard
def main():
    # Título del dashboard
    st.markdown(""" 
    # 💻 Dashboard Integral de Brecha Digital en Colombia
    ## Análisis Multidimensional de Acceso y Uso Tecnológico
    """)
    
    # Menú de navegación con st.sidebar
    menu = [
        "Resumen Ejecutivo", 
        "Infraestructura Digital", 
        "Brecha Digital",
        "Análisis de Frecuencia de Uso", 
        "Motivaciones y Barreras", 
        "Instituciones Educativas",
        "Programas Digitales"
    ]
    seccion_elegida = st.sidebar.radio("Navegar", menu)
    
    # Filtros generales
    st.sidebar.header("Filtros Globales")
    departamentos_seleccionados = st.sidebar.multiselect(
        "Seleccionar Departamentos", 
        datos['departamentos']['nombre_departamento'].unique()
    )
    
    # Lógica de filtrado
    if departamentos_seleccionados:
        # Aplicar filtros a los dataframes
        for key, df in datos.items():
            if 'nombre_departamento' in df.columns:
                datos[key] = df[df['nombre_departamento'].isin(departamentos_seleccionados)]
    
    # Secciones del dashboard
    if seccion_elegida == "Resumen Ejecutivo":
        resumen_ejecutivo()
    elif seccion_elegida == "Infraestructura Digital":
        infraestructura_digital()
    elif seccion_elegida == "Brecha Digital":
        brecha_digital()
    elif seccion_elegida == "Instituciones Educativas":
        instituciones_educativas()
    elif seccion_elegida == "Programas Digitales":
        st.header("Programas Digitales")
        
        # Tabla de programas
        st.subheader("Listado de Programas")
        st.dataframe(datos['programas_digitales'])
        
        # Distribución de uso por programa
        st.subheader("Uso de Internet por Programa")
        fig_uso_programa = px.bar(
            datos['promedios_uso_internet'], 
            x='nombre_programa', 
            y='promedio_uso_internet',
            color='categoria_uso_internet',
            title='Promedio de Uso de Internet por Programa'
        )
        st.plotly_chart(fig_uso_programa, use_container_width=True)
    elif seccion_elegida == "Motivaciones y Barreras":
        st.header("Motivaciones y Barreras para el Uso de Internet")
        
        # Gráfico de barreras
        fig_barreras = go.Figure(data=[
            go.Bar(
                name='Costo', 
                x=datos['clasificacion_brecha']['nombre_departamento'], 
                y=datos['clasificacion_brecha']['barrera_costo']
            ),
            go.Bar(
                name='Interés', 
                x=datos['clasificacion_brecha']['nombre_departamento'], 
                y=datos['clasificacion_brecha']['barrera_interes']
            ),
            go.Bar(
                name='Conocimiento', 
                x=datos['clasificacion_brecha']['nombre_departamento'], 
                y=datos['clasificacion_brecha']['barrera_conocimiento']
            )
        ])
        fig_barreras.update_layout(
            title='Barreras para el Uso de Internet por Departamento',
            xaxis_title='Departamento',
            yaxis_title='Porcentaje de Barrera'
        )
        st.plotly_chart(fig_barreras, use_container_width=True)
    elif seccion_elegida == "Análisis de Frecuencia de Uso":
        st.header("Frecuencia de Uso de Tecnología")
        
        # Selector de tipo de uso
        tipo_uso = st.selectbox(
            "Seleccione el tipo de uso", 
            ["Internet", "Celular", "Computador"]
        )
        
        # Gráficos de frecuencia de uso
        if tipo_uso == "Internet":
            fig_uso = px.box(
                datos['frecuencia_uso'], 
                x='nombre_departamento', 
                y='avg_uso_internet',
                title='Frecuencia de Uso de Internet por Departamento'
            )
        elif tipo_uso == "Celular":
            fig_uso = px.box(
                datos['frecuencia_uso'], 
                x='nombre_departamento', 
                y='avg_uso_celular',
                title='Frecuencia de Uso de Celular por Departamento'
            )
        else:
            fig_uso = px.box(
                datos['frecuencia_uso'], 
                x='nombre_departamento', 
                y='avg_uso_computador',
                title='Frecuencia de Uso de Computador por Departamento'
            )
        
        st.plotly_chart(fig_uso, use_container_width=True)
        
        # Tabla de frecuencia de uso
        st.subheader("Detalle de Frecuencia de Uso")
        st.dataframe(datos['frecuencia_uso'])

# Resumen Ejecutivo
def resumen_ejecutivo():
    st.header("Resumen Ejecutivo")
    
    # Estadísticas clave
    col1, col2, col3 = st.columns(3)
    with col1:
        st.metric("Total de Programas", len(datos['programas_digitales']))
    with col2:
        st.metric("Departamentos Analizados", 
                      len(datos['clasificacion_brecha']))
    with col3:
        st.metric("Promedio Indice de Brecha", 
                      f"{datos['brecha_digital_detalle']['brecha_global_promedio'].mean():.2f}")
        
    # Mapa de calor de brecha digital por departamento
    st.subheader("Nivel de Brecha Digital por Departamento")
    fig_brecha = px.bar(
        datos['clasificacion_brecha'], 
        x='nombre_departamento', 
        y='nivel_brecha', 
        color='clasificacion_brecha',
        title='Clasificación de Brecha Digital por Departamento'
        )
    st.plotly_chart(fig_brecha, use_container_width=True)

# Infraestructura Digital
def infraestructura_digital():
    st.header("Infraestructura Digital")
    metrica_infra = st.selectbox("Seleccionar Métrica de Infraestructura", ["Total de Antenas", "Puntos WiFi", "Cobertura Promedio"])
    
    if metrica_infra == "Total de Antenas":
        fig = crear_grafico_barras_comparativo(
            datos['infraestructura_digital'], 
            'nombre_departamento', 
            ['total_antenas'], 
            'Total de Antenas por Departamento'
        )
    elif metrica_infra == "Puntos WiFi":
        fig = crear_grafico_barras_comparativo(
            datos['infraestructura_digital'], 
            'nombre_departamento', 
            ['total_puntos_wifi'], 
            'Puntos WiFi por Departamento'
        )
    else:
        fig = crear_grafico_barras_comparativo(
            datos['infraestructura_digital'], 
            'nombre_departamento', 
            ['cobertura_promedio'], 
            'Cobertura Promedio por Departamento'
        )
    
    st.plotly_chart(fig, use_container_width=True)

# Brecha Digital
def brecha_digital():
    st.header("Brecha Digital")
    fig_brecha = crear_mapa_calor_brecha(datos['brecha_digital_detalle'])
    st.plotly_chart(fig_brecha, use_container_width=True)

# Instituciones Educativas
def instituciones_educativas():
    st.header("Instituciones Educativas")
    fig = crear_grafico_barras_comparativo(
        datos['instituciones_educativas'], 
        'nombre_departamento', 
        ['total_instituciones', 'total_estudiantes', 'total_docentes'], 
        'Comparativa de Instituciones Educativas por Departamento'
    )
    st.plotly_chart(fig, use_container_width=True)


# Llamar la función principal para ejecutar la app
if __name__ == "__main__":
    main()
