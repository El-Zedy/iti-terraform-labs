terraform {
    backend "s3" {
      shared_config_files      = ["/aws/conf"]
      shared_credentials_files = ["/aws/creds"]
      bucket  = "terraform-backend-bucket-iti-test"
      dynamodb_table = "terraform-state-lock-iti-test"
      key     = "terraform.tfstate"
      region  = "us-east-1"
      encrypt = true
    }
}
