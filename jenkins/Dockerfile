FROM jenkins/jenkins:lts
USER root
RUN apt-get update && apt-get -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common gettext && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && apt-get -y install docker-ce && \
    usermod -aG docker jenkins && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/$
    chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl
USER jenkins
