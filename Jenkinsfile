pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build image') {
            steps {
                sh 'docker build -t bateau/alpine_baseimage:initial .'
            }
        }
        stage('Retag') {
            steps {
                sh 'docker tag bateau/alpine_baseimage:initial bateau/alpine_baseimage:${env.BUILD_ID}'
		sh 'docker tag bateau/alpine_baseimage:initial bateau/alpine_baseimage:latest'
            }
        }
        stage('Push') {
            steps {
                sh 'docker push bateau/alpine_baseimage:${env.BUILD_ID}'
                sh 'docker push bateau/alpine_baseimage:latest'
            }
        }
    }
}
