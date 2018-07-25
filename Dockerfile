FROM debian:stretch
MAINTAINER Kevin Hsu <hsukvn@gmail.com>

ENV CROSSTOOL crosstool-ng-1.23.0

RUN apt-get update
RUN apt-get -y install wget curl
RUN apt-get -y install git
RUN apt-get -y install build-essential
RUN apt-get -y install automake
RUN apt-get -y install libtool
RUN apt-get -y install gawk
RUN apt-get -y install bison
RUN apt-get -y install flex
RUN apt-get -y install texinfo
RUN apt-get -y install gperf
RUN apt-get -y install libncurses5-dev
RUN apt-get -y install libexpat1-dev
RUN apt-get -y install subversion
RUN apt-get -y install help2man

RUN curl -s http://crosstool-ng.org/download/crosstool-ng/${CROSSTOOL}.tar.bz2 | tar -xj

WORKDIR ${CROSSTOOL}
RUN ./configure
RUN make
RUN make install

WORKDIR /
