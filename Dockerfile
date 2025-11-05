# Dockerfile

FROM python:3.12-slim

ENV PYTHONUNBUFFERED 1
WORKDIR /app


RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       libmariadb-dev \
       gcc \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt


COPY . /app/

CMD ["gunicorn", "PFDESARROLLO.wsgi", "--bind", "0.0.0.0:8080"]