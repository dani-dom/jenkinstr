def gv
pipeline {
    agent any 
    parameters {
        choice(name: 'VERSION', choices: ['Resident Evil', 'Until Down', 'Layers of Fear'], description: 'Which game would you like to gift to Daniel?')
        string(name: 'SIGN', defaultValue: '', description: 'Include a brief cheer messaging for sending the gift:')
        booleanParam(name: 'CAKE', defaultValue: false, description: 'Would you like to include a tres leches cake?')
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
                withCredentials([
                    usernamePassword(credentialsId: 'test-cred', usernameVariable: PW1, passwordVariable: PW2)]) {
                    echo "My password is ${PW1} and ${PW2}!"
    
}
            }

        }
    }
}
