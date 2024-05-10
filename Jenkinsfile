pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                git branch: 'main', url: 'https://github.com/pritishhukayu/demo-microservices.git' // Checkout source code from main branch
                sh 'npm install'   // Install dependencies
                sh 'npm test'      // Run tests
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    def buildNumber = env.BUILD_NUMBER
                    def imageName = "your-registry/your-image-name:${buildNumber}"
                    docker.build(imageName) // Build Docker image with Jenkins build number as tag
                }
            }
        }
    }
}
