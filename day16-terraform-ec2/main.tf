terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.0.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "web_sg" {
  name        = "day16-web-sg"
  description = "Allow SSH and HTTP"

  ingress {
    description = "SSH"

    from_port   = 22
    to_port     = 22

    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"

    from_port   = 80
    to_port     = 80

    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0

    protocol    = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "day16-web-sg"
  }
}

resource "aws_instance" "web_server" {

  ami           = var.ami_id

  instance_type = var.instance_type

  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = <<-EOF
              #!/bin/bash

              yum install httpd -y

              systemctl start httpd

              systemctl enable httpd

              echo "Day 16 Terraform EC2" > /var/www/html/index.html
              EOF

  tags = {
    Name = "Day16TerraformEC2"
  }
}
