FROM docker.io/alpine:3

RUN apk add openjdk11

ENV JENKINS_HOME=/var/lib/jenkins

WORKDIR /var/lib/jenkins

COPY jenkins.war ./

# https://www.jenkins.io/doc/book/installing/initial-settings/
CMD ["java", "-jar", "jenkins.war"]
