pipeline {
    agent any

    environment {
        PATH = "$PATH:/usr/local/bin" // Assuming npm is installed in /usr/local/bin
    }

    stages {
        stage('Build') {
            steps {
                // Checkout source code from main branch
                git branch: 'main', url: 'https://github.com/pritishhukayu/demo-microservices.git' 

                // Install dependencies
                sh 'npm install'   

                // Run tests
                sh 'npm test'      
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Get the build number
                    def buildNumber = env.BUILD_NUMBER

                    // Define the Docker image name with Jenkins build number as tag
                    def imageName = "your-registry/your-image-name:${buildNumber}"

                    // Build Docker image
                    docker.build(imageName) 
                }
            }
        }
    }
}
