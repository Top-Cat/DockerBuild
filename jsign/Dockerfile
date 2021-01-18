FROM debian
RUN apt-get update && apt-get install wget default-jre-headless -y
RUN wget https://github.com/ebourg/jsign/releases/download/3.1/jsign_3.1_all.deb
RUN dpkg -i jsign_3.1_all.deb
RUN apt-get install -f -y
ENTRYPOINT ["jsign"]
