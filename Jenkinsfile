#!groovy
properties(
    [
        pipelineTriggers([cron('0 * * * *')])
    ]
)

node() {
        stage('Checkout') {
                checkout scm
        }

        stage('Build initial image') {
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

        stage('Push image') {
                script {
                    if (env.BRANCH_NAME == 'master') {
                        dockerImage.push("${GIT_COMMIT}-${BUILD_ID}")
                        dockerImage.push("latest")
                    } else {
                        dockerImage.push("${BRANCH_NAME}-${GIT_COMMIT}-${BUILD_ID}")
                    }
                }
        }
}