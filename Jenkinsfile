pipeline {
    agent any

    triggers {
        cron('H H 1,15,30 1-11 *')
    }

    stages {
        stage('Prepare') {
            steps {
                echo 'Preparing the build environment'
                checkout scm
            }
        }

        stage('Branch Build') {
            when {
                not {
                    branch 'master'
                }
            }
            steps {
                script {
                    def baseimage = docker.build("bateau/alpine_baseimage:${env.BRANCH_NAME}-${env.BUILD_ID}", "--no-cache --squash .")
                    baseimage.docker.push()
                }
            }
        }

        stage('Master Build') {
            when {
                branch 'master'
            }
            steps {
                script {
                    def baseimage = docker.build("bateau/alpine_baseimage:${env.BUILD_ID}", "--no-cache --squash .")
                    baseimage.docker.push()
                }
            }
        }
    }
    post {
        always {
            deleteDir()
            script {
                sh 'docker system prune -af'
            }
        }
    }
}