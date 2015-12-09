FROM alpine:3.2
MAINTAINER Albert Dixon <albert@dixon.rocks>

ENV T2_VER v2.2.1
ADD https://github.com/albertrdixon/tmplnator/releases/download/${T2_VER}/t2-linux.tgz /t2.tgz
RUN tar xvzf /t2.tgz -C /usr/local/bin && rm -f /t2.tgz

ENV GOSU_VER 1.7
ADD https://github.com/tianon/gosu/releases/download/${GOSU_VER}/gosu-amd64 /usr/local/bin/gosu

ENV TRAEFIK_VER v1.0.alpha.341
ADD https://github.com/emilevauge/traefik/releases/download/${TRAEFIK_VER}/traefik /usr/local/bin/

ADD *.tmpl /templates/
ADD docker-* /usr/local/bin/
RUN chmod +x /usr/local/bin/*

ENTRYPOINT ["docker-entry"]
CMD ["docker-start"]
ENV PORT      8080
ENV WEB_PORT  8888
ENV LOG_LEVEL ERROR