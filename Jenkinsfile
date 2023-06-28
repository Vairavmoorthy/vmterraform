pipeline {
    agent any
    environment {
        TF_VAR_credentials = credentials('112')
    }
    stages {
        stage('Destroy Infrastructure') {
            steps {
                withAWS(credentials: '112') {
                    //sh 'terraform init'
                    sh 'terraform destroy -auto-approve'
                }
            }
        }
    }
}

