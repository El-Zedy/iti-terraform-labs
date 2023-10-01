resource "aws_vpc" "main-vpc" {
  cidr_block       = var.vpc_cidr
  tags = {
    Name = "vpc-lab1-${var.env}"
  }
}