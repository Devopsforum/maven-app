pipeline {
  agent any
  environment {
    PASS = credentials('registry-pass')
  }
  
  stages {
      stage('Build') {
          steps {
              sh '''
                ./jenkins/build/mvn.sh mvn -B -DskipTests clean package
                ./jenkins/build/build.sh
              '''
          }
          post {
              success {
                  archiveArtifacts artifacts: 'java-app/target/*.jar', fingerprint: true
              }
          }
      }
    stage('Test') {
        steps {
            sh './jenkins/test/mvn.sh mvn clean test'
        }
    }
    stage('Push') {
        steps {
            sh './jenkins/push/push.sh'
        }
     }   
     stage('Deploy'){
     		 steps {
					  sh '''
						  echo 'Inside Deploy stage'
						  ./jenkins/deploy/deploy.sh
					    '''
             }
	  		 }
     }
          
}
