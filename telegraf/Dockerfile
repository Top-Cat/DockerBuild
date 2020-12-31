FROM telegraf:1.12.4
RUN sed -i "s/stretch main/stretch main contrib non-free/" /etc/apt/sources.list
RUN apt-get update && apt-get -y install snmp-mibs-downloader ntp apcupsd python-pip
RUN pip install speedtest-cli
COPY UBNT-MIB /root/.snmp/mibs/
COPY UBNT-UniFi-MIB /root/.snmp/mibs/
COPY FROGFOOT-RESOURCES-MIB /root/.snmp/mibs/
COPY POWERNET-432-MIB /root/.snmp/mibs/
