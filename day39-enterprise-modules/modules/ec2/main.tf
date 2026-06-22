data "aws_ami" "amazon_linux" {

  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-x86_64"]
  }
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

resource "aws_security_group" "ec2_sg" {

  name_prefix = "${var.instance_name}-sg"

  vpc_id = data.aws_vpc.default.id

  ingress {

    from_port = 22
    to_port   = 22

    protocol = "tcp"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  egress {

    from_port = 0
    to_port   = 0

    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  tags = {
    Name        = "${var.instance_name}-sg"
    Environment = var.environment
  }
}

resource "aws_instance" "this" {

  ami = data.aws_ami.amazon_linux.id

  instance_type = var.instance_type

  subnet_id = data.aws_subnets.default.ids[0]

  vpc_security_group_ids = [
    aws_security_group.ec2_sg.id
  ]

  key_name = "day28-key"

  tags = {
    Name        = var.instance_name
    Environment = var.environment
  }
}
