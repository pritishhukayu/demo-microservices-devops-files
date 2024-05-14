pipeline {
    agent any
    
    stages {
        stage('Checkout Source Code') {
            steps {
                // Checkout source code from one repository
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: 'main']],
                    userRemoteConfigs: [[url: 'https://github.com/pritishhukayu/demo-microservices.git']]
                ])
            }
        }
        stage('Checkout Dockerfile') {
            steps {
                // Checkout Dockerfile from another repository
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: 'main']],
                    userRemoteConfigs: [[url: 'https://github.com/pritishhukayu/demo-microservices-devops-files.git']]
                ])
            }
        }
        stage('Check Workspace Contents') {
            steps {
                // List contents of the workspace
                sh 'ls -l'
            }
        }
        stage('Build Docker Image') {
            steps {
                // Copy Dockerfile to the directory where the source code is located
                sh 'cp Dockerfile ./source-code-directory'
                
                // Build Docker image using the Dockerfile in the workspace
                script {
                    docker.build('pritishpoc-demo-microservices:latest')
                }
            }
        }
        // Additional stages for testing, deployment, etc.
    }
}
