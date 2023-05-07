from fastapi import FastAPI
from routers.v1 import articles, users

app = FastAPI()
app.include_router(articles.router)
app.include_router(users.router)


@app.get("/hello")
def root():
    return {"message": "Hello World"}


@app.get("/hello2")
def hello2():
    return {"message": "Hello World2 !!!"}
