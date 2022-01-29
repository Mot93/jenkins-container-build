pipeline {

    agent {
        label 'docker'
    }

    environment {
        CONTAINER_REGISTRY = credentials("container-registry")
        BUILD_TAG = "${CONTAINER_REGISTRY_USR}/jenkins:latest-${PROCESS_ARCHITECTURE}"
    }

    stages {
        stage ('Pre Build'){
            steps {

                sh 'chmod +x ./download_latest.sh'
                sh './download_latest.sh'
                
            }
        }
        stage ('Build') {
            steps {
                script {

                    def container = docker.build("${BUILD_TAG}")

                }   
            }
        }
        stage ('Test'){
            steps {
                script {
                    docker.image("${BUILD_TAG}").inside {

                        sh 'echo tests pending'

                    }
                }
            }
        }
        stage ('Upload') {
            steps{
                script {

                    //  Use this code if using a registry that is not the one configured in 
                    //      http://your.jenkins.server.url/configure
                    //  in the section 
                    //      Declarative Pipeline (Docker)

                    /*docker.withRegistry('https://index.docker.io/v1/', 'container-registry') {

                        def container = docker.image("${BUILD_TAG}")
                        container.push()

                    }*/

                    def container = docker.image("${BUILD_TAG}")
                    container.push()

                }
            }
        }
    }

}