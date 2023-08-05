FROM debian
RUN apt update && apt install -y curl
RUN curl -1sLf 'https://dl.cloudsmith.io/public/isc/stork/cfg/setup/bash.deb.sh' | bash
RUN apt install -y isc-stork-server
RUN mkdir -p /var/lib/stork-server/hooks
EXPOSE 8080
ENTRYPOINT ["/usr/bin/stork-server"]
