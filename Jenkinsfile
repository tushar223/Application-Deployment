pipeline {
    agent {lable: "Pipelineagent"}
 
    environment {
        scannerHome = tool 'SonarQubeScanner' // tool name from Global Tool Configuration
    }
 
    stages {
        stage('Cloning') {
            steps {
                git branch: 'master', url: 'https://github.com/****/NetflicCloneDevopsProject.git'
            }
        }
 
        stage('Scanning the source code') {
            steps {
                withSonarQubeEnv('SonarQubeConnection') { // name from "Configure System"
                    sh """${scannerHome}/bin/sonar-scanner \
                        -Dsonar.projectName='NetflicCloneDevopsProject' \
                        -Dsonar.projectKey=movieapp-pipeline \
                        -Dsonar.sources=."""
                }
            }
        }
        
        stage('Connecting to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockertoken',
                                           usernameVariable: 'DOCKER_USER',
                                           passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }
        
        stage('Pull image from Docker Hub') {
            steps {
                sh "docker pull 525212/netflixmovie-react-app"
            }
        }
        
        stage('Running the deployment file') {
            steps {
                sh "kubectl apply -f movie-deployment.yaml"
            }
        }
        
        stage('Running the service file') {
            steps {
                sh "kubectl apply -f movie-service.yaml"
            }
        }
    }
    
    post {
        success {
            emailext(
                to: "******@gmail.com",
                subject: "Build Successful",
                body: "The Jenkins build completed successfully!"
            )
        }
    }
}
