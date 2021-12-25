#! /bin/sh

# curl has to be present
if ! command -v curl &> /dev/null
then
    echo "curl could not be found"
    exit 1
fi

# wget has to be present
if ! command -v wget &> /dev/null
then
    echo "wget could not be found"
    exit 2
fi

# If the file jenkins.war is already present, delete it
if test -f "jenkins.war"
then
    rm -r jenkins.war
fi

# Display what war is gonna be used
curl -s https://api.github.com/repos/jenkinsci/jenkins/releases/latest \
| grep "jenkins.war" 

# Dowaload the latest jenkins war
curl -s https://api.github.com/repos/jenkinsci/jenkins/releases/latest \
| grep "jenkins.war" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -

exit 0