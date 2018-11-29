FROM bitnami/minideb-extras:stretch-r193
LABEL maintainer "Bitnami <containers@bitnami.com>"

ENV BITNAMI_PKG_CHMOD="-R g+rwX" \
    HOME="/"

# Install required system packages and dependencies
RUN install_packages libbsd0 libc6 libedit2 libgcc1 libicu57 liblzma5 libncurses5 libnss-wrapper libssl1.1 libstdc++6 libtinfo5 libxml2 libxslt1$
RUN bitnami-pkg unpack postgresql-11.1.0-0 --checksum 35dd63db8c527ea40f05e244fefedb8eb8e146b122328b8d767f9fa310a97700
RUN mkdir /docker-entrypoint-initdb.d /opt/bitnami/postgresql/conf/
RUN chmod -R g+rwX /opt/bitnami/postgresql/conf/

COPY rootfs /

COPY auto/ /docker-entrypoint-initdb.d/

ENV BITNAMI_APP_NAME="postgresql" \
    BITNAMI_IMAGE_VERSION="11.1.0-debian-9-r2" \
    PATH="/opt/bitnami/postgresql/bin:$PATH" \
    POSTGRESQL_DATABASE="bcs" \
    POSTGRESQL_MASTER_HOST="" \
    POSTGRESQL_MASTER_PORT_NUMBER="5432" \
    POSTGRESQL_PASSWORD="rotech123" \
    POSTGRESQL_PORT_NUMBER="5432" \
    POSTGRESQL_REPLICATION_MODE="master" \
    POSTGRESQL_REPLICATION_PASSWORD="" \
    POSTGRESQL_REPLICATION_USER="" \
    POSTGRESQL_USERNAME="rotechnology"

EXPOSE 5432

USER root
ENTRYPOINT [ "/app-entrypoint.sh" ]
CMD [ "/run.sh" ]

RUN sudo apt-get update
RUN sudo apt-get install -y postgresql
#RUN su - postgres

#RUN psql -p 5432 -h 127.0.0.1 -U postgres -d bcs -c /super_rotech.sql
#RUN psql -p 5432 -h 127.0.0.1 -U rotechnology -d bcs -c /tabelle.sql
