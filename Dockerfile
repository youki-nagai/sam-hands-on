FROM python:3.9-slim

WORKDIR /app

RUN pip install --no-cache-dir awscli aws-sam-cli
