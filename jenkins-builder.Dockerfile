# This Container has everything that is needed to build the Jenkins container
FROM docker.io/debian:bullseye

RUN apt update \
&& apt upgrade -y \
&& apt install \
    wget \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
&& curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
&& echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt update && apt install docker-ce docker-ce-cli containerd.io
