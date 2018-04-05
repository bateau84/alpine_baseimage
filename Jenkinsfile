pipeline {
    agent any

    triggers {
        cron('H H 1,15,30 1-11 *')
    }

    stages {
        stage('Prepare') {
            steps {
                echo 'Preparing the build environment'
                setVariables()
                checkout scm
            }
        }

        stage('Build') {
            when {
                not {
                    branch 'master'
                }
            }
            steps {
                def baseimage = docker.build("bateau/alpine_baseimage:${env.BRANCH_NAME}-${env.BUILD_ID}")
            }
            post {
                failure {
                    slackBuildFailure()
                }
            }
        }

        stage('Master Build') {
            when {
                branch 'master'
            }
            steps {
                def baseimage = docker.build("bateau/alpine_baseimage:${env.BUILD_ID}")
            }
        }

        stage('Push image') {
            steps {
                baseimage.push()
            }
        }
    }
    post {
        always {
            deleteDir()
        }
    }
}