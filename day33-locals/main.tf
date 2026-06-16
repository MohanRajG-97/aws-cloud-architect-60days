resource "aws_security_group" "web" {

  name = "${local.name_prefix}-sg"

  vpc_id = data.aws_vpc.default.id

  ingress {

    from_port = 22

    to_port = 22

    protocol = "tcp"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  tags = local.common_tags
}

resource "aws_instance" "web" {

  ami = data.aws_ami.amazon_linux.id

  instance_type = "t3.micro"

  subnet_id = data.aws_subnets.default.ids[0]

  vpc_security_group_ids = [
    aws_security_group.web.id
  ]

  key_name = "day28-key"

  tags = merge(

    local.common_tags,

    {
      Name = "${local.name_prefix}-ec2"
    }
  )
}
