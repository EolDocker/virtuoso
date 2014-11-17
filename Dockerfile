FROM ubuntu:14.04
MAINTAINER Dmitry Mozzherin
RUN apt-get update && apt-get -y install \
  dpkg-dev build-essential autoconf \
  automake libtool flex bison gperf \
  gawk m4 make odbcinst libxml2-dev \
  libssl-dev libreadline-dev wget
