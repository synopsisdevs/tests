FROM docker:edge-git

MAINTAINER developers@synopsis.cz

ARG DEBIAN_FRONTEND=noninteractive

RUN apk update && apk add php7;

RUN apk add php7-json;

RUN apk add php7-phar;

RUN apk add php7-iconv;

RUN apk add php7-mbstring;

RUN apk add php7-openssl;

RUN apk add --update nodejs nodejs-npm;

RUN apk add git;

RUN apk add rsync;

RUN apk add sshpass;

RUN apk update && apk add curl && \
  curl -sS https://getcomposer.org/installer | php \
  && chmod +x composer.phar && mv composer.phar /usr/local/bin/composer

RUN apk add py2-pip && pip install docker-compose;

RUN npm install -g gulp --silent;

VOLUME /var/run/docker.sock:/var/run/docker.sock

CMD ['-c', 'sh']
