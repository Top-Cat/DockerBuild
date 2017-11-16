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

FROM debian
COPY --from=0 /opt/espbuilder/esp-open-sdk/xtensa-lx106-elf /opt/espbuilder/xtensa-lx106-elf
RUN useradd -md /opt/espbuilder espbuilder

RUN apt-get update
RUN apt-get install -y \
        make python python-serial

USER espbuilder
ENV PATH "/opt/espbuilder/xtensa-lx106-elf/bin:${PATH}"

WORKDIR /mnt/code
VOLUME ["/mnt/code"]
ENTRYPOINT ["make"]
