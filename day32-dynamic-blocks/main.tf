resource "aws_security_group" "dynamic_sg" {

  name_prefix = "day32-dynamic"

  vpc_id = data.aws_vpc.default.id

  dynamic "ingress" {

    for_each = var.allowed_ports

    content {

      from_port = ingress.value

      to_port = ingress.value

      protocol = "tcp"

      cidr_blocks = [
        "0.0.0.0/0"
      ]

      description = "Port ${ingress.value}"
    }
  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  tags = {

    Name = "Day32-Dynamic-SG"
  }
}
