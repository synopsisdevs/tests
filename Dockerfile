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

RUN apk update && apk add curl && \
  curl -sS https://getcomposer.org/installer | php \
  && chmod +x composer.phar && mv composer.phar /usr/local/bin/composer

RUN apk add py2-pip && pip install docker-compose;

#RUN apk update && apk add apt-transport-https;
#
#RUN sh -c 'curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -';
#
#RUN sh -c 'curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list';
#
#RUN apk update;
#
#RUN export PATH=/usr/lib/dart/bin:$PATH;

CMD apt-get update;

CMD apt-get install apt-transport-https;

CMD sh -c 'curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -';

CMD sh -c 'curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list';

CMD  apt-get update;

CMD export PATH=/usr/lib/dart/bin:$PATH;

CMD apt-get install dart=1.24.3;

VOLUME /var/run/docker.sock:/var/run/docker.sock

CMD ['-c', 'sh']