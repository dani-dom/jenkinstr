def gv
pipeline {
    agent any 
    parameters {
        choice(name: 'Game', choices: ['Resident Evil', 'Until Down', 'Layers of Fear'], description: 'Which game would you like to gift to Daniel?')
        string(name: 'Message', defaultValue: '', description: 'Include a brief cheer messaging for sending the gift:')
        string(name: 'SENDER', defaultValue: '', description: 'Include a brief cheer messaging for sending the gift:')
        choice(name: 'Color', choices: ['Red', 'Blue', 'Gold'], description: 'Select the color box for the gift')
        booleanParam(name: 'YES', defaultValue: false, description: 'Would you like to include a tres leches cake?')
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
                withCredentials([
                    usernamePassword(credentialsId: 'test-cred', usernameVariable: 'PW1', passwordVariable: 'PW2')]) {
                    echo "My password is ${PW1} and ${PW2}!"
    
}
            }

        }
        stage("Build") {
                when {
            expression {
                params.SENDER == 'Hailey'
            }
        }
            steps {
                script{
                    gv.BuildApp()
                }

                echo "Grapping the gift in the ${Color} box "
            }
        }
        stage ("Testing the box toughness") {
            when {
                expression {
                    params.SENDER == 'Hailey'
                }
            }
            steps {
                script{
                    gv.TestApp()
                    echo 'yeah, it seems like it can survive the trip'
                }
                echo 'testing the app'
            }
        }
        stage ("Deploy gift") {
            when {
                expression {
                    params.SENDER == 'Hailey'
                }
            }
            steps {
                script{
                    gv.DepApp()
                    

                }
                echo "The videogame ${Game} has been deployed to Daniel with the following note:"
                echo "Note: ${Message}"
                if (params.YES == True ) {
                    echo 'and tysm for the cake :)'

                } else {
                    echo 'you could had added a cake, tho...'
                }
                
            }

        }
    }
}
