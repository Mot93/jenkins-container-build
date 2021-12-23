/*node (label: 'rpiarchserver') {

    checkout scm

    stage ('Build'){
        def jenkinsImage = docker.build("jenkins:latest-armv8")
        //def jenkinsImage = docker.build("jenkins:latest-armv8","-f Dockerfile.jenkins ./")
    }

    //jenkinsImage.push()

}*/

pipeline {

    agent {
        label "docker"
    }

    stages {
        stage('Test') {
            steps {
                sh 'echo hello!'
                sh 'cat /etc/os-release'
            }
        }
    }
}