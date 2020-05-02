FROM mysql
ENV MYSQL_ROOT_HOST='%' \
    MYSQL_ROOT_PASSWORD='v4l1d-gu1d0-m4nt*'

COPY *.sql /docker-entrypoint-initdb.d/

EXPOSE 3306 33060
