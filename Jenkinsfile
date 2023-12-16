pipeline {
    agent {
        node {
            label 'maven-node'
        }
    }
    stages  {
        stage('pull code'){
            steps {
               git branch: 'main', url: 'https://github.com/jatinbhatiaa/tweet-trend-dec.git'
            }
        }
    }
}