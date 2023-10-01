terraform {
    backend "s3" {
      bucket  = "terraform-backend-bucket-iti-test"
      dynamodb_table = "terraform-state-lock-iti-test"
      key     = "terraform.tfstate"
      region  = "us-east-1"
      encrypt = true
    }
}
