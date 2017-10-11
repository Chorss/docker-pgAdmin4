FROM python:3.6-alpine

MAINTAINER Kacper Czarczyński <kacper.czarczynski@gmail.com>

# Metadata
LABEL org.label-schema.url="https://www.pgadmin.org" \
      org.label-schema.license="PostgreSQL" \
      org.label-schema.name="pgAdmin4" \
      org.label-schema.version="${PGADMIN_VERSION}" \
      org.label-schema.schema-version="1.0"

ENV PGADMIN_VERSION 2.0

RUN apk add --no-cache alpine-sdk postgresql postgresql-dev openssl \
 && echo " https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v${PGADMIN_VERSION}/pip/pgadmin4-${PGADMIN_VERSION}-py2.py3-none-any.whl" > link.txt \
 && pip install --upgrade pip \
 && pip install --no-cache-dir -r link.txt \
 && addgroup -g 50 -S pgadmin \
 && adduser -D -S -h /pgadmin -s /sbin/nologin -u 1000 -G pgadmin pgadmin \
 && mkdir -p /data/config /data/logs /data/storage /data/sessions; chown -R 1000:50 /data \
 && apk del alpine-sdk \
 && rm link.txt \
 && rm -rf /root/.cache

ENV SERVER_MODE   false
ENV SERVER_PORT   5050
ENV MAIL_SERVER   mail.example.tld
ENV MAIL_PORT     465
ENV MAIL_USE_SSL  true
ENV MAIL_USE_TLS  false
ENV MAIL_USERNAME username
ENV MAIL_PASSWORD password
ENV MAIL_DEBUG    true

COPY LICENSE config_local.py /usr/local/lib/python3.6/site-packages/pgadmin4/

USER pgadmin:pgadmin
VOLUME /data/

ENTRYPOINT [ "python", "/usr/local/lib/python3.6/site-packages/pgadmin4/pgAdmin4.py" ]

EXPOSE $SERVER_PORT