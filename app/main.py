# Creación del microservicio.
from fastapi import FastAPI
import os
app = FastAPI(title="Microservice K8S")
@app.get("/health")
def health():
    #Para kubernetes: Si responde 200, el contenedor esta vivo.
    return {"status": "ok"}

@app.get("/info")
def info():
    #Información del servicio: es útil para validar despliegues
    return {
        "app_name": os.getenv("APP_NAME","microservicio"),
        "app_version": os.getenv("APP_VERSION","dev"),
        "environment": os.getenv("ENVIRONMENT","local"),
    }