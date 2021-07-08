FROM debian:buster

ENV JENKINS_HOME=/var/lib/jenkins

RUN mkdir -p $JENKINS_HOME && \
apt update && \
apt upgrade -y && \
apt install openjdk-11-jre -y

COPY jenkins.war ./

# https://www.jenkins.io/doc/book/installing/initial-settings/
CMD java -jar jenkins.war --httpPort=8080