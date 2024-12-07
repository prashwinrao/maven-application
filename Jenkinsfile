pipeline {
    agent {
        label 'slave'
    }
    tools {
        maven "maven" 
        dockerTool "docker"
    }
    environment {
        DOCKER_REGISTRY="ashwinraopr"
    }
    stages {
        stage('SCM Checkout') {
            steps {
                git branch: 'task4', url: 'https://github.com/prashwinrao/maven-application.git'
            }
        }
      
        stage('Maven Build') {
            steps {
                script {
                    sh "mvn clean package"
                }
            }
        }
        
        stage('Deploy to tomcat') {
            steps {
                script {
                    def warFile = "./target/my-webapp-${BUILD_NUMBER}.war"
                    sh "sudo cp -r ${warFile} /opt/tomcat/webapps/"
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    def imageName = "ashwinraopr/my-webapp:${BUILD_NUMBER}"
                    sh "docker build --build-arg BUILD_NUMBER=${BUILD_NUMBER} -t ${imageName} ."
                    echo "Docker build ${imageName} pushed successfully."
                }
            }
        }
         stage('Push Docker Image') {
            steps {
                script {
                    def imageName = "${DOCKER_REGISTRY}/my-webapp:${BUILD_NUMBER}"
                    withCredentials([usernamePassword(credentialsId: 'docker-creds', passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USER')]) {
                        sh """
                        echo "${DOCKER_PASS}" | docker login -u "${DOCKER_USER}" --password-stdin
                        docker push ${imageName}
                        docker logout
                        """
                    }
                    
                    echo "Docker image ${imageName} pushed successfully."
                }
            }
        }
    }
    post {
        success {
            echo 'Build and deploy successful.'
        }
        failure {
            echo 'Build or deploy failed.'
        }
    }
}

