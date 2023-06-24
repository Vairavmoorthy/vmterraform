pipeline {
    agent any
    environment {
        TF_VAR_credentials = credentials('112')
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Vairavmoorthy/vmterraform.git'
            }
        }
        stage('Build Infrastructure') {
            steps {
                withAWS(credentials: '112') {
                    sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                }
            }
        }
        stage('Deploy Infrastructure') {
            steps {
                sh 'echo "Infrastructure built successfully"'
            }
        }
        stage('Destroy Infrastructure') {
            steps {
                withAWS(credentials: '112') {
                    sh 'terraform init'
                    sh 'terraform destroy -auto-approve'
                }
            }
        }
    }
}
