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
        stage('Check Source Code Contents') {
            steps {
                // List contents of the source code directory
                sh 'ls -l source-code-directory'
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
        // Additional stages for building Docker image, testing, deployment, etc.
    }
}
