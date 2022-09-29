pipeline {
    agent any 
    enviroment {
        NEW_VERSION = '1.3.0'
        SERVER_CREDENTIALS = credentials('test-cred')
    }
    stages {
        stage("Build") {
            steps {
                echo 'building the app'
                echo "building version ${NEW_VERSION}"
            }
        }
        stage ("Test") {
            when {
                expression {
                    BRANCH_NAME == 'main'
                }
            }
            steps {
                echo 'testing the app'
            }
        }
        stage ("deploy") {
            steps {
                echo 'deploying the app'
                echo "deploying with ${SERVER_CREDENTIALS}"
                sh "${SERVER_CREDENTIALS}"

            }

        }
    }
}
