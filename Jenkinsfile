pipeline {
    agent any
    
    parameters {
        choice(name: 'ENVIRONMENT', choices: ['dev', 'prod'], description: 'Select the environment to deploy (dev or prod)')
    }
    stages {
        
        stage('Terraform Init') {
            steps {
                script {
                    sh 'echo $BRANCH_NAME'
                    // Set Terraform environment variables based on the selected environment
                    if (params.ENVIRONMENT == 'dev' && env.BRANCH_NAME == 'dev') {
                        env.TF_VAR_environment = 'dev' // Use single quotes to specify string literals
                    } else if (params.ENVIRONMENT == 'prod' && env.BRANCH_NAME == 'prod') {
                        env.TF_VAR_environment = 'prod' // Use single quotes to specify string literals
                    } else {
                        error 'Invalid environment selected'
                    }

                    sh 'terraform init'
                    
                    // Check if the Terraform workspace exists
                    def workspaceExists = sh(script: 'terraform workspace list | grep -q $TF_VAR_environment', returnStatus: true)
                    
                    if (workspaceExists == 0) {
                        echo "Workspace $TF_VAR_environment already exists"
                        sh "terraform workspace select $TF_VAR_environment"
                    } else {
                        // Create the Terraform workspace
                        sh "terraform workspace new $TF_VAR_environment"
                        echo "Workspace $TF_VAR_environment created"
                    }
                }
            }
        }
        
        stage('Terraform Apply') {
            steps {
                script {
                    // Plan and apply Terraform changes
                    sh "terraform plan"
                    sh  "terraform apply -var-file $TF_VAR_environment.tfvars -auto-approve"
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
