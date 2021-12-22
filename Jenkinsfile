node ('rpiarchserver') {

    checkout scm

    def dockerfile = 'Dockerfile.jenkins'
    def jenkinsImage = docker.build("jenkins:latest-armv8","-f ${dockerfile} ./")

    jenkinsImage.push()

}