FROM python:3.9-slim

WORKDIR /workdir

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  curl=7.* \
  build-essential=12.* \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY ./hello_world .

RUN pip install --no-cache-dir --requirement requirements.txt

CMD uvicorn asgi_app:app
