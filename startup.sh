#!/bin/bash
pip3 install --no-cache-dir -r /src/www/HarmonyPrises/requirements.txt
uwsgi --ini /etc/uwsgi/apps-available/harmonyprises.ini &
nginx -g 'daemon off;'
