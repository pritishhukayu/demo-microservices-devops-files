pipeline {
    agent any

    stages {
        stage('Clone Source Code') {
            steps {
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
        stage('Clone Dockerfile') {
            steps {
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
        stage('Build Docker Image') {
            steps {
                sh '''
                    cp -f docker-files/Dockerfile source-code/.
                    ls -a source-code
                    ls -a docker-files
                '''
                docker.build('my-image-name', './source-code')
            }
        }
    }
}
