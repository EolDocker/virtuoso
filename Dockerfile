FROM debian:wheezy
MAINTAINER Dmitry Mozzherin
RUN apt-get update && apt-get -y install \
  dpkg-dev build-essential autoconf \
  automake libtool flex bison gperf \
  gawk m4 make odbcinst libxml2-dev \
  libssl-dev libreadline-dev openssl net-tools wget && \
  wget --no-check-certificate \
  https://github.com/openlink/virtuoso-opensource/archive/v7.1.0.tar.gz && \
  tar zxvf v7.1.0.tar.gz && \
  cd /virtuoso-opensource-7.1.0 && \
  ./autogen.sh && \
  ./configure CFLAGS="-O2" --prefix=/opt/virtuoso --with-readline && \
  make && \
  make install && \
  rm /v7.1.0.tar.gz && \
  rm -rf /virtuoso-opensource-7.1.0 && \
  apt-get -y remove \
  dpkg-dev build-essential autoconf \
  automake libtool flex bison gperf \
  gawk m4 make libxml2-dev \
  libssl-dev libreadline-dev net-tools wget
EXPOSE 8890 1111
CMD  /opt/virtuoso/bin/virtuoso-t -f -c \
  /opt/virtuoso/var/lib/virtuoso/db/virtuoso.ini
