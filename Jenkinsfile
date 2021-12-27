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

                    def jenkins_container = docker.build("${BUILD_TAG}")
                    
                }
                //sh 'docker build . -f Dockerfile --tag $BUILD_TAG'
                
            }
        }
        stage ('Test'){
            steps {

                sh 'echo "yet to be defined"'

            }
        }
        stage ('Upload') {
            steps{

                sh 'docker login -u ${CONTAINER_REGISTRY_USR} -p ${CONTAINER_REGISTRY_PSW} index.docker.io && docker push $BUILD_TAG'

            }
        }
    }

}