FROM python:3.11-slim

# Установка зависимостей
RUN apt-get update && \
    apt-get install -y build-essential gcc libpq-dev nginx supervisor && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY currency_converter/requirements/requirements.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt && \
    pip install gunicorn

COPY . /app
RUN mkdir -p /app/currency_converter/collected_static
COPY start.sh /start.sh
RUN chmod +x /start.sh
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY gateway/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["/start.sh"]
