from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def index():
    return "You are at right place"
