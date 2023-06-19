FROM jasonrivers/nagios
RUN rm -rf /etc/sv/postfix
RUN apt-get update
RUN apt-get -y install ssmtp libdbd-pg-perl
RUN apt-get remove --purge --auto-remove -y postfix
