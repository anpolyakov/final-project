pipeline {
    agent {
        dockerfile {
            filename 'Dockerfile'
        } 
    }
    stages {
        stage('Test') {
            steps {
                sh 'cat /etc/lsb-release'
            }
        }
    }
}