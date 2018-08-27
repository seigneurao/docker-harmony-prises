FROM alpine:latest
USER root
RUN apk add --no-cache --update git nginx uwsgi python3 python3-dev uwsgi-python3 py3-bottle bash gcc linux-headers musl-dev && \
    pip3 install --upgrade pip setuptools && \
    pip3 install RPi.GPIO && \
    mkdir -p /run/nginx && \
    mkdir -p /etc/uwsgi/apps-enabled && \
    mkdir -p /var/run/uwsgi/app/harmonyprises && \
    git clone https://github.com/seigneurao/HarmonyPrises /src/www/HarmonyPrises
RUN chmod 777 -R /var/run/uwsgi/app/harmonyprises
COPY ./nginx/sites-available/harmonyprises /etc/nginx/conf.d/default.conf
COPY ./uwsgi/apps-available/harmonyprises.ini /etc/uwsgi/apps-available/harmonyprises.ini
COPY ./startup.sh /root/startup.sh
RUN ln -s /etc/uwsgi/apps-available/harmonyprises.ini /etc/uwsgi/apps-enabled/harmonyprises.ini
