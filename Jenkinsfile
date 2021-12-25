pipeline {

    agent {
        dockerfile {
            filename 'jenkins-builder.Dockerfile'
            additionalBuildArgs '--tag jenkins-builder:bullseye'
            args '--name jenkins-builder --privileged=true'
            registryUrl 'https://index.docker.io/v1/'
            registryCredentialsId 'container-registry'
        }
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

                    sh 'podman build . -f Dockerfile --tag $BUILD_TAG'
                
            }
        }
        stage ('Test'){
            steps {

                sh 'echo "yet to be defined"'

            }
        }
        stage ('Upload') {
            steps{

                sh 'podman login -u CONTAINER_REGISTRY_USR -p CONTAINER_REGISTRY_PSW index.docker.io'
                sh 'podman push $BUILD_TAG'

            }
        }
    }

}