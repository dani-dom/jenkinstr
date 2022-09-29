pipeline {
    agent any 
    parameters {
        string(name: 'VERSION', defaultValue: '', description: 'version to depploy')
    }
    environment {
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
            }

        }
    }
}
