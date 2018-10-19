FROM tmaier/docker-compose:latest

MAINTAINER developers@synopsis.cz

ARG DEBIAN_FRONTEND=noninteractive

#RUN apt-get update > /dev/null;
#RUN apt-get install -y npm > /dev/null;
##RUN apt-get install -y php > /dev/null;
##RUN apt-get install -y php-zip;
#RUN apt-get install -y composer > /dev/null;
#RUN apt-get install -y curl > /dev/null;
#RUN curl -L https://github.com/docker/compose/releases/download/1.17.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose > /dev/null;
#RUN chmod +x /usr/local/bin/docker-compose;
#RUN apt-get install -y docker.io;
#RUN groupadd docker || true;
#RUN usermod -aG docker root;

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

VOLUME /var/run/docker.sock:/var/run/docker.sock

CMD ['-c', 'sh']