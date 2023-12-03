pipeline {
    agent any
    stages {
        stage('Hello Jenkins') {
            steps {
                sh 'echo "hello world" '
            }
        }
        stage('Upload file') {
            steps {
                withAWS(credentials: 'my-cba-aws-credential', region: 'us-east-1') {
                    sh 'echo "hello again Cloudboosta Students">hello.txt'
                    s3Upload(pathStyleAccessEnabled: true, payloadSigningEnabled: true, file:'hello.txt', bucket:'cba-jenkinsbucket', path:'hello.txt')
                }
            }
        }
    }
}
