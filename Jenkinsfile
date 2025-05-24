pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'anuopp/calculator-app' // Change this
        KUBE_CONFIG = credentials('kubeconfig-id') // Add this credential in Jenkins
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'project-3', url: 'https://github.com/yourusername/proj-mdp-152-155.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh '''
                        echo $PASS | docker login -u $USER --password-stdin
                        docker push $DOCKER_IMAGE
                    '''
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                withCredentials([file(credentialsId: 'kubeconfig-id', variable: 'KUBECONFIG')]) {
                    sh '''
                        kubectl apply -f k8s/deployment.yml
                        kubectl apply -f k8s/service.yml
                    '''
                }
            }
        }
    }
}
