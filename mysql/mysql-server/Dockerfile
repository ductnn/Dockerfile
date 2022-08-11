FROM ubuntu:20.04
LABEL author="ductnn"

ADD ./setup.sh /tmp/setup.sh
RUN /bin/sh /tmp/setup.sh

EXPOSE 3306

CMD ["/usr/sbin/mysqld"]
