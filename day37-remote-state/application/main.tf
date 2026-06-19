data "aws_ami" "amazon_linux" {

  most_recent = true

  owners = ["amazon"]

  filter {

    name = "name"

    values = [
      "al2023-ami-2023*-x86_64"
    ]
  }
}

resource "aws_security_group" "web" {

  name_prefix = "day37"

  vpc_id = data.terraform_remote_state.network.outputs.vpc_id

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
}

resource "aws_instance" "web" {

  ami = data.aws_ami.amazon_linux.id

  instance_type = "t3.micro"

  subnet_id = data.terraform_remote_state.network.outputs.subnet_id

  vpc_security_group_ids = [
    aws_security_group.web.id
  ]

  key_name = "day28-key"

  tags = {
    Name = "Day37-RemoteState-EC2"
  }
}
