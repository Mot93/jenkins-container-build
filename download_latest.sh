#! /bin/sh

# If the file jenkins.war is already present, delete it
if test -f "jenkins.war"
then
    rm -r jenkins.war
fi

# Get the latest version of Jenkins from GitHub
latest_version=$(curl -s https://api.github.com/repos/jenkinsci/jenkins/releases/latest \
| grep '"name":' \
| cut -d : -f 2 \
| tr -d \" \
| sed 's/,//' \
| sed 's/ //')

# Printing the version that is going to be downloaded
echo "Downloading Jenkins version $latest_version"

# Downloading the jenkins war
wget -q "https://get.jenkins.io/war/$latest_version/jenkins.war"

exit 0