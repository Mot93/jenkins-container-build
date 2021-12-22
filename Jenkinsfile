node ('rpiarchserver') {

    checkout scm

    def jenkinsImage = docker.build("jenkins:latest-armv8")

    jenkinsImage.push()

}