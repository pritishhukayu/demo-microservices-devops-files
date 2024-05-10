pipeline {
    agent any

    stages {
        stage('Build') {
            environment {
                PATH = "/usr/local/bin:/usr/bin:/bin" // Add additional directories if npm is installed elsewhere
            }
            steps {
                // Checkout source code from main branch
                git branch: 'main', url: 'https://github.com/pritishhukayu/demo-microservices.git' 

                // Install dependencies
                sh '/usr/local/bin/npm install'   // Specify the full path to npm

                // Run tests
                sh '/usr/local/bin/npm test'      // Specify the full path to npm
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
