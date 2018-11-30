FROM debian

USER root
RUN apt-get update
RUN apt-get install -y \
         git wget make libncurses-dev \
         flex bison gperf python \
         python-serial python-pip

RUN useradd -md /opt/espbuilder espbuilder
USER espbuilder

WORKDIR /opt/espbuilder
RUN wget https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-73-ge28a011-5.2.0.tar.gz && \
    tar -xzf xtensa-esp32-elf-linux64-1.22.0-73-ge28a011-5.2.0.tar.gz

RUN git clone --recursive https://github.com/espressif/esp-idf.git
RUN python -m pip install --user -r esp-idf/requirements.txt

ENV PATH "/opt/espbuilder/xtensa-esp32-elf/bin:${PATH}"
ENV IDF_PATH "/opt/espbuilder/esp-idf"
ENV PWD "/mnt/code"

WORKDIR /mnt/code
VOLUME ["/mnt/code"]
ENTRYPOINT ["make"]
