pipeline {
	agent {
        	label 'main_build'
    	}
	parameters {
		string(name: 'PR_Number', defaultValue: '', description: 'Pull Request Number')
		string(name: 'GITHUB_REPO_OWNER', defaultValue: '', description: 'GitHub Repository Owner')
		string(name: 'GITHUB_REPO_NAME', defaultValue: '', description: 'GitHub Repository Name')
		string(name: 'Label', defaultValue: '', description: 'Label Name')
		string(name: 'SHA', defaultValue: '', description: 'SHA of the commit')
		string(name: 'pr_sourcebranch', defaultValue: '', description: 'Target Branch of PR')
	choice(name: 'BUILD_STATUS', choices: ['success', 'failure'], description: 'Build Status')
	}
    stages {
        stage('sync') {
            steps {
        	    script {
                        def prNumber = env.PR_NUMBER
                        def label = env.LABEL
                        def prUrl = "https://github.com/Hussain-ADevOps/AD-Steering-Control/pull/${prNumber}"
                        def description = """
                        <b>PR Number:</b> <a href='${prUrl}'>#${prNumber}</a><br>
                        <b>Label:</b> ${label}<br>
                        """
                        currentBuild.setDescription(description)
			//sh "git clone --recurse-submodules git@github.com:Hussain-ADevOps/AD-Steering-Control.git"
                        checkout scmGit(branches: [[name: env.pr_sourcebranch]], extensions: [submodule(recursiveSubmodules: true, reference: '')], userRemoteConfigs: [[credentialsId: 'Github_credentials_hussain', url: 'https://github.com/Hussain-ADevOps/AD-Steering-Control']])
                }
            }
        }
    
        stage('build') {
            steps {
        		echo "Build"
        		bat ".env/Build_jenkins_global.bat"   
            }
        }
	stage('NVMCheck') {
            steps {
                echo "Checking NV Memory "
            }
        }
	stage('GTest') {
            steps {
		    dir(".build/"){   
                	bat "call activate.bat && cmake --build . --target all_test"
		    }
            }
        }
	stage('archive_artifacts') {
            steps {
                echo "archive artifacts"
		bat '''tar -cvzf release.tar.gz .'''
		archiveArtifacts 'release.tar.gz'
            }
        }
	stage('Quality-Tools') {
            steps {
                echo "Generating QTools Reports"
            }
        }
    }   
    post {
        success {
            script {
                def url = 'https://de81-223-233-84-210.ngrok-free.app/jenkins/status'
                def payload = [
                    job_name: env.JOB_NAME,
                    build_status: 'success', // Always set to 'success' for success post
                    PR_Number: params.PR_Number,
                    Label: params.Label,
                    SHA: params.SHA,
                    jenkins_url: env.JENKINS_URL,
                    GITHUB_REPO_OWNER: params.GITHUB_REPO_OWNER,
                    GITHUB_REPO_NAME: params.GITHUB_REPO_NAME
                ]
                def response = httpRequest(
                    contentType: 'APPLICATION_JSON',
                    httpMode: 'POST',
                    requestBody: groovy.json.JsonOutput.toJson(payload),
                    url: url
                )
                echo "Response from API: ${response}"
            }
        }
        
        failure {
            script {
                def url = 'https://de81-223-233-84-210.ngrok-free.app/jenkins/status'
                def payload = [
                    job_name: env.JOB_NAME,
                    build_status: 'failure', // Always set to 'failure' for failure post
                    PR_Number: params.PR_Number,
                    Label: params.Label,
                    SHA: params.SHA,
                    jenkins_url: env.JENKINS_URL,
                    GITHUB_REPO_OWNER: params.GITHUB_REPO_OWNER,
                    GITHUB_REPO_NAME: params.GITHUB_REPO_NAME
                ]
                def response = httpRequest(
                    contentType: 'APPLICATION_JSON',
                    httpMode: 'POST',
                    requestBody: groovy.json.JsonOutput.toJson(payload),
                    url: url
                )
                echo "Response from API: ${response}"
            }
        }
    }    
}
