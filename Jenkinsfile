pipeline{

    agent any

    stages{

        stage('Build Jar'){
            steps{
                sh "mvn clean package -DskipTests"
            }
        }

        stage('Build Image'){
            steps{
                sh "docker build -t=akash0918/selenium ."
            }
        }

        stage('Push Image'){
            steps{
                sh "docker push akash0918/selenium ."
            }
        }
    }

}