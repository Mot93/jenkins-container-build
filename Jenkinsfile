pipeline {

    agent {
        dockerfile {
            filename 'Dockerfile'
            label 'dancingcactus93/jenkins:latest-armv8'
            registryCredentialsId 'dockerhub'
        }
    }

    stages{
        stage('Test') {
            steps {
                sh java -version
            }
        }
    }
}