FROM debian
RUN apt update && apt install -y curl
RUN curl -1sLf 'https://dl.cloudsmith.io/public/isc/stork/cfg/setup/bash.deb.sh' | bash
RUN apt install -y isc-stork-agent

WORKDIR /app
COPY /kea-ctrl-agent /app/

EXPOSE 8080
ENTRYPOINT ["/app/kea-ctrl-agent", "-c", "/app/ctrl.conf"]
