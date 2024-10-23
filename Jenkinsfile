pipeline {

    agent any

    stages {

        stage('Build Jar') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Image') {
            steps {
                sh 'docker build -t=akash0918/selenium:latest .'
            }
        }

        stage('Push Image') {
            environment {
                DOCKER_HUB = credentials('dockerhub-creds')
            }
            steps {
                sh 'echo ${DOCKER_HUB_PSW} | docker login -u ${DOCKER_HUB_USR} --password-stdin'
                sh 'docker push akash0918/selenium:latest'
                sh "docker tag akash0918/selenium:latest akash0918/selenium:${env.BUILD_NUMBER}"
                sh "docker push akash0918/selenium:${env.BUILD_NUMBER}"
            }
        }
    }

    post {
        always {
            sh 'docker logout'
        }
    }
}
