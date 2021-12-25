pipeline {

    agent {
        label "docker"
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