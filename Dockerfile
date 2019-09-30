FROM node:6.14.3-alpine as node

FROM docker:edge-git

MAINTAINER developers@synopsis.cz

ARG DEBIAN_FRONTEND=noninteractive

RUN apk update && apk add php7;

RUN apk add php7-json;

RUN apk add php7-phar;

RUN apk add php7-iconv;

RUN apk add php7-mbstring;

RUN apk add php7-openssl;

RUN apk add git;

RUN apk add rsync;

RUN apk add sshpass;

RUN apk del --no-cache nodejs && apk update;

RUN apk del --no-cache npm && apk update;

COPY --from=node /usr/local /usr/local

RUN apk add libstdc++

RUN apk update && apk add --update-cache --upgrade curl && \
  curl -sS https://getcomposer.org/installer | php \
  && chmod +x composer.phar && mv composer.phar /usr/local/bin/composer

RUN apk add py2-pip && apk add python python-dev py-pip build-base libffi-dev openssl-dev libgcc && pip install docker-compose~=1.23.0;

RUN npm install -g gulp@3.9.1 --silent;

RUN export DISABLE_NOTIFIER=true;

RUN export COMPOSE_INTERACTIVE_NO_CLI=true;

VOLUME /var/run/docker.sock:/var/run/docker.sock

CMD ['-c', 'sh']
