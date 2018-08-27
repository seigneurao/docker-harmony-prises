#!/bin/bash
uwsgi --ini /etc/uwsgi/apps-available/harmonyprises.ini &
nginx -g 'daemon off;'
