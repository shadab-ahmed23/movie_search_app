pipeline {
    agent any

    stages {
        stage('Code') {
            steps {
                echo 'Cloning the code from GitHub' 
                git url:"https://github.com/shadab-ahmed23/movie_search_app.git",branch:"master"
            }
        }
        stage('Build') {
            steps {
                echo 'Building the code from '
                sh "docker build - < Dockerfile ."
            }
        }
        stage('push to dockerHub') {
            steps {
                echo 'push the image to dockerHub'
                withCredentials([usernamePassword(credentialsId:"dockerHub",passwordVariable:"dockerHubPass",usernameVariable:"dockerHubUser")]){
                    sh "docker tag movie-app3 shadabahmed23/movie-app3:latest"
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                     sh "docker push shadabahmed23/movie-app3:latest"
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying the code'
                sh "docker-compose down && docker-compose up -d"
            }
        }
    }
}
