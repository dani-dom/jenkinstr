def gv
pipeline {
    agent any 
    parameters {
        choice(name: 'VERSION', choices: ['1', '2'], description: '')
        string(name: 'VERSION1', defaultValue: '', description: 'version to depploy')
    }
    environment {
        NEW_VERSION = '1.3.0'
        SERVER_CREDENTIALS = credentials('test-cred')
    }
    stages {
        stage ("init") {
            steps {
                script {
                    gv=load "script.groovy"
                }
            }

        }
        stage("Build") {
            steps {
                script{
                    gv.BuildApp()


                }
                
                echo "building version ${NEW_VERSION}"
            }
        }
        stage ("Test") {
            when {
                expression {
                    params.VERSION == '1'
                }
            }
            steps {
                script{
                    gv.TestApp()
                    

                }
                echo 'testing the app'
            }
        }
        stage ("deploy") {
            steps {
                script{
                    gv.DepApp()
                    

                }
                echo 'deploying the app'
            }

        }
    }
}
