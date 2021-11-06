#! /bin/bash

# If the file jenkins.war is already present, delete it
if test -f "jenkins.war"; then
    rm -r jenkins.war
fi

# Dowaload the latest jenkins war
curl -s https://api.github.com/repos/jenkinsci/jenkins/releases/latest \
| grep "jenkins.war" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -