resource "aws_security_group" "web" {

  name_prefix = "day36"

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
}

resource "aws_s3_bucket" "protected" {

  bucket = "mohanraj-day36-lifecycle-unique-98765"

  lifecycle {

    prevent_destroy = false
  }
}

resource "aws_instance" "web" {

  ami = data.aws_ami.amazon_linux.id

  instance_type = "t3.small"

  subnet_id = data.aws_subnets.default.ids[0]

  vpc_security_group_ids = [
    aws_security_group.web.id
  ]

  key_name = "day28-key"

  tags = {

    Name = "Day36-EC2"
  }

  lifecycle {

    create_before_destroy = true

    ignore_changes = [
      tags
    ]
  }
}
