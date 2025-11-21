#!/bin/sh

# Этот скрипт будет запущен как ENTRYPOINT в Dockerfile

# Подставляем переменные окружения в шаблон index.html
envsubst '${ENVIRONMENT} ${ENVIRONMENT_FROM_SECRET}' < /usr/share/nginx/html/index.html.template > /usr/share/nginx/html/index.html

# Запускаем Nginx
exec nginx