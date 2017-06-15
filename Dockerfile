From alpine:3.6
MAINTAINER feelingfree-me  <feelingfree.co.nr@gmail.com>


RUN apk add mongodb --update-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community --allow-untrusted && \
    rm -rf /var/cache/apk/* && \
    rm /usr/bin/mongoperf

COPY docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 27017 28017
VOLUME /data/db

CMD [ "mongod" ]
