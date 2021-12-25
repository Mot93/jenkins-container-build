# This Container has everything that is needed to build the Jenkins container
FROM docker.io/debian:11

RUN apt update && apt upgrade -y \
&& apt install \
    curl \
    wget \
    podman -y
