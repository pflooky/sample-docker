FROM postgres:11-alpine

RUN mkdir -p /opt/app/data/dump
COPY --chown=postgres:postgres data/dump /opt/app/data/dump
COPY --chown=postgres:postgres data/dump.sh /opt/app

ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres
ENV PGDATA=/data/postgres
ENV POSTGRES_DB=dvdrental

RUN ["sed", "-i", "s/exec \"$@\"/echo \"skipping...\"/", "/usr/local/bin/docker-entrypoint.sh"]
RUN ["/usr/local/bin/docker-entrypoint.sh", "postgres"]

USER postgres
RUN ["/opt/app/dump.sh"]
USER root

RUN ["sed", "-i", "s/echo \"skipping...\"/exec \"$@\"/", "/usr/local/bin/docker-entrypoint.sh"]
