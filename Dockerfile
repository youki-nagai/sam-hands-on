FROM python:3.9-slim

WORKDIR /app

# Install git and other dependencies
RUN apt-get update && \
  apt-get install -y --no-install-recommends git && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir awscli aws-sam-cli
