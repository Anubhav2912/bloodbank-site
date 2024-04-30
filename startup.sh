#!/bin/bash
python manage.py collectstatic && gunicorn --workers 2 myproject.wsgi
Bash
Create a .gitignore file in the django-apprunner/myproject directory:

*.log
*.pot
*.pyc
__pycache__
db.sqlite3
media
staticfiles