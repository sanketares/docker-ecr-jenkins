pipeline {
    agent any

    
    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
        GITHUB_TOKEN = credentials('git-token')
        AWS_DEFAULT_REGION    = 'us-west-2'
        ECR_REPOSITORY_NAME = 'sanket/new'
        DOCKER_IMAGE_NAME = '010928201659.dkr.ecr.us-west-2.amazonaws.com/${ECR_REPOSITORY_NAME}'
        DOCKER_TAG = 'latest'
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/sanketares/docker-ecr-jenkins'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    docker.build("${DOCKER_IMAGE_NAME}:${DOCKER_TAG}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                        sh '''
                        $(aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | docker login --username AWS --password-stdin ${DOCKER_IMAGE_NAME})
                        '''
                        
                        // Push the Docker image
                        docker.image("${DOCKER_IMAGE_NAME}:${DOCKER_TAG}").push("${DOCKER_TAG}")
                    }
                }
            }
        }

    }
}

