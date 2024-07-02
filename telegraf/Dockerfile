FROM telegraf:1.25.0
RUN sed -i "s/bullseye main/bullseye main contrib non-free/" /etc/apt/sources.list
RUN apt-get update && apt-get -y install snmp-mibs-downloader ntp apcupsd python3-pip smartmontools nvme-cli
RUN pip install speedtest-cli
COPY UBNT-MIB /usr/share/snmp/mibs/
COPY UBNT-UniFi-MIB /usr/share/snmp/mibs/
COPY FROGFOOT-RESOURCES-MIB /usr/share/snmp/mibs/
COPY POWERNET-432-MIB /usr/share/snmp/mibs/
