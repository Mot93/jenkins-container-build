pipeline {

    agent {
        dockerfile {
            filename 'jenkins-builder.Dockerfile'
            additionalBuildArgs '--tag jenkins-builder:bullseye'
            args '--name jenkins-builder'
            registryUrl 'https://index.docker.io/v1/'
            registryCredentialsId 'docker-registry'
        }
    }

    stages {
        stage('Build') {
            steps {
                sh './download_latest.sh'
                sh 'echo "build . -f Dockerfile --tag <username>/jenkins:<tagname>"'
                //sh 'docker build . -f Dockerfile --tag <username>/jenkins:<tagname>'
                sh 'echo "-u <user> -p <password> <registry>"'
                //sh 'docker login -u <user> -p <password> <registry>'
                sh 'echo "-u <user> -p <password> <registry>"'
                //sh 'docker login -u <user> -p <password> <registry>'
                sh 'echo <username>/jenkins:<tagname>"'
                //sh 'docker push <username>/jenkins:<tagname>'
            }
        }
    }

}