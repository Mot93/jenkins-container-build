pipeline {

    agent {
        dockerfile {
            filename 'Dockerfile.jenkins'
            registryCredentialsId 'dockerhub'
            additionalBuildArgs '--tag docker.io/dancingcactus93/jenkins:latest-armv8'
        }
    }

    stages {
        stage('Test') {
            steps {
                sh 'java -version'
                sh 'ls /'
            }
        }
    }
}