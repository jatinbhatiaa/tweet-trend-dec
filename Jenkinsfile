pipeline {
    agent {
        node {
            label 'maven-node'
        }
    }
environment{
    PATH = "/opt/apache-maven-3.9.6/bin:$PATH"

}
    stages  {
       stage("build"){
        steps{
            sh "mvn clean deploy"
        }
       }
    }
}