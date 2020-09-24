pipeline {
        agent any
        environment {
			PASS = credentials('registry-pass')
        }
        stages {
			stage('Build') {
				steps {
					sh '''
						echo 'inside build stage'
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
					sh '''
						echo 'Inside Test stage'
                        ./jenkins/test/mvn.sh mvn test
                       '''
					 }
					 post {
						always {
							junit 'java-app/target/surefire-reports/*.xml'
                           }
					}

              }
             stage('Push') {
				steps {
					sh '''
						echo "Inside push stage"'
                        ./jenkins/push/push.sh
                       '''
                      }
				}
             stage('Deploy') {
				steps {
					sh '''
						echo 'Inside Deploy stage'
						./jenkins/deploy/deploy.sh
					    '''
                }
			}
       }
}
