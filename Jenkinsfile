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
                   // sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                }
            }
        }
        stage('Deploy Infrastructure') {
            steps {
                sh 'echo "Infrastructure built successfully"'
            }
        }
<<<<<<< HEAD
        stage('Deployment success') {
            steps {
         
                    sh 'echo "Infra_deployment successfully completed"'
                    
                }
            }
        }
=======
>>>>>>> 523b153223133db232092d8fcb7699db04b78ea8
    }
}
