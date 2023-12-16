pipeline {
    agent {
        node {
            label 'maven-node'
        }
    }
environment {
    PATH = "/opt/apache-maven-3.9.6/bin:$PATH"
}
    stages {
         stage("build") {
            steps {
              sh 'mvn clean deploy -Dmaven.test.skip=true'
         }
    }

    stage("unit test") {
        steps{
            sh 'mvn surefire-report:report'
        }
    }

    stage('SonarQube analysis') {
  environment {

  scannerHome = tool 'sonar-scan'
}
steps {
    withSonarQubeEnv('sonar-server') { // If you have configured more than one global server connection, you can specify its name
      sh "${scannerHome}/bin/sonar-scanner"

    }
}
  }

  stage("Quality Gate"){
    steps {
        script {
  timeout(time: 1, unit: 'HOURS') { // Just in case something goes wrong, pipeline will be killed after a timeout
    def qg = waitForQualityGate() // Reuse taskId previously collected by withSonarQubeEnv
    if (qg.status != 'OK') {
      error "Pipeline aborted due to quality gate failure: ${qg.status}"
    }
  }
}
    }
  }
}
    }

