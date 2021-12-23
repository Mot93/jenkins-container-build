pipeline {

    agent {
        //label 'rpiarchserver'
        label 'docker'
    }

    stages {
        stage('Test') {
            steps {
                sh 'cat /etc/os-release'
                /*script {
                    sh 'cat /etc/os-release'
                }*/
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