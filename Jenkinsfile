pipeline {

    agent {
        dockerfile {
            filename 'Dockerfile.jenkins'
            registryCredentialsId 'dockerhub'
            additionalBuildArgs '--tag jenkins:latest-armv8'
            args '--name jenkins'
            registryUrl 'https://index.docker.io/v1/'
            registryCredentialsId 'dockerhub'
        }
    }

    stages {
        stage('Test') {
            /*agent {
                docker { image 'docker:latest' }
            }*/
            steps {
                sh 'java -version'
                sh 'cat /etc/os-release'
                /*withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh 'docker login registry-1.docker.io -u $USERNAME -p $PASSWORD'
                }
                sh 'docker push dancingcactus93/jenkins:latest-armv8'*/
            }
        }
    }
}