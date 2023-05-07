from fastapi import FastAPI

app = FastAPI()


@app.get("/hello")
def root():
    return {"message": "Hello World"}


@app.get("/hello2")
def hello2():
    return {"message": "Hello World2"}
