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
if test -f "jenkins.war"; then
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

# If the file jenkins.war wasn't downloaded, return error
if ! [[ test -f "jenkins.war" ]] then
    echo "Could not download jenkins.war"
    exit 3
fi

exit 0