FROM photoprism/photoprism:preview

RUN apt-get update
RUN apt-get install -y cron rsyslog

ENV WORKDIR /photoprism/cron
RUN mkdir -p ${WORKDIR}
ADD cron ${WORKDIR}
RUN chmod +x ${WORKDIR}/*.sh

CMD ${WORKDIR}/start.sh
