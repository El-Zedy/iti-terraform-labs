# ITI-Terraform-Labs
### Lab1

`Networking`

1. create vpv
2. create internet gateway
3. create public route table
4. create private route table
5. create public route
6. attach public route table to subnets

`Compute`

7. create security group which allow ssh from 0.0.0.0/0
8. create security group that allow ssh and port 3000 from vpc cidr only
7. create ec2(bastion) in public subnet with security group from 7
8. create ec2(application) private subnet with security group from 8

### Lab2

1. create two workspaces dev and prod
2. create two variable definition files(.tfvars) for the two environments
3. separate network resources into network module
4. apply your code to create two environments one in us-east-1 and eu-central-1
5. run local-exec provisioner to print the public_ip of bastion ec2
6. upload infrastructure code on github project
7. verify your email in ses (Simple Email Service)
8. create lambda function to send email
9. create trigger to detect changes in state file and send the email
10. create rds
11. create elastic cache
