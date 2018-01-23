FROM centos:7

USER root

RUN yum -y install epel-release telnet; yum -y install python-pip; pip install shadowsocks; yum -y install privoxy

ADD ./start.sh /start.sh

RUN echo 'forward-socks5 / 127.0.0.1:1080 .' >> /etc/privoxy/config

RUN sed -i 's/listen-address  127.0.0.1:8118/listen-address  0.0.0.0:8118/g' /etc/privoxy/config

RUN yum clean all; rm -rf /var/cache/yum

EXPOSE 8118

CMD ["/start.sh"]
