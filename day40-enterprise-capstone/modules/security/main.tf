resource "aws_security_group" "alb" {

  name = "enterprise-alb-sg"

  description = "ALB Security Group"

  vpc_id = var.vpc_id

  ingress {

    from_port = 80
    to_port   = 80

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

  tags = merge(
    var.common_tags,
    {
      Name = "enterprise-alb-sg"
    }
  )
}

resource "aws_security_group" "web" {

  name = "enterprise-web-sg"

  description = "Web Server Security Group"

  vpc_id = var.vpc_id

  ingress {

    from_port = 80
    to_port   = 80

    protocol = "tcp"

    security_groups = [
      aws_security_group.alb.id
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

  tags = merge(
    var.common_tags,
    {
      Name = "enterprise-web-sg"
    }
  )
}
