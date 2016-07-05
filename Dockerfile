From alpine:3.4
MAINTAINER feelingfree-me  <feelingfree.co.nr@gmail.com>

ADD https://github.com/tianon/gosu/releases/download/1.9/gosu-amd64 /usr/local/bin/gosu

RUN apk add mongodb --update-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing --allow-untrusted && \
    chmod +x /usr/local/bin/gosu && \
    rm -rf /var/cache/apk/*

COPY docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 27017 28017
VOLUME /data/db

CMD [ "mongod" ]
