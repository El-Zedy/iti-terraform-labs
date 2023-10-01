provider "aws" {
  shared_config_files      = ["/aws/conf"]
  shared_credentials_files = ["/aws/creds"]
  region  = "us-east-1"
}
