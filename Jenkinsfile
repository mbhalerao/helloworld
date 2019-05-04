pipeline {
    agent any

    stages {
	stage('Checkout scm') {
            steps {
		#Checking out helloworld repository
                sh 'git clone https://github.com/mbhalerao/helloworld.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn package'
		sh 'java -jar target/helloworld-0.0.1-SNAPSHOT.jar'
		#Build docker image
		sh 'mvn package docker:build'
            }
        }
	stage('Push Docker Image'){
	    steps{
		#Push docker image 
		sh 'docker login --username=test --email=test@company.com'
		sh 'docker push test/helloworld'
	    }
	}
        stage('Deploy docker image') {
            steps {
		sh 'docker login --username=test --email=test@company.com'
		sh 'docker pull helloworld'
                sh 'docker run -p 8080:8080 helloworld'
            }
        }
        stage('Deploy k8s') {
            steps {
                sh 'kubectl cluster-info'
		sh 'kubectl run helloworld --image= helloworld --port=8080
		#Check deployments
		sh 'sudo kubectl get deployments'
		#Get name of pod
		sh 'sudo kubectl get pods'
		sh 'sudo kubectl expose deployment/helloworld --type="NodePort" --port 8080'
		#Get ip
		sh 'minikube ip'
		#Go to your favorite browser and type:  http://ip/helloworld. 
		#You can see that the application is running and can be accessed from outside the Kubernetes cluster.
            }
        }
    }
}