FROM python:3.6-alpine3.6

MAINTAINER Kacper Czarczyński <kacper.czarczynski@gmail.com>

ENV PGADMIN_VERSION 2.1
ENV UID             1000
ENV GID             50

# Metadata
LABEL   org.label-schema.name="pgAdmin4" \
        org.label-schema.description="Docker image pgAdmin4" \
        org.label-schema.url="https://www.pgadmin.org" \
        org.label-schema.license="PostgreSQL" \
        org.label-schema.version=${PGADMIN_VERSION} \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url="https://github.com/Chorss/docker-pgAdmin4"

RUN apk add --no-cache alpine-sdk postgresql postgresql-dev openssl shadow sudo su-exec bash \
 && echo " https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v${PGADMIN_VERSION}/pip/pgadmin4-${PGADMIN_VERSION}-py2.py3-none-any.whl" > link.txt \
 && pip install --upgrade pip \
 && pip install --no-cache-dir -r link.txt \
 && addgroup -g ${GID} -S pgadmin \
 && adduser -D -S -h /pgadmin -s /sbin/nologin -u ${UID} -G pgadmin pgadmin \
 && mkdir -p /data/config /data/logs /data/storage /data/sessions /data/misc \
 && chown -R ${UID}:${GID} /data \
 && apk del alpine-sdk \
 && rm link.txt \
 && rm -rf /root/.cache

ENV SERVER_MODE   false
ENV SERVER_PORT   5050
ENV MAIL_SERVER   mail.example.tld
ENV MAIL_PORT     465
ENV MAIL_USE_SSL  false
ENV MAIL_USE_TLS  false
ENV MAIL_USERNAME username
ENV MAIL_PASSWORD password
ENV MAIL_DEBUG    false

COPY LICENSE config_local.py /usr/local/lib/python3.6/site-packages/pgadmin4/
COPY entrypoint disable_logfile_when_stdout.patch /
RUN chmod 0775 /entrypoint
RUN patch -p0 < /disable_logfile_when_stdout.patch

VOLUME /data
EXPOSE ${SERVER_PORT}
ENTRYPOINT ["/entrypoint"]

CMD ["su-exec", "pgadmin", "python", "/usr/local/lib/python3.6/site-packages/pgadmin4/pgAdmin4.py"]