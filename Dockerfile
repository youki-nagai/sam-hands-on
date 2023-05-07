FROM python:3.9-slim as base

WORKDIR /workdir

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  curl=7.* \
  build-essential=12.* \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

## ========================================
## local
## ========================================
FROM base as local

COPY ./hello_world .

RUN pip install --no-cache-dir --requirement requirements.txt

CMD uvicorn asgi_app:app
## ========================================
## unit test
## ========================================
FROM base as unit_test

COPY ./tests .

RUN pip install --no-cache-dir --requirement requirements.txt

CMD python -m pytest unit -v
## ========================================
## integration test
## ========================================
FROM base as integration_test

COPY ./tests .

RUN pip install --no-cache-dir --requirement requirements.txt

CMD AWS_SAM_STACK_NAME=sam-hands-on python -m pytest integration -v
