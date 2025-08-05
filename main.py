from fastapi import FastAPI, HTTPException
from pydantic import BaseModel

app = FastAPI()


USERS = [
    {
        "email":"safi@gmail.com",
        "password":"123456"
    }
]

# Define a request model
class LoginRequest(BaseModel):
    email: str
    password: str


@app.get("/")
def index():
    return "You are at right place"


@app.post("/login")
def login_user(login: LoginRequest):
    for user in USERS:
        if user["email"] == login.email and user["password"] == login.password:
            return {"status" : True, "message": "Login successful"}
    
    raise HTTPException(status_code=401, detail={"status" : False, "message": "Invalid email or password"})