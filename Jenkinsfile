pipeline {
    agent any

    environment {
        NPM_PATH = "/usr/local/bin/npm" // Specify the full path to npm
    }

    stages {
        stage('Build') {
            steps {
                // Checkout source code from main branch
                git branch: 'main', url: 'https://github.com/pritishhukayu/demo-microservices.git' 

                // Install dependencies using the full path to npm
                sh "${env.NPM_PATH} install"

                // Run tests using the full path to npm
                sh "${env.NPM_PATH} test"
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
