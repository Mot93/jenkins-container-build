# This Container has everything that is needed to build the Jenkins container
FROM docker.io/debian:bullseye

RUN apt update \
&& apt upgrade -y \
&& apt install wget curl podman -y