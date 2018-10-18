FROM ubuntu:18.04

MAINTAINER developers@synopsis.cz

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils > /dev/null;
RUN apt-get install -y npm > /dev/null;
RUN apt-get install -y php > /dev/null;
RUN apt-get install -y composer > /dev/null;
RUN apt-get install -y curl > /dev/null;
RUN npm install
RUN curl -L https://github.com/docker/compose/releases/download/1.17.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose > /dev/null;
RUN chmod +x /usr/local/bin/docker-compose;
RUN apt-get install -y docker.io;
RUN groupadd docker || true;
RUN usermod -aG docker $USER;
