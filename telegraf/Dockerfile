FROM telegraf
RUN sed -i "s/stretch main/stretch main contrib non-free/" /etc/apt/sources.list
RUN apt-get update && apt-get -y install snmp-mibs-downloader ntp
COPY UBNT-MIB /root/.snmp/mibs/
COPY UBNT-UniFi-MIB /root/.snmp/mibs/
COPY FROGFOOT-RESOURCES-MIB /root/.snmp/mibs/
