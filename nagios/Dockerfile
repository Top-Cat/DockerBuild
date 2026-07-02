FROM jasonrivers/nagios
RUN rm -rf /etc/sv/postfix
RUN apt-get update
RUN apt-get -y install msmtp libdbd-pg-perl libpq-dev
RUN apt-get remove --purge --auto-remove -y postfix
