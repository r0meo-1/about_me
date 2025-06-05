FROM python:3.11-slim

WORKDIR /app

# Установка системных зависимостей для сборки psycopg2 и других пакетов
RUN apt-get update && \
    apt-get install -y gcc libpq-dev && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt && \
    pip install gunicorn

COPY . /app

CMD ["gunicorn", "currency_converter.currency_converter.wsgi", "--bind", "0.0.0.0:8000"]
