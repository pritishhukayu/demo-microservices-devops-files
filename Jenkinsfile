pipeline {
    agent any
    
    stages {
        stage('Checkout Source Code') {
            steps {
                script {
                    checkout scm
                    sh 'ls -a'
                }
            }
        }
        stage('Checkout Dockerfile') {
            steps {
                script {
                    checkout([$class: 'GitSCM',
                        branches: [[name: '*/main']],
                        doGenerateSubmoduleConfigurations: false,
                        extensions: [],
                        submoduleCfg: [],
                        userRemoteConfigs: [[url: 'https://github.com/pritishhukayu/demo-microservices-devops-files.git']]
                    ])
                    sh 'ls -a'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'cp -f index.js prit.txt .'
                    sh 'ls -a'
                    docker.build('my-image-name')
                }
            }
        }
    }
}
