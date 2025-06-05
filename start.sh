#!/bin/bash
python3 /app/currency_converter/manage.py migrate --noinput
python3 /app/currency_converter/manage.py collectstatic --noinput
exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf