FROM ubuntu:20.04

RUN apt -y update && apt -y install tang xinetd && apt clean all
RUN mkdir /var/cache/tang
RUN mkdir /var/db
RUN mkdir /var/db/tang
EXPOSE 80

COPY tangd.xinetd /etc/xinetd.d/tangd
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]


