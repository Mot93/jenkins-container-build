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
                
            }
        }
        stage ('Test'){
            steps {

                script {

                    docker.image("${BUILD_TAG}").inside {

                        sh 'echo tests pending'

                    }

                }
                //sh 'echo "yet to be defined"'

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

                        def jenkins_container = docker.image("${BUILD_TAG}")
                        jenkins_container.push()

                    }*/

                    def jenkins_container = docker.image("${BUILD_TAG}")
                    jenkins_container.push()

                }
                //sh 'docker login -u ${CONTAINER_REGISTRY_USR} -p ${CONTAINER_REGISTRY_PSW} index.docker.io && docker push $BUILD_TAG'

            }
        }
    }

}