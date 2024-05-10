pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/pritishhukayu/demo-microservices.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t pritishhukayu/demo-microservice:latest .'  // Replace with your desired image name (local registry)
            }
        }
    }
}
