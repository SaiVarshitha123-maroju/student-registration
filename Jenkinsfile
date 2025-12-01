pipeline{
    agent any
    environment{
        DOCKER_CRED=credentials('docker-login')
        DOCKER_IMG='student-registration'
        DOCKER_TAG='v1.0'
        DOCKER_USR='saivarshithamaroju'
    }
    stages{
        stage('Checkout Source Code'){
            steps{
                echo 'Integrating git'
                git branch:'main', url: 'https://github.com/SaiVarshitha123-maroju/student-registration.git'
            }
        }
        stage('Build Docker Image'){
            steps{
                echo 'Building Docker Image'
                bat "docker build -t ${DOCKER_IMG}:${DOCKER_TAG} ."
            }
        }
        stage('Docker Login'){
            steps{
                echo 'Logging into Docker Hub'
                bat "echo ${DOCKER_CRED_PSW} | docker login -u ${DOCKER_CRED_USR} --password-stdin"
            }
        }
        stage('Push Docker Image'){
            steps{
                echo 'Push Image to Docker Hub'
                bat "docker tag ${DOCKER_IMG}:${DOCKER_TAG} ${DOCKER_USR}/${DOCKER_IMG}:${DOCKER_TAG}"
                bat "docker push ${DOCKER_USR}/${DOCKER_IMG}:${DOCKER_TAG}"
            }
        }
    }
    post{
        success{
            echo 'Build passed'
        }
        failure{
            echo 'Build failed'
        }
    }
}