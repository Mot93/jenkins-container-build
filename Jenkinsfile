//node (label: 'rpiarchserver') {
node ('rpiarchserver.mattiarubini.com') {

    checkout scm

    def jenkinsImage = docker.build("jenkins:latest-armv8")
    //def jenkinsImage = docker.build("jenkins:latest-armv8","-f Dockerfile.jenkins ./")

    //jenkinsImage.push()

}