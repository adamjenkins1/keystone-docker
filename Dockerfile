FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -yq keystone=2:17.0.0-0ubuntu0.20.04.1 libpq-dev python3-psycopg2 \
    && rm -r /var/lib/apt/lists/* \
    && unset DEBIAN_FRONTEND

COPY ./docker/keystone.conf /etc/apache2/sites-available/keystone.conf
COPY ./docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 5000

CMD ["/entrypoint.sh", "/usr/sbin/apachectl", "-DFOREGROUND"]
