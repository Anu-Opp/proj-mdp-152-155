pipeline {
    agent any

    environment {
<<<<<<< HEAD
        DOCKER_IMAGE = 'anuopp/calculator-app' // Change this
        KUBE_CONFIG = credentials('kubeconfig-id') // Add this credential in Jenkins
=======
        DOCKER_IMAGE = 'anuopp/calculator-app'
>>>>>>> d3b0f38 (updated Jenkins file with github credentials)
    }

    stages {
        stage('Checkout Code') {
            steps {
<<<<<<< HEAD
                git branch: 'project-3', url: 'https://github.com/yourusername/proj-mdp-152-155.git'
=======
                git branch: 'project-3', 
                    url: 'https://github.com/Anu-Opp/proj-mdp-152-155.git',
                    credentialsId: 'github-credentials'
>>>>>>> d3b0f38 (updated Jenkins file with github credentials)
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
<<<<<<< HEAD
=======

>>>>>>> d3b0f38 (updated Jenkins file with github credentials)
