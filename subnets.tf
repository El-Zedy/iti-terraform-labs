resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = var.public1_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "public-1-${var.env}"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = var.public2_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "public-2-${var.env}"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = var.private1_cidr
  availability_zone = "us-east-1a"
  tags = {
    Name = "private-1-${var.env}"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = var.private2_cidr
  availability_zone = "us-east-1b"
  tags = {
    Name = "private-2-${var.env}"
  }
}