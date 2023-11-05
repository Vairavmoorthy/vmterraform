pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Vairavmoorthy/vmterraform.git'
            }
        }
        stage('Build Infrastructure') {
            steps {
                withAWS(credentials: '112') {
                    //sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                }
            }
        }
        stage('Deploy Infrastructure') {
            steps {
                sh 'echo "Infrastructure built successfully"'
            }
        }
        stage('Deployment Success') {
            steps {
                sh 'echo "Infra_deployment successfully completed"'
            }
        }
    }
}
