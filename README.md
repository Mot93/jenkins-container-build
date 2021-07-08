# jenkins-container
Dockerfile to create a container of Jenkins.
I created this project to manage the absense of an image of jenkins designed for arm.
With this simple Dockerfile you can build on any platform using any version of Jenkins.
The only pre requisite is to have the jenkins war of your choosing.

## Note
* The home folder of jenkins is set to /var/lib/jenkins
* At this [link](https://www.jenkins.io/doc/book/installing/initial-settings/) is possible to find different configuration for the war.
