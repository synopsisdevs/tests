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

RUN apk add  --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.7/main/ nodejs=8.14.0-r0

RUN apk add npm;

RUN apk update && apk add curl && \
  curl -sS https://getcomposer.org/installer | php \
  && chmod +x composer.phar && mv composer.phar /usr/local/bin/composer

RUN apk add py2-pip && apk add python python-dev py-pip build-base libffi-dev openssl-dev libgcc && pip install docker-compose~=1.23.0;

RUN npm install -g gulp@3.9.1 --silent;

RUN export DISABLE_NOTIFIER=true;

RUN export COMPOSE_INTERACTIVE_NO_CLI=true;

VOLUME /var/run/docker.sock:/var/run/docker.sock

CMD ['-c', 'sh']
