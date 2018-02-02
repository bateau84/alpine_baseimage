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
        stage('Build image') {
            steps {
                sh 'printenv'
                sh 'docker build --squash -t bateau/alpine_baseimage:$BRANCH_NAME-initial .'
            }
        }
        stage('Retag') {
            if (env.BRANCH_NAME == 'master') {
                steps {
                    sh 'docker tag bateau/alpine_baseimage:$BRANCH_NAME-initial bateau/alpine_baseimage:$BUILD_ID'
                    sh 'docker tag bateau/alpine_baseimage:$BRANCH_NAME-initial bateau/alpine_baseimage:latest'
                }
            } else {
                steps {
                    sh 'docker tag bateau/alpine_baseimage:$BRANCH_NAME-initial bateau/alpine_baseimage:$BRANCH_NAME-$BUILD_ID'
                }
            }
        }
        stage('Push') {
            if (env.BRANCH_NAME == 'master') {
                steps {
                    sh 'docker push bateau/alpine_baseimage:$BUILD_ID'
                    sh 'docker push bateau/alpine_baseimage:latest'
                }
            } else {
                steps {
                    sh 'docker push bateau/alpine_baseimage:$BRANCH_NAME-$BUILD_ID'
                }
            }
        }
    }
}
