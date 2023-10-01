pipeline {
    agent any
    
    parameters {
        choice(name: 'ENVIRONMENT', choices: ['dev', 'prod'], description: 'Select the environment to deploy (dev or prod)')
    }
    
    stages {
        
        stage('Terraform Init') {
            steps {
                script {
                    // Set Terraform environment variables based on the selected environment
                    if (params.ENVIRONMENT == 'dev' && env.GIT_BRANCH == 'dev') {
                        env.TF_VAR_environment=dev
                    } else if (params.ENVIRONMENT == 'prod' && env.GIT_BRANCH == 'prod') {
                        env.TF_VAR_environment=prod
                    } else {
                        error 'Invalid environment selected'
                    }
                    sh '''
                        terraform init
                        terraform workspace select $TF_VAR_environment || terraform workspace new TF_VAR_environment
                        terraform workspace list
                    '''
                }
            }
        }
        
        stage('Terraform Apply') {
            steps {
                script {
                    // Plan and apply Terraform changes
                    sh '''
                        terraform plan -var-file ${env.TF_VAR_environment}.tfvars
                        terraform apply -var-file ${env.TF_VAR_environment}.tfvars -auto-approve
                    '''
                }
            }
        }
    }
    
    post {
        success {
            // Add post-build actions if needed
            echo 'Deployment successful'
        }
        failure {
            // Add post-build actions for failure cases
            echo 'Deployment failed'
        }
    }
}
