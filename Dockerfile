FROM python:3.9-slim as base

WORKDIR /workdir

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  curl=7.* \
  build-essential=12.* \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && find / -type d -name __pycache__ -prune -exec rm -rf {} \;

## ========================================
## local
## ========================================
FROM base as local

COPY ./src .

RUN pip install --no-cache-dir --requirement requirements.txt

CMD ["uvicorn", "asgi_app:app"]
## ========================================
## test
## ========================================
FROM base as test

COPY . .

RUN pip install --no-cache-dir --requirement src/requirements.txt \
  && pip install --no-cache-dir --requirement tests/requirements.txt
