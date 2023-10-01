pipeline {
    agent any
        stages {
            stage('Set Environment') {
                steps {
                    script {
                        
                        if (env.GIT_BRANCH == 'dev') {
                            sh 'export TF_VAR_environment=dev'
                        } else if (env.GIT_BRANCH == 'prod') {
                            sh 'export TF_VAR_environment=prod'
                        } else {
                            error 'Invalid branch name. Supported branches are "dev" and "prod".'
                        }
                    }
                }
            }
            
            stage('Terraform Init') {
                steps {
                    script {
                        // Initialize Terraform
                        sh 'terraform init'
                        
                        // Check if the Terraform workspace exists, and create it if it doesn't
                        sh "terraform workspace select ${TF_VAR_environment} || terraform workspace new ${TF_VAR_environment}"
                    }
                }
            }
            
            stage('Terraform Apply') {
                steps {
                    script {
                        // Plan and apply Terraform changes
                        sh "terraform plan -var-file ${TF_VAR_environment}.tfvars" 
                        sh "terraform apply -var-file ${TF_VAR_environment}.tfvars -auto-approve"
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
