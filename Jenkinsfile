pipeline {
    agent {
        dockerfile {
            filename 'Dockerfile'
            dir 'jenkins-agent'
        }
    }
    
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    
    stages {
        stage('Git Pull') {
            steps {
                git 'https://github.com/anpolyakov/final-project'
            }
        }
        stage('Terraform init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform plan') {
            steps {
                sh 'terraform plan -input=false -out tfplan'
                sh 'terraform show -no-color tfplan > tfplan.txt'
                sh 'terraform apply --auto-approve'
            }
        }
        stage('Ansible ping') {
            steps {
                sh 'sleep 1m'
                    ansiblePlaybook( 
                    playbook: 'provisoning.yml',
                    inventory: 'inventory',
                    credentialsId: 'aws_key',
                    disableHostKeyChecking: false
                )
            }
        }
    }
}