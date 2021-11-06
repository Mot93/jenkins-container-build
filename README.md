# Jenkins
The aim of this project is to build a container running [Jenkins](https://github.com/jenkinsci/jenkins).

I decided to create this project because I couldn't find a container image for my raspberry pi.

With the content of this folder, anyone can create a jenkins container for the platform of it's chhosing, as long as the platform is supported by [Alpine](https://www.alpinelinux.org/) and  [OpenJDK 11](https://openjdk.java.net/projects/jdk/11/).

# How to build the image

1. Download the jenkins war file of the version you would like to use. 
    If the latest version is needed, just launch the `download_latest.sh` file.

2. Build the image usign the `Dockerfile`.
    Since I prefer to use podman:

        podman build . --tag jenkins
    
# Notes
It's possible to find additional installation configuaration [here](https://www.jenkins.io/doc/book/installing/initial-settings/).
