FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt && \
    pip install gunicorn

COPY . /app

CMD ["gunicorn", "currency_converter.wsgi", "--bind", "0.0.0.0:8000"]
