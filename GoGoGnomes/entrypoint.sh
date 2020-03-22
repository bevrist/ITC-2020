#!/bin/bash
# wait for Database to be ready before launching app
echo "waiting for db to be ready"
until nc -z -w60 db 3306; do sleep 1; done
sleep 2

echo "launching..."
python manage.py runserver 0.0.0.0:8000