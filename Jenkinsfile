pipeline {

    agent 'rpiarchserver'

    stages {
        stage('Test') {
            steps {
                script {
                    sh 'cat /etc/os-release'
                }
            }
        }
    }
}


/*node (label: 'rpiarchserver') {

    checkout scm

    def jenkinsImage = docker.build("jenkins:latest-armv8")
    //def jenkinsImage = docker.build("jenkins:latest-armv8","-f Dockerfile.jenkins ./")

    //jenkinsImage.push()

}*/