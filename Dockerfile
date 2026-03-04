#Crear imagen docker

FROM python:3.13-slim

#evitar acrhivos .pyc y mejora logs
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

#instala las dependencias primero: mejor cache
COPY app/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

#Copia el código
COPY app /app/app

#Para una mejor practica: Usuario no root
RUN useradd -m appuser
USER appuser

EXPOSE 8000

CMD ["uvicorn","app.main:app","--host","0.0.0.0","--port", "8000"]