provider "aws" {
  shared_config_files      = ["/root/.aws/config"]
  shared_credentials_files = ["/root/.aws/credentials"]
  region  = "us-east-1"
  profile                  = "default"
}
