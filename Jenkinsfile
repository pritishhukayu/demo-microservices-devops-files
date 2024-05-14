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
        stage('Build Docker Image') {
            steps {
                // Copy index.js and prit.txt to the workspace directory
                sh 'cp -f index.js prit.txt . || true'
                
                // Build Docker image using the Dockerfile in the workspace
                script {
                    docker.build('my-image-name')
                }
            }
        }
        // Additional stages for testing, deployment, etc.
    }
}
