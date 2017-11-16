FROM debian

USER root
RUN apt-get update
RUN apt-get install -y \
        make unrar-free autoconf \
        automake libtool gcc g++ \
        gperf flex bison texinfo \
        gawk ncurses-dev libexpat-dev \
        python-dev python python-serial \
        sed git unzip bash help2man \
        wget bzip2 libtool-bin

RUN useradd -md /opt/espbuilder espbuilder
USER espbuilder

WORKDIR /opt/espbuilder
RUN git clone --recursive https://github.com/pfalcon/esp-open-sdk.git

WORKDIR /opt/espbuilder/esp-open-sdk
RUN make

ENV PATH="/opt/espbuilder/esp-open-sdk/xtensa-lx106-elf/bin:${PATH}"

WORKDIR /mnt/code
VOLUME ["/mnt/code"]
ENTRYPOINT ["make"]
