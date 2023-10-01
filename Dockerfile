
FROM jenkins/jenkins:lts

USER root

# Install necessary dependencies
RUN apt-get update && apt-get install -y wget unzip vim

# Download Terraform binary
RUN wget https://releases.hashicorp.com/terraform/1.5.7/terraform_1.5.7_linux_amd64.zip

# Unzip Terraform binary
RUN unzip terraform_1.5.7_linux_amd64.zip

# Move Terraform binary to a directory in the PATH
RUN mv terraform /usr/local/bin/

