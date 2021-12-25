pipeline {

    agent {
        dockerfile {
            filename 'jenkins-builder.Dockerfile'
            additionalBuildArgs '--tag jenkins-builder:bullseye'
            args '--name jenkins-builder'
            registryUrl 'https://index.docker.io/v1/'
            registryCredentialsId 'container-registry'
        }
    }

    environment {
        CONTAINER_REGISTRY = credentials("container-registry")
        BUILD_TAG = "${CONTAINER_REGISTRY_USR}/jenkins:<tagname>"
    }

    stages {
        stage ('Pre Build'){
            steps {

                sh './download_latest.sh'
                
            }
        }
        stage ('Build') {
            steps {

                    sh 'echo "build . -f Dockerfile --tag $BUILD_TAG"'
                    //sh 'docker build . -f Dockerfile --tag <username>/jenkins:<tagname>'
                
            }
        }
        stage ('Test'){
            steps {

                sh 'echo "yet to be defined"'

            }
        }
        stage ('Upload') {
            steps{

                sh 'echo "-u <user> -p <password> <registry>"'
                //sh 'docker login -u <user> -p <password> <registry>'
                sh 'echo "$BUILD_TAG"'
                //sh 'docker push <username>/jenkins:<tagname>'

            }
        }
    }

}