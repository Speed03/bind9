#Bind
# Create with
# docker run -d -p 53:53 -p 53:53/udp -v /root/bind/conf:/etc/bind -v /root/bind/zones:/var/lib/bind --name bind -t speed/bind9
FROM debian:latest
MAINTAINER Speed <speed@infinity.ovh>

RUN apt-get update
RUN apt-get -y upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install bind9

EXPOSE 53

VOLUME ["/etc/bind","/var/lib/bind"]

CMD ["/usr/sbin/named", "-c", "/etc/bind/named.conf", "-f"]
