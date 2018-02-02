#!groovy
pipeline {
    agent any

    triggers {
        cron('H H 1,15,30 1-11 *')
    }
    stages {
        stage('Checkout') {
            node {
                checkout scm
            }
        }

        stage('Build initial image') {
            node {
                script {
                        def dockerImage = docker.build("bateau/alpine_baseimage")
                }
            }
        }

        stage('Push image') {
            node {
                script {
                    dockerImage.push('${GIT_COMMIT:0:7}-${BUILD_ID}')
                    if (env.BRANCH_NAME == 'master') {
                        dockerImage.push('${GIT_COMMIT:0:7}-${BUILD_ID}')
                        dockerImage.push('latest')
                    } else {
                        dockerImage.push('${BRANCH_NAME}-${GIT_COMMIT:0:7}-${BUILD_ID}')
                    }
                }
            }
        }
    }
}