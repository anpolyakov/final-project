pipeline {
    agent {
        dockerfile {
            filename 'Dockerfile'
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
        stage('Terraform destroy') {
            steps {
                sh 'terraform destroy --auto-approve'
            }
        }
    }
}