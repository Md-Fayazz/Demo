pipeline {
	agent none
    stages {
        stage('sync') {
            steps {
        	          echo "syncing Repo"
		    // git branch: 'main', credentialsId: 'Github_credentials_hussain', url: 'git@github.com:Hussain-ADevOps/AD-Steering-Control.git'
		    //
            }
        }
    
        stage('build') {
            steps {
        		echo "Build"
        		//bat "./Env/ConanEnvironment.bat"
            }
        }
      	stage('parallel') {
                  steps {
                      echo "executing parallel job"
                  }
              }
      	stage('MemoryValidation') {
                  steps {
                      echo "Validating Memory"
                  }
              }
        stage('GenMetrics') {
                  steps {
                      echo "Genrating Metrics"
                  }
              }
        stage('BuildVerificationTest') {
                  steps {
                      echo "Running Build Verfication Test"
                  }
              }
        stage('GTest') {
                  steps {
                      echo "Running Gtest"
                  }
              }
        stage('Archive&Upload') {
                  steps {
                      echo "Uploading..."
                  }
              }
          }     
}
