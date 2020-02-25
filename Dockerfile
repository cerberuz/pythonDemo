# Usar el runtime oficial de Python 2.7 slim  como imagen padre
FROM python:3.7-slim

# Definir el working directory en /app
WORKDIR /app

# Copiar el Contenido del directorio actual a /app
ADD . /app

# instalar todos los paquetes especificados en el requirements.txt
# el Comando para instalar es "pip install --trusted-host pypi.python.org -r requirements.txt"
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# hacer que el puerto 80 este disponible fuera del container
EXPOSE 80

# Definir variable de entorno con el nombre del equipo
ENV NAME miEquipo

# ejecutar el archivo app.py cuando el container inicie
CMD ["python", "app.py"]
