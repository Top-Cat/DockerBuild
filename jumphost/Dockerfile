FROM debian:bookworm

RUN apt-get update

ENV DEBIAN_FRONTEND=noninteractive

RUN echo 'libnss-ldap shared/ldapns/ldap-server string ldap://ldap-service.auth' | debconf-set-selections
RUN echo 'libnss-ldap libnss-ldap/dblogin boolean false' | debconf-set-selections
RUN echo 'libnss-ldap shared/ldapns/ldap_version string 3' | debconf-set-selections
RUN echo 'libnss-ldap shared/ldapns/base-dn string dc=top-cat,dc=me' | debconf-set-selections

RUN apt-get install -y libnss-ldap openssh-server mysql-client nslcd

COPY nsswitch.conf /etc/nsswitch.conf
COPY entrypoint.sh /entrypoint.sh
RUN mkdir -p /var/run/sshd

EXPOSE 22
ENTRYPOINT ["/entrypoint.sh"]
