from fastapi import FastAPI

app = FastAPI()


@app.get("/heatlh", tags=["Health status"])
def health():
    return {"status": "OK", "message": "Service is running with FastAPI"}


@app.get("/", tags=["Home"])
def home():
    return {"message": "Welcome to FastAPI"}
