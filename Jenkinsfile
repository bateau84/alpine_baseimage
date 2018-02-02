#!groovy
pipeline {
    agent any

    triggers {
        cron('H H 1,15,30 1-11 *')
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build initial image') {
            steps {
                script {
                    try {
                        timeout(time: 5, unit: 'MINUTES'){
                            def dockerImage = docker.build('bateau/alpine_baseimage', '--no-cache --squash .')
                        }
                    } catch (err) {
                        throw err
                    }
                }
            }
        }

        stage('Push image') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'master') {
                        dockerImage.push("${GIT_COMMIT:0:7}-${BUILD_ID}")
                        dockerImage.push("latest")
                    } else {
                        dockerImage.push("${BRANCH_NAME}-${GIT_COMMIT:0:7}-${BUILD_ID}")
                    }
                }
            }
        }
    }
}