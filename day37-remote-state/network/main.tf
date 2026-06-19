resource "aws_vpc" "main" {

  cidr_block = "10.37.0.0/16"

  tags = {
    Name = "Day37-VPC"
  }
}

resource "aws_subnet" "public" {

  vpc_id = aws_vpc.main.id

  cidr_block = "10.37.1.0/24"

  tags = {
    Name = "Day37-Public-Subnet"
  }
}
