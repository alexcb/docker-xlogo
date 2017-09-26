FROM ubuntu:17.10

MAINTAINER Alex Couture-Beil "docker@mofo.ca"

ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt update && apt install -y x11-apps
ADD resources/bootstrap.sh /root/bootstrap.sh
ADD resources/go.sh /bin/go.sh

CMD /root/bootstrap.sh
