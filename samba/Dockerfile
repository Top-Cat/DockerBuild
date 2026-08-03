FROM debian

RUN apt-get update && \
    apt-get install --no-install-recommends --no-install-suggests -y samba smbldap-tools ldap-utils xz-utils execline && \	
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends --no-install-suggests -y libnss-ldapd && \
    rm -rf /var/cache/apt && \
    rm -rf /etc/samba/smb.conf /var/lib/samba/private/secrets.tdb /etc/smbldap-tools /etc/nslcd.conf /etc/nsswitch.conf

# Setup S6
# We need to run multiple processes, so let's add S6 to the image
ENV S6_VERSION="3.2.3.2"
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_VERSION}/s6-overlay-noarch.tar.xz /tmp
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_VERSION}/s6-overlay-x86_64.tar.xz /tmp
RUN tar Jxpf /tmp/s6-overlay-x86_64.tar.xz -C / && tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz && \
    rm -rf /tmp/*

RUN mkdir -p /log/nslcd && chown -R nobody:nogroup /log
RUN useradd samba && mkdir /run/samba && chown -R samba:samba /var/log/samba /run/samba /var/cache/samba /var/lib/samba

COPY rootfs /

VOLUME ["/etc/samba/smb.conf", "/var/lib/samba/private/secrets.tdb", "/etc/smbldap-tools", "/etc/nslcd.conf"]
EXPOSE 139 445
ENTRYPOINT ["/init"]
