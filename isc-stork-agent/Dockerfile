FROM debian
RUN apt update && apt install -y curl
RUN curl -1sLf 'https://dl.cloudsmith.io/public/isc/stork/cfg/setup/bash.deb.sh' | bash
RUN apt install -y isc-stork-agent

WORKDIR /app
COPY /kea-ctrl-agent /app/

ENV KEA_CA_HOST=127.0.0.1
ENV KEA_CA_PORT=8000

EXPOSE 8080
ENTRYPOINT ["/app/kea-ctrl-agent", "-c", "/app/ctrl.conf"]
