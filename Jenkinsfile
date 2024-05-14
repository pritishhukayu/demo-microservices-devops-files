pipeline {
    agent any
    
    stages {
        stage('Clone Source Code') {
            steps {
                script {
                    dir('source-code') {
                        checkout([$class: 'GitSCM',
                            branches: [[name: 'main']],
                            doGenerateSubmoduleConfigurations: false,
                            extensions: [],
                            submoduleCfg: [],
                            userRemoteConfigs: [[url: 'https://github.com/pritishhukayu/demo-microservices.git']]
                        ])
                        sh 'ls -a'
                    }
                }
            }
        }
        stage('Clone Dockerfile') {
            steps {
                script {
                    dir('docker-files') {
                        checkout([$class: 'GitSCM',
                            branches: [[name: 'main']],
                            doGenerateSubmoduleConfigurations: false,
                            extensions: [],
                            submoduleCfg: [],
                            userRemoteConfigs: [[url: 'https://github.com/pritishhukayu/demo-microservices-devops-files.git']]
                        ])
                        sh 'ls -a'
                    }
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'cp -f docker-files/index.js docker-files/prit.txt source-code/.'
                    sh 'ls -a source-code'
                    docker.build('my-image-name', './source-code')
                }
            }
        }
    }
}
