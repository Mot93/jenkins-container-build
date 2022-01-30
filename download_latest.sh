#! /bin/sh

# If the file jenkins.war is already present, delete it
if test -f "jenkins.war"
then
    rm -r jenkins.war
fi

# Printing the version that is going to be downloaded
echo "Downloading latest Jenkins war"

# Downloading the jenkins war
wget -q "https://get.jenkins.io/war/latest/jenkins.war"

exit 0