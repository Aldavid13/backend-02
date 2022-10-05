pipeline {
    agent any
    environment {
        registry = "<dockerhub-username>/<repo-name>"
        registryCredential = '<dockerhub-credential-name>'
    }
    tools {
        gradle "GRADLE7"
        jdk "openjdk17"
    }

    stages {
        stage('Descargar Git') {
            steps {
                   git credentialsId: '726eb245-32d1-4417-ab4a-0033fdd16e5e', url: 'https://github.com/Aldavid13/backend-02.git'  
                   }
        }
        stage('Build Gradle') {
            steps {
                sh 'gradle build'
                   }
        }
        
        stage('Change Variable tag') {
            steps {
                sh '''ls -la
                        sed -i "s|tag|$BUILD_NUMBER|g" deployment-services-backend-02-jenkins.yaml'''
                   }
        }
        
       stage('Building image') {
           steps {
            step([$class: 'DockerBuilderPublisher', cleanImages: true, cleanupWithJenkinsJobDelete: false, cloud: 'docker', dockerFileDirectory: '.', fromRegistry: [credentialsId: 'dockerhub', url: 'https://hub.docker.com/repository/docker/aldavid/backend-02'], pushCredentialsId: 'dockerhub', pushOnSuccess: true, tagsString: '''aldavid/backend-02:$BUILD_NUMBER
                aldavid/backend-02:latest'''])

           }
        
        }
       
        
        stage('Deploy backend-02-jenkins App') {
            steps {
                withCredentials(bindings: [
                      string(credentialsId: 'minikube-jenkins', variable: 'api_token')
                      ]) {
                        sh 'kubectl --token $api_token --server https://192.168.49.2:8443 --insecure-skip-tls-verify=true apply -f deployment-services-backend-02-jenkins.yaml '
                        }

            }
      }
        
    }
}

