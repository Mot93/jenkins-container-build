FROM docker.io/alpine:3

RUN apk add openjdk11 \
&& apk add ttf-dejavu

ENV JENKINS_HOME=/var/lib/jenkins

COPY jenkins.war ./

# https://www.jenkins.io/doc/book/installing/initial-settings/
CMD ["java", "-jar", "jenkins.war"]
