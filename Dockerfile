FROM debian:wheezy
MAINTAINER Dmitry Mozzherin

RUN apt-get update && apt-get -y install \
  dpkg-dev build-essential autoconf \
  automake libtool flex bison gperf \
  gawk m4 make odbcinst libxml2-dev \
  libssl-dev libreadline-dev openssl net-tools wget && \
  \
  wget --no-check-certificate \
  https://github.com/openlink/virtuoso-opensource/archive/v7.1.0.tar.gz && \
  \
  tar zxvf v7.1.0.tar.gz && \
  cd /virtuoso-opensource-7.1.0 && \
  \
  ./autogen.sh && \
  ./configure CFLAGS="-O2" --prefix=/usr/local --with-readline && \
  \
  make && \
  \
  make install && \
  \
  rm /v7.1.0.tar.gz && \
  \
  rm -rf /virtuoso-opensource-7.1.0 && \
  \
  apt-get -y purge \
  dpkg-dev build-essential autoconf \
  automake libtool flex bison gperf \
  gawk m4 make libxml2-dev \
  libssl-dev libreadline-dev net-tools wget && \
  \
  apt-get clean autoclean && \
  \
  apt-get autoremove -y &&\
  \
  rm -rf /var/lib/{apt,dpkg,cache,log}/
EXPOSE 8890 1111
CMD  /usr/local/bin/virtuoso-t -f -c \
  /usr/local/var/lib/virtuoso/db/virtuoso.ini
