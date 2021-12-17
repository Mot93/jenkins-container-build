pipeline {

    agent none

    stages{
        stage {
            agent {
                dockerfile {
                    filename 'Dockerfile'
                    label 'dancingcactus93/jenkins:latest-armv8'
                    registryCredentialsId 'dockerhub'
                }
            }
        }
    }
}