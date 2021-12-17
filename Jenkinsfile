pipeline {

    agent {
        dockerfile {
            filename 'Dockerfile'
            registryCredentialsId 'dockerhub'
            args '--tag docker.io/dancingcactus93/jenkins:latest-armv8'
        }
    }

    stages {
        stage('Test') {
            steps {
                sh java -version
            }
        }
    }
}